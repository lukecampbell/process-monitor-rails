class ProcessStat < ActiveRecord::Base
  attr_accessible :pcpu, :pmem, :system_process_id, :rss, :threads
  belongs_to :system_process
end
