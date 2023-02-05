
# Usage

## CLI

As binary name you cna use both `dcdetector` or the shorter `dcd`.

```plaintext
$ dcd --help
DCDetector v0.0.1

Usage:
  dcdetector -d <domain.tld> [-s <ip_address>] [--no-color --debug]
  dcdetector -h | --help
  dcdetector --version

Options:
  -d <domain.tld>, --domain <domain.tld>       Active Directory domain
  -s <ip_address>, --nameserver <ip_address>  The IP address of the domain DNS server. If not provided use your system DNS.
  --no-color                      Disable colorized output
  --debug                         Display arguments
  -h, --help                      Show this screen
  --version                       Show version
```

### Examples

Short syntax:

```plaintext
$ dcd -d za.tryhackme.com -s 10.200.28.101
DC(s) name
🔍 THMDC

DC(s) FQDN
🔍 THMDC.za.tryhackme.com

DC(s) IP address
🔍 10.200.28.101
🔍 10.10.10.101
```

Long syntax:

```plaintext
$ dcdetector --domain za.tryhackme.com --nameserver 10.200.28.101
DC(s) name
🔍 THMDC

DC(s) FQDN
🔍 THMDC.za.tryhackme.com

DC(s) IP address
🔍 10.10.10.101
🔍 10.200.28.101
```

## Library

See [DCDetector::App](http://localhost:8808/docs/DCDetector/App).

### Examples

```ruby
require 'dcdetector'

dcd = DCDetector::App.new('za.tryhackme.com', nameserver: ['10.200.28.101'])

dcd.dc_fqdn
# => ["THMDC.za.tryhackme.com"]

dcd.dc_ip
# => ["10.10.10.101", "10.200.28.101"]

dcd.dc_name
# => ["THMDC"]
```
