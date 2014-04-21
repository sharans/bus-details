class BusLocation < ActiveRecord::Base
  before_create :set_created_time
  before_save :set_updated_time

  def set_created_time
    created_at = Time.now
  end

  def set_updated_time
    updated_at = Time.now
  end

end