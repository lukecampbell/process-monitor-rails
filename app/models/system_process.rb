class SystemProcess < ActiveRecord::Base
  attr_accessible :command, :id, :name, :user
  has_many :process_stats
end
