##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class PhoneNumberList < ListResource
      ##
      # Initialize the PhoneNumberList
      def initialize(version)
        super(version)
        
        # Path Solution
        @solution = {}
      end
      
      ##
      # Constructs a PhoneNumberContext
      def get(phone_number)
        PhoneNumberContext.new(@version, phone_number, @solution)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Lookups.V1.PhoneNumberList>'
      end
    end
  
    class PhoneNumberContext < InstanceContext
      def initialize(version, phone_number)
        super(version)
        
        # Path Solution
        @solution = {
            'phone_number' => phone_number,
        }
        @uri = "/PhoneNumbers/#{@solution[:phone_number]}"
      end
      
      ##
      # Fetch a PhoneNumberInstance
      def fetch(country_code: nil, type: nil)
        params = {
            'CountryCode' => country_code,
            'Type' => type,
        }
        
        @version.fetch(
            PhoneNumberInstance,
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
        "#<Twilio.Lookups.V1.PhoneNumberContext #{context}>"
      end
    end
  
    class PhoneNumberInstance < InstanceResource
      def initialize(version, payload, phone_number: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'country_code' => payload['country_code'],
            'phone_number' => payload['phone_number'],
            'national_format' => payload['national_format'],
            'carrier' => payload['carrier'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'phone_number' => phone_number || @properties['phone_number'],
        }
      end
      
      def _context
        unless @instance_context
          @instance_context = PhoneNumberContext(
              @version,
              @params['phone_number'],
          )
        end
        @instance_context
      end
      
      def country_code
        @properties['country_code']
      end
      
      def phone_number
        @properties['phone_number']
      end
      
      def national_format
        @properties['national_format']
      end
      
      def carrier
        @properties['carrier']
      end
      
      ##
      # Fetch a PhoneNumberInstance
      def fetch(country_code: nil, type: nil)
        @context.fetch(
            type: nil,
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Lookups.V1.PhoneNumberInstance #{context}>"
      end
    end
  end
end