##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class IncomingPhoneNumberList < ListResource
      ##
      # Initialize the IncomingPhoneNumberList
      def initialize(version, owner_account_sid)
        super(version)
        
        # Path Solution
        @solution = {
            'owner_account_sid' => owner_account_sid
        }
        @uri = "/Accounts/#{@solution[:owner_account_sid]}/IncomingPhoneNumbers.json"
        
        # Components
        @local = nil
        @mobile = nil
        @toll_free = nil
      end
      
      ##
      # Reads IncomingPhoneNumberInstance records from the API as a list.
      def read(beta: nil, friendly_name: nil, phone_number: nil, limit: nil, page_size: nil)
        @version.read(
            friendly_name: nil,
            phone_number: nil,
            limit: nil,
            page_size: nil
        )
      end
      
      ##
      # Retrieve a single page of IncomingPhoneNumberInstance records from the API.
      def page(beta: nil, friendly_name: nil, phone_number: nil, page_token: nil, page_number: nil, page_size: nil)
        params = {
            'Beta' => beta,
            'FriendlyName' => friendly_name,
            'PhoneNumber' => phone_number,
            'PageToken' => page_token,
            'Page' => page_number,
            'PageSize' => page_size,
        }
        @version.page(
            self,
            IncomingPhoneNumberInstance,
            @solution,
            'GET',
            @uri,
            params
        )
      end
      
      ##
      # Create a new IncomingPhoneNumberInstance
      def create(api_version: nil, friendly_name: nil, sms_application_sid: nil, sms_fallback_method: nil, sms_fallback_url: nil, sms_method: nil, sms_url: nil, status_callback: nil, status_callback_method: nil, voice_application_sid: nil, voice_caller_id_lookup: nil, voice_fallback_method: nil, voice_fallback_url: nil, voice_method: nil, voice_url: nil, phone_number: nil, area_code: nil)
        data = {
            'PhoneNumber' => phone_number,
            'AreaCode' => area_code,
            'ApiVersion' => api_version,
            'FriendlyName' => friendly_name,
            'SmsApplicationSid' => sms_application_sid,
            'SmsFallbackMethod' => sms_fallback_method,
            'SmsFallbackUrl' => sms_fallback_url,
            'SmsMethod' => sms_method,
            'SmsUrl' => sms_url,
            'StatusCallback' => status_callback,
            'StatusCallbackMethod' => status_callback_method,
            'VoiceApplicationSid' => voice_application_sid,
            'VoiceCallerIdLookup' => voice_caller_id_lookup,
            'VoiceFallbackMethod' => voice_fallback_method,
            'VoiceFallbackUrl' => voice_fallback_url,
            'VoiceMethod' => voice_method,
            'VoiceUrl' => voice_url,
        }
        
        @version.create(
            IncomingPhoneNumberInstance,
            @solution,
            'POST',
            @uri,
            {},
            data
        )
      end
      
      ##
      # Access the local
      def local
        @local ||= LocalList.new(@version, @solution)
      end
      
      ##
      # Access the mobile
      def mobile
        @mobile ||= MobileList.new(@version, @solution)
      end
      
      ##
      # Access the toll_free
      def toll_free
        @toll_free ||= TollFreeList.new(@version, @solution)
      end
      
      ##
      # Constructs a IncomingPhoneNumberContext
      def get(sid)
        IncomingPhoneNumberContext.new(@version, sid, @solution)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Api.V2010.IncomingPhoneNumberList>'
      end
    end
  
    class IncomingPhoneNumberContext < InstanceContext
      def initialize(version, owner_account_sid, sid)
        super(version)
        
        # Path Solution
        @solution = {
            'owner_account_sid' => owner_account_sid,
            'sid' => sid,
        }
        @uri = "/Accounts/#{@solution[:owner_account_sid]}/IncomingPhoneNumbers/#{@solution[:sid]}.json"
      end
      
      ##
      # Update the IncomingPhoneNumberInstance
      def update(account_sid: nil, api_version: nil, friendly_name: nil, sms_application_sid: nil, sms_fallback_method: nil, sms_fallback_url: nil, sms_method: nil, sms_url: nil, status_callback: nil, status_callback_method: nil, voice_application_sid: nil, voice_caller_id_lookup: nil, voice_fallback_method: nil, voice_fallback_url: nil, voice_method: nil, voice_url: nil)
        data = {
            'AccountSid' => account_sid,
            'ApiVersion' => api_version,
            'FriendlyName' => friendly_name,
            'SmsApplicationSid' => sms_application_sid,
            'SmsFallbackMethod' => sms_fallback_method,
            'SmsFallbackUrl' => sms_fallback_url,
            'SmsMethod' => sms_method,
            'SmsUrl' => sms_url,
            'StatusCallback' => status_callback,
            'StatusCallbackMethod' => status_callback_method,
            'VoiceApplicationSid' => voice_application_sid,
            'VoiceCallerIdLookup' => voice_caller_id_lookup,
            'VoiceFallbackMethod' => voice_fallback_method,
            'VoiceFallbackUrl' => voice_fallback_url,
            'VoiceMethod' => voice_method,
            'VoiceUrl' => voice_url,
        }
        
        @version.update(
            IncomingPhoneNumberInstance,
            @solution,
            'POST',
            @uri,
            {},
            data=data,
        )
      end
      
      ##
      # Fetch a IncomingPhoneNumberInstance
      def fetch
        params = {}
        
        @version.fetch(
            IncomingPhoneNumberInstance,
            @solution,
            'GET',
            @uri,
            params,
        )
      end
      
      ##
      # Deletes the IncomingPhoneNumberInstance
      def delete
        return @version.delete('delete', @uri)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Api.V2010.IncomingPhoneNumberContext #{context}>"
      end
    end
  
    class IncomingPhoneNumberInstance < InstanceResource
      def initialize(version, payload, owner_account_sid, sid: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'account_sid' => payload['account_sid'],
            'address_requirements' => payload['address_requirements'],
            'api_version' => payload['api_version'],
            'beta' => payload['beta'],
            'capabilities' => payload['capabilities'],
            'date_created' => deserialize.rfc2822_datetime(payload['date_created']),
            'date_updated' => deserialize.rfc2822_datetime(payload['date_updated']),
            'friendly_name' => payload['friendly_name'],
            'phone_number' => payload['phone_number'],
            'sid' => payload['sid'],
            'sms_application_sid' => payload['sms_application_sid'],
            'sms_fallback_method' => payload['sms_fallback_method'],
            'sms_fallback_url' => payload['sms_fallback_url'],
            'sms_method' => payload['sms_method'],
            'sms_url' => payload['sms_url'],
            'status_callback' => payload['status_callback'],
            'status_callback_method' => payload['status_callback_method'],
            'uri' => payload['uri'],
            'voice_application_sid' => payload['voice_application_sid'],
            'voice_caller_id_lookup' => payload['voice_caller_id_lookup'],
            'voice_fallback_method' => payload['voice_fallback_method'],
            'voice_fallback_url' => payload['voice_fallback_url'],
            'voice_method' => payload['voice_method'],
            'voice_url' => payload['voice_url'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'owner_account_sid' => owner_account_sid,
            'sid' => sid || @properties['sid'],
        }
      end
      
      def _context
        unless @instance_context
          @instance_context = IncomingPhoneNumberContext(
              @version,
              @params['owner_account_sid'],
              @params['sid'],
          )
        end
        @instance_context
      end
      
      def account_sid
        @properties['account_sid']
      end
      
      def address_requirements
        @properties['address_requirements']
      end
      
      def api_version
        @properties['api_version']
      end
      
      def beta
        @properties['beta']
      end
      
      def capabilities
        @properties['capabilities']
      end
      
      def date_created
        @properties['date_created']
      end
      
      def date_updated
        @properties['date_updated']
      end
      
      def friendly_name
        @properties['friendly_name']
      end
      
      def phone_number
        @properties['phone_number']
      end
      
      def sid
        @properties['sid']
      end
      
      def sms_application_sid
        @properties['sms_application_sid']
      end
      
      def sms_fallback_method
        @properties['sms_fallback_method']
      end
      
      def sms_fallback_url
        @properties['sms_fallback_url']
      end
      
      def sms_method
        @properties['sms_method']
      end
      
      def sms_url
        @properties['sms_url']
      end
      
      def status_callback
        @properties['status_callback']
      end
      
      def status_callback_method
        @properties['status_callback_method']
      end
      
      def uri
        @properties['uri']
      end
      
      def voice_application_sid
        @properties['voice_application_sid']
      end
      
      def voice_caller_id_lookup
        @properties['voice_caller_id_lookup']
      end
      
      def voice_fallback_method
        @properties['voice_fallback_method']
      end
      
      def voice_fallback_url
        @properties['voice_fallback_url']
      end
      
      def voice_method
        @properties['voice_method']
      end
      
      def voice_url
        @properties['voice_url']
      end
      
      ##
      # Update the IncomingPhoneNumberInstance
      def update(account_sid: nil, api_version: nil, friendly_name: nil, sms_application_sid: nil, sms_fallback_method: nil, sms_fallback_url: nil, sms_method: nil, sms_url: nil, status_callback: nil, status_callback_method: nil, voice_application_sid: nil, voice_caller_id_lookup: nil, voice_fallback_method: nil, voice_fallback_url: nil, voice_method: nil, voice_url: nil)
        @context.update(
            api_version: nil,
            friendly_name: nil,
            sms_application_sid: nil,
            sms_fallback_method: nil,
            sms_fallback_url: nil,
            sms_method: nil,
            sms_url: nil,
            status_callback: nil,
            status_callback_method: nil,
            voice_application_sid: nil,
            voice_caller_id_lookup: nil,
            voice_fallback_method: nil,
            voice_fallback_url: nil,
            voice_method: nil,
            voice_url: nil,
        )
      end
      
      ##
      # Fetch a IncomingPhoneNumberInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Deletes the IncomingPhoneNumberInstance
      def delete
        @context.delete()
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Api.V2010.IncomingPhoneNumberInstance #{context}>"
      end
    end
  end
end