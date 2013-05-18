class SystemProcessesController < ApplicationController
  def list
    @procs = `ps -ww -e -o pid=,command=`.strip.split("\n").map do |x|
      args = x.split
      {
        pid: args[0].to_i,
        exists: SystemProcess.exists?(args[0].to_i),
        comm: args[1,args.length].join(' ')
      }
    end
  end

  
  def index
    @procs = SystemProcess.all
  end

  def new
    pid = params[:pid]
    comm = params[:comm]
    @proc = SystemProcess.new
    @proc.id = pid
    @proc.command = `ps -ww -p #{pid} -o command=`.strip
  end

  def show
    @proc = SystemProcess.find(params[:id])
    respond_to do |format|
      format.html { @stats = @proc.process_stats.limit(12).reverse_order }
      format.json do |r|
        stats = @proc.process_stats.limit(20)
        render :json => {:data=>stats.as_json}
      end
    end
  end

  def download
    @proc = SystemProcess.find(params[:id])
    stats = @proc.process_stats
    csv_data = "created_at,rss,pmem,pcpu\n"
    stats.each {|s| csv_data << "#{s.created_at},#{s.rss},#{s.pmem},#{s.pcpu}\n" }
    send_data csv_data, :filename => "#{@proc.id}.csv", :type => "text/csv"
  end

  def create
    pid      = params[:system_process][:id].to_i
    tlen     = params[:system_process][:time_length].to_i
    interval = params[:system_process][:interval].to_i
    comm     = params[:system_process][:command]
    @proc = SystemProcess.new
    @proc.id = pid
    @proc.command = comm
    @proc.time_length = tlen
    @proc.interval = interval
    if @proc.save
      Resque.enqueue(MonitorWorker, @proc.id, tlen, interval)
      redirect_to system_process_path pid
    else
      render :new
    end
  end

  def destroy
    @proc = SystemProcess.find(params[:id])
    @proc.destroy
    redirect_to list_path
  end
end
