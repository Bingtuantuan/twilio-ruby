##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class TodayList < ListResource
      ##
      # Initialize the TodayList
      def initialize(version, account_sid)
        super(version)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/Usage/Records/Today"
      end
      
      ##
      # Reads TodayInstance records from the API as a list.
      def read(limit: nil, page_size: nil)
        @version.read(
            page_size: nil
        )
      end
      
      ##
      # Retrieve a single page of TodayInstance records from the API.
      def page(page_token: nil, page_number: nil, page_size: nil)
        params = {
            'PageToken' => page_token,
            'Page' => page_number,
            'PageSize' => page_size,
        }
        @version.page(
            self,
            TodayInstance,
            {},
            'GET',
            @uri,
            params
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Api.V2010.TodayList>'
      end
    end
  
    class TodayInstance < InstanceResource
      def initialize(version, payload)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'account_sid' => payload['account_sid'],
            'api_version' => payload['api_version'],
            'category' => payload['category'],
            'count' => payload['count'],
            'count_unit' => payload['count_unit'],
            'description' => payload['description'],
            'end_date' => deserialize.rfc2822_datetime(payload['end_date']),
            'price' => deserialize.decimal(payload['price']),
            'price_unit' => payload['price_unit'],
            'start_date' => deserialize.rfc2822_datetime(payload['start_date']),
            'subresource_uris' => payload['subresource_uris'],
            'uri' => payload['uri'],
            'usage' => payload['usage'],
            'usage_unit' => payload['usage_unit'],
        }
      end
      
      def account_sid
        @properties['account_sid']
      end
      
      def api_version
        @properties['api_version']
      end
      
      def category
        @properties['category']
      end
      
      def count
        @properties['count']
      end
      
      def count_unit
        @properties['count_unit']
      end
      
      def description
        @properties['description']
      end
      
      def end_date
        @properties['end_date']
      end
      
      def price
        @properties['price']
      end
      
      def price_unit
        @properties['price_unit']
      end
      
      def start_date
        @properties['start_date']
      end
      
      def subresource_uris
        @properties['subresource_uris']
      end
      
      def uri
        @properties['uri']
      end
      
      def usage
        @properties['usage']
      end
      
      def usage_unit
        @properties['usage_unit']
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        "<Twilio.Api.V2010.TodayInstance>"
      end
    end
  end
end