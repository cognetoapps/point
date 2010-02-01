module Point
  class Zone < Base
    
    def apply!
      post(:apply)
    end
    
    def records
      ZoneRecord.find(:all, :zone => self)
    end
    
    def record(id)
      ZoneRecord.find(id, :zone => self)
    end
    
    def build_record(attributes = {})
      z = ZoneRecord.new
      z.attributes = attributes if attributes.is_a?(Hash)
      z.zone = self
      z
    end
    
    def requires_update?
      Time.parse(self.updated_at) > Time.parse(self.last_updated_on_server_at)
    end
  end
end
