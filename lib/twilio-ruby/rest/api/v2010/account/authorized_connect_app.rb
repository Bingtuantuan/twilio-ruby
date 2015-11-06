##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class AuthorizedConnectAppList < ListResource
      ##
      # Initialize the AuthorizedConnectAppList
      def initialize(version, account_sid)
        super(version)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/AuthorizedConnectApps.json"
      end
      
      ##
      # Reads AuthorizedConnectAppInstance records from the API as a list.
      def read(limit: nil, page_size: nil)
        @version.read(
            page_size: nil
        )
      end
      
      ##
      # Retrieve a single page of AuthorizedConnectAppInstance records from the API.
      def page(page_token: nil, page_number: nil, page_size: nil)
        params = {
            'PageToken' => page_token,
            'Page' => page_number,
            'PageSize' => page_size,
        }
        @version.page(
            self,
            AuthorizedConnectAppInstance,
            @solution,
            'GET',
            @uri,
            params
        )
      end
      
      ##
      # Constructs a AuthorizedConnectAppContext
      def get(connect_app_sid)
        AuthorizedConnectAppContext.new(@version, connect_app_sid, @solution)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Api.V2010.AuthorizedConnectAppList>'
      end
    end
  
    class AuthorizedConnectAppContext < InstanceContext
      def initialize(version, account_sid, connect_app_sid)
        super(version)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid,
            'connect_app_sid' => connect_app_sid,
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/AuthorizedConnectApps/#{@solution[:connect_app_sid]}.json"
      end
      
      ##
      # Fetch a AuthorizedConnectAppInstance
      def fetch
        params = {}
        
        @version.fetch(
            AuthorizedConnectAppInstance,
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
        "#<Twilio.Api.V2010.AuthorizedConnectAppContext #{context}>"
      end
    end
  
    class AuthorizedConnectAppInstance < InstanceResource
      def initialize(version, payload, account_sid, connect_app_sid: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'account_sid' => payload['account_sid'],
            'connect_app_company_name' => payload['connect_app_company_name'],
            'connect_app_description' => payload['connect_app_description'],
            'connect_app_friendly_name' => payload['connect_app_friendly_name'],
            'connect_app_homepage_url' => payload['connect_app_homepage_url'],
            'connect_app_sid' => payload['connect_app_sid'],
            'date_created' => deserialize.rfc2822_datetime(payload['date_created']),
            'date_updated' => deserialize.rfc2822_datetime(payload['date_updated']),
            'permissions' => payload['permissions'],
            'uri' => payload['uri'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'account_sid' => account_sid,
            'connect_app_sid' => connect_app_sid || @properties['connect_app_sid'],
        }
      end
      
      def _context
        unless @instance_context
          @instance_context = AuthorizedConnectAppContext(
              @version,
              @params['account_sid'],
              @params['connect_app_sid'],
          )
        end
        @instance_context
      end
      
      def account_sid
        @properties['account_sid']
      end
      
      def connect_app_company_name
        @properties['connect_app_company_name']
      end
      
      def connect_app_description
        @properties['connect_app_description']
      end
      
      def connect_app_friendly_name
        @properties['connect_app_friendly_name']
      end
      
      def connect_app_homepage_url
        @properties['connect_app_homepage_url']
      end
      
      def connect_app_sid
        @properties['connect_app_sid']
      end
      
      def date_created
        @properties['date_created']
      end
      
      def date_updated
        @properties['date_updated']
      end
      
      def permissions
        @properties['permissions']
      end
      
      def uri
        @properties['uri']
      end
      
      ##
      # Fetch a AuthorizedConnectAppInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Api.V2010.AuthorizedConnectAppInstance #{context}>"
      end
    end
  end
end