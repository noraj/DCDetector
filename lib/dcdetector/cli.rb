# frozen_string_literal: true

# Ruby internal
# Project internal
# External
require 'docopt'
require 'paint'

module DCDetector
  # module use for the CLI binary only, not required by teh library
  module CLI
    doc = <<~DOCOPT
      DCDetector v#{DCDetector::VERSION}

      Usage:
        dcdetector -d <domain.tld> [-s <ip_address>] [--no-color --debug]
        dcdetector -h | --help
        dcdetector --version

      Options:
        -d <domain.tld>, --domain <domain.tld>       Active Directory domain
        -s <ip_address>, --nameserver <ip_address>   The IP address of the domain DNS server. If not provided uses your system DNS.
        --no-color                      Disable colorized output
        --debug                         Display arguments
        -h, --help                      Show this screen
        --version                       Show version
    DOCOPT

    begin
      args = Docopt.docopt(doc, version: DCDetector::VERSION)
      Paint.mode = 0 if args['--no-color']
      pp args if args['--debug']
      if args['--domain']
        dns_opts = args['--nameserver'].nil? ? nil : { nameserver: [args['--nameserver']] }
        dcd = DCDetector::App.new(args['--domain'], dns_opts)
        puts Paint['DC(s) name', :underline, :bold, 'dark turquoise']
        dcd.dc_name.each do |name|
          puts Paint["🔍 #{name}"]
        end
        puts Paint["\nDC(s) FQDN", :underline, :bold, 'cyan']
        dcd.dc_fqdn.each do |fqdn|
          puts Paint["🔍 #{fqdn}"]
        end
        puts Paint["\nDC(s) IP address", :underline, :bold, 'aquamarine']
        dcd.dc_ip.each do |ip|
          puts Paint["🔍 #{ip}"]
        end
      end
    rescue Docopt::Exit => e
      puts e.message
    end
  end
end
