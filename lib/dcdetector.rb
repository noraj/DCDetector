# frozen_string_literal: true

# Ruby internal
require 'resolv'
# Project internal
require 'dcdetector/version'
# External

# DCDetector module
module DCDetector
  # DCDetector main class
  class App
    # Create the DCDetector object.
    # @param ad_domain [String] the Active Directory domain to work on.
    # @param dns_opts [Hash] options for the DNS resolver. See [Resolv::DNS.new](https://ruby-doc.org/3.2.0/stdlibs/resolv/Resolv/DNS.html#method-c-new).
    # @option dns_opts [Array|String] :nameserver the DNS server to contact
    # @example
    #   dcd = DCDetector::App.new('spookysec.local', nameserver: ['10.10.197.59'])
    #   dcd = DCDetector::App.new('za.tryhackme.com', nameserver: ['10.200.28.101'])
    def initialize(ad_domain, dns_opts = nil)
      @ad_domain = ad_domain
      @dns_opts = dns_opts
    end

    # Get DC(s) FQDN
    # @return [Array] the list of FQDN of all DCs
    # @example
    #   dcd.dc_fqdn
    #   # => ["THMDC.za.tryhackme.com"]
    # @see https://learn.microsoft.com/en-us/troubleshoot/windows-server/identity/how-domain-controllers-are-located
    def dc_fqdn
      Resolv::DNS.open(@dns_opts) do |dns|
        # _kerberos._tcp, _kpasswd._tcp, _ldap._tcp works too but are not MS only
        # _kerberos._tcp.dc._msdcs
        # _ldap._tcp.pdc._msdcs, _gc._tcp
        # _udp variants
        ress = dns.getresources "_ldap._tcp.dc._msdcs.#{@ad_domain}", Resolv::DNS::Resource::IN::ANY
        ress.map { |x| x.target.to_s }
      end
    end

    # Get DC(s) computer name
    # @return [Array] the list of computer name of all DCs
    # @example
    #   dcd.dc_name
    #   # => ["THMDC"]
    def dc_name
      dc_fqdn.map { |x| x[...-@ad_domain.size - 1] }
    end

    # Get DC(s) IP address
    # @return [Array] the list of IP address of all DCs
    # @example
    #   dcd.dc_ip
    #   # => ["10.10.10.101", "10.200.28.101"]
    def dc_ip
      Resolv::DNS.open(@dns_opts) do |dns|
        ress = dns.getresources "gc._msdcs.#{@ad_domain}", Resolv::DNS::Resource::IN::A
        ress.map { |x| x.address.to_s }
      end
    end
  end
end
