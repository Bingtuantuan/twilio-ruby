##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class EventList < ListResource
      ##
      # Initialize the EventList
      def initialize(version)
        super(version)
        
        # Path Solution
        @solution = {}
        @uri = "/Events"
      end
      
      ##
      # Reads EventInstance records from the API as a list.
      def read(actor_sid: nil, end_date_before: nil, end_date: nil, end_date_after: nil, event_type: nil, resource_sid: nil, source_ip_address: nil, start_date_before: nil, start_date: nil, start_date_after: nil, limit: nil, page_size: nil)
        @version.read(
            end_date_before: nil,
            end_date: nil,
            end_date_after: nil,
            event_type: nil,
            resource_sid: nil,
            source_ip_address: nil,
            start_date_before: nil,
            start_date: nil,
            start_date_after: nil,
            limit: nil,
            page_size: nil
        )
      end
      
      ##
      # Retrieve a single page of EventInstance records from the API.
      def page(actor_sid: nil, end_date_before: nil, end_date: nil, end_date_after: nil, event_type: nil, resource_sid: nil, source_ip_address: nil, start_date_before: nil, start_date: nil, start_date_after: nil, page_token: nil, page_number: nil, page_size: nil)
        params = {
            'ActorSid' => actor_sid,
            'EndDate<' => serialize.iso8601_date(end_date_before),
            'EndDate' => serialize.iso8601_date(end_date),
            'EndDate>' => serialize.iso8601_date(end_date_after),
            'EventType' => event_type,
            'ResourceSid' => resource_sid,
            'SourceIpAddress' => source_ip_address,
            'StartDate<' => serialize.iso8601_date(start_date_before),
            'StartDate' => serialize.iso8601_date(start_date),
            'StartDate>' => serialize.iso8601_date(start_date_after),
            'PageToken' => page_token,
            'Page' => page_number,
            'PageSize' => page_size,
        }
        @version.page(
            self,
            EventInstance,
            @solution,
            'GET',
            @uri,
            params
        )
      end
      
      ##
      # Constructs a EventContext
      def get(sid)
        EventContext.new(@version, sid, @solution)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Monitor.V1.EventList>'
      end
    end
  
    class EventContext < InstanceContext
      def initialize(version, sid)
        super(version)
        
        # Path Solution
        @solution = {
            'sid' => sid,
        }
        @uri = "/Events/#{@solution[:sid]}"
      end
      
      ##
      # Fetch a EventInstance
      def fetch
        params = {}
        
        @version.fetch(
            EventInstance,
            @solution,
            'GET',
            @uri,
            params,
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Monitor.V1.EventContext #{context}>"
      end
    end
  
    class EventInstance < InstanceResource
      def initialize(version, payload, sid: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'account_sid' => payload['account_sid'],
            'actor_sid' => payload['actor_sid'],
            'actor_type' => payload['actor_type'],
            'description' => payload['description'],
            'event_data' => payload['event_data'],
            'event_date' => deserialize.iso8601_datetime(payload['event_date']),
            'event_type' => payload['event_type'],
            'resource_sid' => payload['resource_sid'],
            'resource_type' => payload['resource_type'],
            'sid' => payload['sid'],
            'source' => payload['source'],
            'source_ip_address' => payload['source_ip_address'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'sid' => sid || @properties['sid'],
        }
      end
      
      def _context
        unless @instance_context
          @instance_context = EventContext(
              @version,
              @params['sid'],
          )
        end
        @instance_context
      end
      
      def account_sid
        @properties['account_sid']
      end
      
      def actor_sid
        @properties['actor_sid']
      end
      
      def actor_type
        @properties['actor_type']
      end
      
      def description
        @properties['description']
      end
      
      def event_data
        @properties['event_data']
      end
      
      def event_date
        @properties['event_date']
      end
      
      def event_type
        @properties['event_type']
      end
      
      def resource_sid
        @properties['resource_sid']
      end
      
      def resource_type
        @properties['resource_type']
      end
      
      def sid
        @properties['sid']
      end
      
      def source
        @properties['source']
      end
      
      def source_ip_address
        @properties['source_ip_address']
      end
      
      ##
      # Fetch a EventInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Monitor.V1.EventInstance #{context}>"
      end
    end
  end
end