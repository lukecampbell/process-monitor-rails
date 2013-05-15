class SystemProcessesController < ApplicationController
  def index
    @procs = `ps -ww -e -o pid=,comm=`.strip.split("\n").map do |x|
      pid, comm = x.split()
      {
        pid: pid.to_i,
        comm: comm
      }
    end
  end

  def new
    pid = params[:pid]
    comm = params[:comm]
    @proc = SystemProcess.new
    @proc.id = pid
    @proc.command = comm
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
      redirect_to system_process_path pid
    end
  end
end
