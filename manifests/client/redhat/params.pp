# Shamefully stolen from https://github.com/frimik/puppet-nfs
# refactored a bit

class nfs::client::redhat::params {

  case $::operatingsystemrelease {
    /^5\.\d+/: {
      $osmajor = 5
    }
    /^6\.\d+$/: {
      $osmajor = 6
    }
    /^7\.\d+/: {
      $osmajor = 7
    }
    /^8\.\d+/: {
      $osmajor = 8
    }
    # Newer Amazon Linux releases use YYYY.MM (e.g. "2014.09" or "2015.03")
    /^\d{4}\.\d{2}$/: {
      $osmajor = 6
    }
    # Amazon linux operatingsystemrelease is verbose: 3.10.35-43.137.amzn1.x86_64
    /^[34]\.(\d|-|\.)+(amzn){1}/: {
      $osmajor = 6
    }
    # TODO: workaround for Fedora
    /^\d{2,}/: {
      $osmajor = 7
    }
    default:{
      fail("Operatingsystemrelease ${::operatingsystemrelease} not supported")
    }
  }
}
