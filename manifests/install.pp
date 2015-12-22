class google_chrome::install {
  package { "${google_chrome::params::package_name}-${google_chrome::version}":,
    ensure => $google_chrome::ensure,
  }

  if ! defined(Package['sqlite3']) {
    package { 'sqlite3':
      ensure => present,
    }
  }
}
