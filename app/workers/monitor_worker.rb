class MonitorWorker
  @queue = :monitor_queue
  def self.perform(process_id)
    puts "I will monitor #{process_id}"
  end
end

