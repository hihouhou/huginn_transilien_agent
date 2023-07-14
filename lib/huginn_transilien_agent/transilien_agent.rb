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

      `date` is if not at d day (ex : 2023-03-17).

      `time` is if not at t time (ex : 07:30).

      `src` is for the departure.

      `dst` is for the arrival.

      `expected_receive_period_in_days` is used to determine if the Agent is working. Set it to the maximum number of days
      that you anticipate passing without this Agent receiving an incoming Event.
    MD

    event_description <<-MD
      Events look like this:

          {
            "modeTransportEnum": "RER",
            "lineTransportEnum": "RER_C",
            "typeTrain": "LONG",
            "codeMission": "ELBA",
            "idPA": "8",
            "trainNumber": "147470-147471",
            "affluenceEnabled": true,
            "canceled": false,
            "departureDate": "2023-03-16",
            "departureTime": "20:10",
            "arrivalTime": "22:00",
            "destinationMission": "Saint-Martin d'Étampes",
            "platform": "A",
            "deservedStations": [
              {
                "label": "Saint-Quentin en Yvelines - Montigny-le-Bretonneux",
                "time": "20:10"
              },
              {
                "label": "Saint-Cyr",
                "time": "20:14"
              },
              {
                "label": "Versailles Chantiers",
                "time": "20:20"
              },
              {
                "label": "Viroflay Rive Gauche",
                "time": "20:24"
              },
              {
                "label": "Chaville - Vélizy",
                "time": "20:26"
              },
              {
                "label": "Meudon Val Fleury",
                "time": "20:31"
              },
              {
                "label": "Issy",
                "time": "20:34"
              },
              {
                "label": "Issy Val de Seine",
                "time": "20:37"
              },
              {
                "label": "Pont du Garigliano - Hôpital Européen G. Pompidou",
                "time": "20:40"
              },
              {
                "label": "Javel",
                "time": "20:43"
              },
              {
                "label": "Champ de Mars Tour Eiffel",
                "time": "20:46"
              },
              {
                "label": "Pont de l'Alma",
                "time": "20:49"
              },
              {
                "label": "Invalides",
                "time": "20:51"
              },
              {
                "label": "Musée d'Orsay",
                "time": "20:54"
              },
              {
                "label": "Paris Austerlitz",
                "time": "21:01"
              },
              {
                "label": "Bibliothèque François Mitterrand",
                "time": "21:04"
              },
              {
                "label": "Juvisy",
                "time": "21:18"
              },
              {
                "label": "Savigny-sur-Orge",
                "time": "21:22"
              },
              {
                "label": "Épinay-sur-Orge",
                "time": "21:25"
              },
              {
                "label": "Sainte-Geneviève-des-Bois",
                "time": "21:29"
              },
              {
                "label": "Saint-Michel-sur-Orge",
                "time": "21:32"
              },
              {
                "label": "Brétigny",
                "time": "21:36"
              },
              {
                "label": "Marolles-en-Hurepoix",
                "time": "21:40"
              },
              {
                "label": "Bouray",
                "time": "21:44"
              },
              {
                "label": "Lardy",
                "time": "21:48"
              },
              {
                "label": "Chamarande",
                "time": "21:51"
              },
              {
                "label": "Étréchy",
                "time": "21:54"
              },
              {
                "label": "Étampes",
                "time": "22:00"
              }
            ],
            "hasTraficDisruption": true,
            "hasTravauxDisruption": true,
            "disruptions": [
              {
                "id": null,
                "creationDate": null,
                "updateDate": "2023-03-16T06:18:00",
                "title": "Ligne C : mouvement social national 16 mars",
                "type": "TRAFIC",
                "severity": null,
                "validityPeriods": [
                  {
                    "startDate": "2023-03-16T04:00:00",
                    "endDate": "2023-03-17T02:30:00",
                    "now": true
                  }
                ],
                "detail": "<p>Jeudi 16 mars :<br><br>Le trafic de la ligne C est perturb&#233;.<br><br>Pr&#233;voir en moyenne 2 trains sur 3.<br><br>Dans la mesure du possible, nous vous recommandons de limiter vos d&#233;placements.<br><br>Le trafic devrait rester perturb&#233; vendredi 17 mars.<br><br>Pour pr&#233;parer votre trajet, rendez-vous la veille d&#232;s 17h sur le calculateur d'itin&#233;raires de l&#8217;appli Ile-de-France Mobilit&#233;s, le site Transilien.com et l&#8217;appli SNCF.<br><br>Avant de vous rendre en gare, nous vous conseillons de v&#233;rifier les horaires de vos trains.<br><br>Motif : mouvement social national interprofessionnel.<br></p>",
                "startingApplicationDate": "2023-03-16T04:00:00",
                "hasSubstitutionBus": false,
                "line": "C",
                "transport": {
                  "mode": "RER",
                  "line": {
                    "label": "RER_C",
                    "desc": null,
                    "code": "RER_C"
                  },
                  "overnightBus": false,
                  "substitution": false
                }
              },
              {
                "id": null,
                "creationDate": null,
                "updateDate": "2023-01-12T18:27:00",
                "title": "Ligne C : St-Michel Notre-Dame fermée 21/8-16/4/23",
                "type": "TRAVAUX",
                "severity": null,
                "validityPeriods": [
                  {
                    "startDate": "2022-08-21T03:00:00",
                    "endDate": "2023-04-17T02:00:00",
                    "now": true
                  }
                ],
                "detail": "<p>P&#233;riode : toute la journ&#233;e.<br><br>Dates : du dimanche 21 ao&#251;t 2022 au dimanche 16 avril 2023.<br><br>Les trains ne marquent pas l'arr&#234;t &#224; Saint-Michel Notre-Dame dans les deux sens.<br>La partie RATP desservie par le RER B et les correspondances des lignes de m&#233;tro 4 et 10 (station Cluny la Sorbonne) restent accessibles.</p><p><br>Les horaires du calculateur d'itin&#233;raire tiennent compte des travaux.<br><br>Motif : Travaux de modernisation de la gare.<br><br><br></p>",
                "startingApplicationDate": "2022-08-21T03:00:00",
                "hasSubstitutionBus": false,
                "line": "C",
                "transport": {
                  "mode": "RER",
                  "line": {
                    "label": "RER_C",
                    "desc": null,
                    "code": "RER_C"
                  },
                  "overnightBus": false,
                  "substitution": false
                }
              }
            ]
          }
    MD

    def default_options
      {
        'type' => 'nextdeparture',
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
    form_configurable :src, type: :string
    form_configurable :dst, type: :string
    form_configurable :date, type: :string
    form_configurable :time, type: :string
    form_configurable :expected_receive_period_in_days, type: :string
    form_configurable :changes_only, type: :boolean
    form_configurable :type, type: :array, values: ['itinary', 'nextdeparture']
    def validate_options
      errors.add(:base, "type has invalid value: should be 'itinary' 'nextdeparture'") if interpolated['type'].present? && !%w(itinary nextdeparture).include?(interpolated['type'])

      unless options['src'].present? || !['itinary', 'nextdeparture'].include?(options['type'])
        errors.add(:base, "src is a required field")
      end

      unless options['dst'].present? || !['itinary', 'nextdeparture'].include?(options['type'])
        errors.add(:base, "dst is a required field")
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

      log "test"

      uri = URI.parse("#{base_url}stopareas/#{city}")
      request = Net::HTTP::Get.new(uri)
      request["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0"
      request["Accept"] = "application/json, text/plain, */*"
      request["Accept-Language"] = "fr,fr-FR;q=0.8,en-US;q=0.5,en;q=0.3"
      request["Connection"] = "keep-alive"
      request["Referer"] = "https://www.transilien.com/fr/page-lignes/ligne-j"
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

      data = {}
      data["departure"] = src['label'] if src['label'].present?
      data["arrival"] = dst['label'] if dst['label'].present?
      data["prm"] = false
      data["uicArrival"] = dst['codeUic7'] if dst['codeUic7'].present?
      data["uicDeparture"] = src['codeUic7'] if src['codeUic7'].present?

      uri = URI.parse("#{base_url}nextDeparture/search")
      request = Net::HTTP::Post.new(uri)
      request.content_type = "application/json"
#      request["Authority"] = "www.transilien.com"
      request["Accept"] = "application/json, text/plain, */*"
#      request["Accept-Language"] = "fr;q=0.8"
#      request["Cache-Control"] = "no-cache"
#      request["Cookie"] = "TRI_city=AWS_PRD; SESS9fd2b737ae15de5f793cb3aba4d3583e=deleted; TRIPRD10CMS=tridenp101tricms; SESSd112ff168ce48c732b4e1e9108027db2=9iteaDl_or-fI_WIvzmMP2accRUgFJd8Ct_gwEcRmwk"
#      request["Origin"] = "https://www.transilien.com"
#      request["Pragma"] = "no-cache"
#      request["Referer"] = "https://www.transilien.com/fr/horaires/prochains-departs/?arrival=Paris+Saint-Lazare&departure=Herblay&prm=false&uicArrival=8738400&uicDeparture=8738188"
#      request["Sec-Fetch-Dest"] = "empty"
#      request["Sec-Fetch-Mode"] = "cors"
#      request["Sec-Fetch-Site"] = "same-origin"
#      request["Sec-Gpc"] = "1"
      request["User-Agent"] = "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0"
#      request["Te"] = "trailers"
      request.body = data.to_json
#      request.body = JSON.dump({
#        "arrival" => "Paris Saint-Lazare",
#        "departure" => "Herblay",
#        "prm" => "false",
#        "uicArrival" => "8738400",
#        "uicDeparture" => "8738188",
#        "errors" => 
#        }
#      })
      
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
      payload['nextTrainsList'].each do | train |
        create_event payload: train
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
#      request["Sec-Fetch-Dest"] = "empty"
#      request["Sec-Fetch-Mode"] = "cors"
#      request["Sec-Fetch-Site"] = "same-origin"
#      request["Dnt"] = "1"
#      request["Pragma"] = "no-cache"
#      request["Cache-Control"] = "no-cache"
#      request["Te"] = "trailers"
      request.body = data.to_json
#      request.body = JSON.dump({
#        "departure" => "Herblay (Herblay-sur-Seine)",
#        "departureId" => "stop_area:IDFM:65897",
#        "arrival" => "Gare Saint-Lazare (Paris)",
#        "arrivalId" => "stop_area:IDFM:71370",
#        "dateType" => "DEPARTURE",
#        "bypassModes" => 
#        ],
#        "bypassLines" => 
#        ],
#        "departureLatitude" => 48.9906573766,
#        "departureLongitude" => 2.16154001601,
#        "arrivalLatitude" => 48.8759421705,
#        "arrivalLongitude" => 2.32526979383,
#        "formAction" => false,
#        "haveBusBypassed" => false,
#        "date" => "2023-03-15",
#        "time" => "15:20"
#      })
      
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

      base_url_auth = 'https://www.transilien.com/api/'
      case interpolated['type']
      when "itinary"
        itinary(base_url_auth)
      when "nextdeparture"
        nextdeparture(base_url_auth)
      else
        log "Error: type has an invalid value (#{type})"
      end
    end
  end
end
