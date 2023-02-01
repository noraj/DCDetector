# frozen_string_literal: true

# Ruby internal
require 'resolv'
# Project internal
require 'dcdetector/version'
# External

module DCDetector
  class App
    # dcd = DCDetector::App.new('spookysec.local', nameserver: ['10.10.197.59'])
    def initialize(ad_domain, dns_opts = nil)
      @ad_domain = ad_domain
      @dns_opts = dns_opts
    end

    def dc_fqdn
      Resolv::DNS.open(@dns_opts) do |dns|
        # _kerberos._tcp, _kpasswd._tcp, _ldap._tcp works too but are not MS only
        # _ldap._tcp.pdc._msdcs, _gc._tcp
        # _udp variants
        # https://learn.microsoft.com/en-us/troubleshoot/windows-server/identity/how-domain-controllers-are-located
        ress = dns.getresources "_ldap._tcp.dc._msdcs.#{@ad_domain}", Resolv::DNS::Resource::IN::ANY
        ress.map { |x| x.target.to_s }
      end
    end

    def dc_name
      dc_fqdn.map { |x| x[...-@ad_domain.size - 1] }
    end

    def dc_ip
      Resolv::DNS.open(@dns_opts) do |dns|
        ress = dns.getresources "gc._msdcs.#{@ad_domain}", Resolv::DNS::Resource::IN::A
        ress.map { |x| x.address.to_s }
      end
    end
  end
end
