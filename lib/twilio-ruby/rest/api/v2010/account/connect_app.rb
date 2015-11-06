##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class ConnectAppList < ListResource
      ##
      # Initialize the ConnectAppList
      def initialize(version, account_sid)
        super(version)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/ConnectApps.json"
      end
      
      ##
      # Reads ConnectAppInstance records from the API as a list.
      def read(limit: nil, page_size: nil)
        @version.read(
            page_size: nil
        )
      end
      
      ##
      # Retrieve a single page of ConnectAppInstance records from the API.
      def page(page_token: nil, page_number: nil, page_size: nil)
        params = {
            'PageToken' => page_token,
            'Page' => page_number,
            'PageSize' => page_size,
        }
        @version.page(
            self,
            ConnectAppInstance,
            @solution,
            'GET',
            @uri,
            params
        )
      end
      
      ##
      # Constructs a ConnectAppContext
      def get(sid)
        ConnectAppContext.new(@version, sid, @solution)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Api.V2010.ConnectAppList>'
      end
    end
  
    class ConnectAppContext < InstanceContext
      def initialize(version, account_sid, sid)
        super(version)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid,
            'sid' => sid,
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/ConnectApps/#{@solution[:sid]}.json"
      end
      
      ##
      # Fetch a ConnectAppInstance
      def fetch
        params = {}
        
        @version.fetch(
            ConnectAppInstance,
            @solution,
            'GET',
            @uri,
            params,
        )
      end
      
      ##
      # Update the ConnectAppInstance
      def update(authorize_redirect_url: nil, company_name: nil, deauthorize_callback_method: nil, deauthorize_callback_url: nil, description: nil, friendly_name: nil, homepage_url: nil, permissions: nil)
        data = {
            'AuthorizeRedirectUrl' => authorize_redirect_url,
            'CompanyName' => company_name,
            'DeauthorizeCallbackMethod' => deauthorize_callback_method,
            'DeauthorizeCallbackUrl' => deauthorize_callback_url,
            'Description' => description,
            'FriendlyName' => friendly_name,
            'HomepageUrl' => homepage_url,
            'Permissions' => permissions,
        }
        
        @version.update(
            ConnectAppInstance,
            @solution,
            'POST',
            @uri,
            {},
            data=data,
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Api.V2010.ConnectAppContext #{context}>"
      end
    end
  
    class ConnectAppInstance < InstanceResource
      def initialize(version, payload, account_sid, sid: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'account_sid' => payload['account_sid'],
            'authorize_redirect_url' => payload['authorize_redirect_url'],
            'company_name' => payload['company_name'],
            'deauthorize_callback_method' => payload['deauthorize_callback_method'],
            'deauthorize_callback_url' => payload['deauthorize_callback_url'],
            'description' => payload['description'],
            'friendly_name' => payload['friendly_name'],
            'homepage_url' => payload['homepage_url'],
            'permissions' => payload['permissions'],
            'sid' => payload['sid'],
            'uri' => payload['uri'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'account_sid' => account_sid,
            'sid' => sid || @properties['sid'],
        }
      end
      
      def _context
        unless @instance_context
          @instance_context = ConnectAppContext(
              @version,
              @params['account_sid'],
              @params['sid'],
          )
        end
        @instance_context
      end
      
      def account_sid
        @properties['account_sid']
      end
      
      def authorize_redirect_url
        @properties['authorize_redirect_url']
      end
      
      def company_name
        @properties['company_name']
      end
      
      def deauthorize_callback_method
        @properties['deauthorize_callback_method']
      end
      
      def deauthorize_callback_url
        @properties['deauthorize_callback_url']
      end
      
      def description
        @properties['description']
      end
      
      def friendly_name
        @properties['friendly_name']
      end
      
      def homepage_url
        @properties['homepage_url']
      end
      
      def permissions
        @properties['permissions']
      end
      
      def sid
        @properties['sid']
      end
      
      def uri
        @properties['uri']
      end
      
      ##
      # Fetch a ConnectAppInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Update the ConnectAppInstance
      def update(authorize_redirect_url: nil, company_name: nil, deauthorize_callback_method: nil, deauthorize_callback_url: nil, description: nil, friendly_name: nil, homepage_url: nil, permissions: nil)
        @context.update(
            company_name: nil,
            deauthorize_callback_method: nil,
            deauthorize_callback_url: nil,
            description: nil,
            friendly_name: nil,
            homepage_url: nil,
            permissions: nil,
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Api.V2010.ConnectAppInstance #{context}>"
      end
    end
  end
end