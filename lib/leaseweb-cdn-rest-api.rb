#!/usr/bin/env ruby

require 'digest/sha1'
require 'httparty'

class LeasewebCDN
  include HTTParty
  #debug_output $stderr
  
  base_uri 'https://api.leasewebcdn.com'
  
  def initialize (key, customerNumber)
    @key = key
    @customerNumber = customerNumber.to_s
  end
  
  def create_url (path)
    path = path.gsub("#customerNumber", @customerNumber)
    timestamp = Time.now.utc.to_i
    signature = Digest::SHA1.hexdigest("#{@key}#{timestamp}#{path}")
  
    return "#{path}/#{timestamp}/#{signature}"
  end
  
  def zone (zoneID = 'all', type = 'pull')
    self.class.get create_url("/zones/#{type}/#customerNumber/#{zoneID}")
  end
  
  def update_zone (zoneID, zone, type = 'pull')
    self.class.post(create_url("/zones/#{type}/#customerNumber/#{zoneID}"), :body => zone )
  end
  
  def delete_zone (zoneID, type = 'pull')
    self.class.delete create_url("/zones/#{type}/#customerNumber/#{zoneID}")
  end
  
  def stats_cname (type, granularity, timestamp_start, timestamp_end, cname = 'all')
    self.class.get create_url("/stats/#{type}/#customerNumber/#{granularity}/#{timestamp_start}/#{timestamp_end}/#{cname}")
  end
  
  def stats_country_pop (type, granularity, timestamp_start, timestamp_end, cname, country, pop)
    self.class.get create_url("/stats/#{type}/#customerNumber/#{granularity}/#{timestamp_start}/#{timestamp_end}/#{cname}/#{country}/#{pop}")
  end
  
  def stats_billing_region (type, granularity, timestamp_start, timestamp_end, cname, country, pop)
    self.class.get create_url("/stats/#{type}/#customerNumber/#{granularity}/#{timestamp_start}/#{timestamp_end}/#{cname}/#{country}/#{pop}")
  end
  
  def stats_apicalls (year, month)
    self.class.get create_url("/stats/api/#customerNumber/#{year}/#{month}")
  end
  
  def avg_traffic
    self.class.get create_url("/stats/traffic/#customerNumber")
  end
  
  def nine_five_percentile (billing_region, timestamp_start, timestamp_end)
    self.class.get create_url("/stats/95thpercentile/#customerNumber/#{billing_region}/#{timestamp_start}/#{timestamp_end}")
  end
  
  def nine_five_percentile_points (billing_region, timestamp_start, timestamp_end)
    self.class.get create_url("/stats/95thpercentilepoints/#customerNumber/#{billing_region}/#{timestamp_start}/#{timestamp_end}")
  end
  
  def purge_status (zoneID, jobID)
    self.class.get create_url("/content/purge/#customerNumber/#{zoneID}/#{jobID}")
  end
  
  def purge (zoneID, expression)
    self.class.delete create_url("/content/purge/#customerNumber/#{zoneID}/#{expression}")
  end
  
  def search (query, zone_type = 'pull')
    self.class.get create_url("/search/#{zone_type}/#customerNumber/#{query}")
  end
  
  def version
    self.class.get create_url("/version")
  end
end
