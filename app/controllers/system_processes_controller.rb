class SystemProcessesController < ApplicationController
  def index
    @procs = `ps -ww -e -o pid=,command=`.strip.split("\n").map do |x|
      args = x.split
      {
        pid: args[0].to_i,
        comm: args[1,args.length].join(' ')
      }
    end
  end

  def new
    pid = params[:pid]
    comm = params[:comm]
    @proc = SystemProcess.new
    @proc.id = pid
    @proc.command = `ps -ww -p #{pid} -o command=`.strip
  end

  def show
  end

  def create
    pid = params[:system_process][:id].to_i
    comm = params[:system_process][:comm]

    @proc = SystemProcess.new
    @proc.id = pid
    @proc.command = comm
    if @proc.save
      Resque.enqueue(MonitorWorker, @proc.id)
      redirect_to system_process_path pid
    else
      render :new
    end
  end
end
