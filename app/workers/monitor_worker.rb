class MonitorWorker
  @queue = :monitor_queue
  
  def self.perform(process_id, tlen, interval)
    puts "Monitoring #{process_id} for #{tlen} seconds, every #{interval} seconds"
    end_time = Time.new + tlen
    never_finish = (tlen == 0)
    if (interval < 1)
      interval = 1
    end
    if never_finish
      puts "This worker will run FOREVER"
    end

    while (Time.new < end_time) or never_finish
      if not self.do_work process_id
        break
      end
      sleep interval
    end
  end
  
  def self.do_work(process_id)
    if not SystemProcess.exists? process_id
      return false
    end
    rss, pmem, pcpu = `ps -ww -p #{process_id} -o rss=,pmem=,pcpu=`.strip.split
    proc_stat = ProcessStat.new
    proc_stat.rss = rss.to_f
    proc_stat.pmem = pmem.to_f
    proc_stat.pcpu = pcpu.to_f
    proc_stat.system_process_id = process_id
    if not proc_stat.save
      raise 'Unable to publish information'
    end
    return true
  end
end

