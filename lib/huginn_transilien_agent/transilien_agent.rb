module Agents
  class TransilienAgent < Agent
    include FormConfigurable
    can_dry_run!
    no_bulk_receive!
    default_schedule 'every_1h'

    description <<-MD
      The Transilien Agent interacts with Transilien's API.

      The `type` can be like itinerary.

      `debug` is for adding verbosity.

      `token` is needed for authentication.

      `src` is for the departure.

      `dst` is for the direction / arrival.

      `expected_receive_period_in_days` is used to determine if the Agent is working. Set it to the maximum number of days
      that you anticipate passing without this Agent receiving an incoming Event.
    MD

    event_description <<-MD
      Events look like this:

          {
            "route": {
              "id": "route:SNCF:C",
              "name": "C",
              "is_frequence": "False",
              "direction_type": "forward",
              "physical_modes": [
                {
                  "id": "physical_mode:RapidTransit",
                  "name": "RER / Transilien"
                }
              ],
              "direction": {
                "id": "stop_area:SNCF:87393157",
                "name": "Versailles Château Rive Gauche (Versailles)",
                "quality": 0,
                "stop_area": {
                  "id": "stop_area:SNCF:87393157",
                  "name": "Versailles Château Rive Gauche",
                  "codes": [
                    {
                      "type": "source",
                      "value": "87393157"
                    },
                    {
                      "type": "uic",
                      "value": "87393157"
                    }
                  ],
                  "timezone": "Europe/Paris",
                  "label": "Versailles Château Rive Gauche (Versailles)",
                  "coord": {
                    "lon": "2.128827",
                    "lat": "48.800364"
                  },
                  "links": [
        
                  ]
                },
                "embedded_type": "stop_area"
              },
              "geojson": {
                "type": "MultiLineString",
                "coordinates": [
        
                ]
              },
              "links": [
        
              ],
              "line": {
                "id": "line:SNCF:C",
                "name": "C",
                "code": "C",
                "color": "FCD946",
                "text_color": "FFFFFF",
                "codes": [
        
                ],
                "physical_modes": [
                  {
                    "id": "physical_mode:RapidTransit",
                    "name": "RER / Transilien"
                  }
                ],
                "commercial_mode": {
                  "id": "commercial_mode:TNRER",
                  "name": "RER"
                },
                "opening_time": "033840",
                "closing_time": "014100",
                "geojson": {
                  "type": "MultiLineString",
                  "coordinates": [
        
                  ]
                },
                "links": [
        
                ]
              }
            },
            "stop_point": {
              "id": "stop_point:SNCF:87545350:RapidTransit",
              "name": "Saint-Martin d'Étampes",
              "label": "Saint-Martin d'Étampes (Étampes)",
              "coord": {
                "lon": "2.145401",
                "lat": "48.42747"
              },
              "links": [
        
              ],
              "commercial_modes": [
                {
                  "id": "commercial_mode:TNRER",
                  "name": "RER"
                }
              ],
              "physical_modes": [
                {
                  "id": "physical_mode:RapidTransit",
                  "name": "RER / Transilien",
                  "co2_emission_rate": {
                    "value": 7.28,
                    "unit": "gEC/Km"
                  }
                }
              ],
              "administrative_regions": [
                {
                  "id": "admin:fr:91223",
                  "name": "Étampes",
                  "level": 8,
                  "zip_code": "91150",
                  "label": "Étampes (91150)",
                  "insee": "91223",
                  "coord": {
                    "lon": "2.1614464",
                    "lat": "48.4344621"
                  }
                }
              ],
              "stop_area": {
                "id": "stop_area:SNCF:87545350",
                "name": "Saint-Martin d'Étampes",
                "codes": [
                  {
                    "type": "source",
                    "value": "87545350"
                  },
                  {
                    "type": "uic",
                    "value": "87545350"
                  }
                ],
                "timezone": "Europe/Paris",
                "label": "Saint-Martin d'Étampes (Étampes)",
                "coord": {
                  "lon": "2.145401",
                  "lat": "48.42747"
                },
                "links": [
        
                ],
                "administrative_regions": [
                  {
                    "id": "admin:fr:91223",
                    "name": "Étampes",
                    "level": 8,
                    "zip_code": "91150",
                    "label": "Étampes (91150)",
                    "insee": "91223",
                    "coord": {
                      "lon": "2.1614464",
                      "lat": "48.4344621"
                    }
                  }
                ]
              },
              "equipments": [
        
              ]
            },
            "stop_date_time": {
              "departure_date_time": "20230902T111900",
              "base_departure_date_time": "20230902T111900",
              "arrival_date_time": "20230902T111900",
              "base_arrival_date_time": "20230902T111900",
              "additional_informations": [
        
              ],
              "links": [
        
              ],
              "data_freshness": "base_schedule"
            },
            "display_informations": {
              "commercial_mode": "RER",
              "network": "RER",
              "direction": "Musée d'Orsay (Paris)",
              "label": "C",
              "color": "FCD946",
              "code": "C",
              "name": "C",
              "links": [
        
              ],
              "text_color": "FFFFFF",
              "description": "",
              "physical_mode": "RER / Transilien",
              "equipments": [
        
              ],
              "headsign": "ORET",
              "trip_short_name": "145406"
            },
            "links": [
              {
                "type": "line",
                "id": "line:SNCF:C"
              },
              {
                "type": "vehicle_journey",
                "id": "vehicle_journey:SNCF:2023-09-02:145406:1187:RapidTransit"
              },
              {
                "type": "route",
                "id": "route:SNCF:C"
              },
              {
                "type": "commercial_mode",
                "id": "commercial_mode:TNRER"
              },
              {
                "type": "physical_mode",
                "id": "physical_mode:RapidTransit"
              },
              {
                "type": "network",
                "id": "network:SNCF:TNRER"
              }
            ]
          }
    MD

    def default_options
      {
        'type' => 'nextdeparture',
        'token' => '',
        'src' => '',
        'dst' => '',
        'date' => '',
        'time' => '',
        'debug' => 'false',
        'expected_receive_period_in_days' => '2',
        'changes_only' => 'true'
      }
    end

    form_configurable :debug, type: :boolean
    form_configurable :token, type: :string
    form_configurable :src, type: :string
    form_configurable :dst, type: :string
    form_configurable :date, type: :string
    form_configurable :time, type: :string
    form_configurable :expected_receive_period_in_days, type: :string
    form_configurable :changes_only, type: :boolean
    form_configurable :type, type: :array, values: ['itinary', 'nextdeparture', 'traffic_reports']
    def validate_options
      errors.add(:base, "type has invalid value: should be 'itinary' 'nextdeparture' 'traffic_reports'") if interpolated['type'].present? && !%w(itinary nextdeparture traffic_reports).include?(interpolated['type'])

      unless options['src'].present? || !['itinary', 'nextdeparture'].include?(options['type'])
        errors.add(:base, "src is a required field")
      end

      unless options['dst'].present? || !['itinary', 'nextdeparture'].include?(options['type'])
        errors.add(:base, "dst is a required field")
      end

      unless options['token'].present? || !['itinary', 'nextdeparture', 'traffic_reports'].include?(options['type'])
        errors.add(:base, "token is a required field")
      end

      if options.has_key?('changes_only') && boolify(options['changes_only']).nil?
        errors.add(:base, "if provided, changes_only must be true or false")
      end

      if options.has_key?('debug') && boolify(options['debug']).nil?
        errors.add(:base, "if provided, debug must be true or false")
      end

      unless options['expected_receive_period_in_days'].present? && options['expected_receive_period_in_days'].to_i > 0
        errors.add(:base, "Please provide 'expected_receive_period_in_days' to indicate how many days can pass before this Agent is considered to be not working")
      end
    end

    def working?
      event_created_within?(options['expected_receive_period_in_days']) && !recent_error_logs?
    end

    def check
      trigger_action
    end

    private

    def log_curl_output(code,body)

      log "request status : #{code}"

      if interpolated['debug'] == 'true'
        log "body"
        log body
      end

    end

    def search_station(base_url,city)

      uri = URI.parse("https://api.sncf.com/v1/coverage/sncf/pt_objects?q=#{city}'")
      request = Net::HTTP::Get.new(uri)
      request["Authorization"] = interpolated['token']

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      log_curl_output(response.code,response.body)

      log response.body.class
      parsed = JSON.parse(response.body)
      return parsed

    end

    def search_city(base_url,city)

      uri = URI.parse("#{base_url}places?search=#{city}")
      request = Net::HTTP::Get.new(uri)
      request["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0"
      request["Accept"] = "application/json, text/plain, */*"
      request["Accept-Language"] = "fr,fr-FR;q=0.8,en-US;q=0.5,en;q=0.3"
      request["Connection"] = "keep-alive"
      request["Sec-Fetch-Dest"] = "empty"
      request["Sec-Fetch-Mode"] = "cors"
      request["Sec-Fetch-Site"] = "same-origin"
      request["Dnt"] = "1"
      request["Pragma"] = "no-cache"
      request["Cache-Control"] = "no-cache"
      request["Te"] = "trailers"
      
      req_options = {
        use_ssl: uri.scheme == "https",
      }
      
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      log_curl_output(response.code,response.body)

      log response.body.class
      parsed = JSON.parse(response.body)
      return parsed['places'][0]

    end


    def nextdeparture(base_url)

      src = search_station(base_url,interpolated['src'])
      if interpolated['debug'] == 'true'
        log "src"
        log src
      end
      dst = search_station(base_url,interpolated['dst'])
      if interpolated['debug'] == 'true'
        log "dst"
        log dst
      end

      stop_area = CGI.escape(src['pt_objects'][0]['id']) if src['pt_objects'][0]['id'].present?
      log stop_area
      uri = URI.parse("#{base_url}coverage/sncf/stop_areas/#{stop_area}/departures")
      request = Net::HTTP::Get.new(uri)
      request["Authorization"] = interpolated['token']

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      log_curl_output(response.code,response.body)

      payload = JSON.parse(response.body)
      payload['departures'].each do | train |
        log train['display_informations']['direction']
        log dst['pt_objects'][0]['name']
        if train['display_informations']['direction'] == dst['pt_objects'][0]['name']
          create_event payload: train
        end
      end
    end

    def traffic_reports(base_url)

      uri = URI.parse("#{base_url}coverage/sncf/traffic_reports")
      request = Net::HTTP::Get.new(uri)
      request["Authorization"] = interpolated['token']

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      log_curl_output(response.code,response.body)

      payload = JSON.parse(response.body)
      payload['disruptions'].each do | disruption |
        create_event payload: disruption
      end

    end

    def itinary(base_url)

      src = search_city(base_url,interpolated['src'])
      if interpolated['debug'] == 'true'
        log "src"
        log src
      end
      dst = search_city(base_url,interpolated['dst'])
      if interpolated['debug'] == 'true'
        log "dst"
        log dst
      end

      data = {}
      data["departure"] = src['name'] if src['name'].present?
      data["departureId"] = src['id'] if src['id'].present?
#      data[""] = src[''] if src[''].present?
#      data[""] = dst[''] if dst[''].present?
      data["arrival"] = dst['name'] if dst['name'].present?
      data["arrivalId"] = dst['id'] if dst['id'].present?
      data["departureLatitude"] = src['coord']['lat'] if src['coord']['lat'].present?
      data["departureLongitude"] = src['coord']['lon'] if src['coord']['lon'].present?
      data["arrivalLatitude"] = dst['coord']['lat'] if dst['coord']['lat'].present?
      data["arrivalLongitude"] = dst['coord']['lon'] if dst['coord']['lon'].present?
      data["dateType"] = "DEPARTURE"
      data["formAction"] = false
      data["haveBusBypassed"] = false
      date_now = DateTime.now
      if interpolated['date'].empty?
        data["date"] = date_now.strftime("%Y-%m-%d")
      else
        data["date"] = interpolated['date']
      end
      if interpolated['time'].empty?
        data["time"] = date_now.strftime("%H:%M")
      else
        data["time"] = interpolated['time']
      end

      uri = URI.parse("#{base_url}itinerary/search")
      request = Net::HTTP::Post.new(uri)
      request.content_type = "application/json"
      request["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0"
      request["Accept"] = "application/json, text/plain, */*"
      request["Accept-Language"] = "fr,fr-FR;q=0.8,en-US;q=0.5,en;q=0.3"
      request["Origin"] = "https://www.transilien.com"
      request["Connection"] = "keep-alive"
      request.body = data.to_json
      
      req_options = {
        use_ssl: uri.scheme == "https",
      }
      
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      log_curl_output(response.code,response.body)

      if interpolated['emit_events'] == 'true'
        create_event payload: response.body
      end
      payload = JSON.parse(response.body)
      if interpolated['date'].empty?
        ttime = date_now.strftime("%Y-%m-%d")
      else
        ttime = interpolated['date']
      end
      payload['journeys'][ttime].each do | train |
        create_event payload: train
      end
    end


    def trigger_action()

      base_url_auth = 'https://api.sncf.com/v1/'
      case interpolated['type']
      when "itinary"
        itinary(base_url_auth)
      when "nextdeparture"
        nextdeparture(base_url_auth)
      when "traffic_reports"
        traffic_reports(base_url_auth)
      else
        log "Error: type has an invalid value (#{type})"
      end
    end
  end
end
