define google_chrome::search_engine(
  $user,
  $profile,
  $url,
  $short_name = undef,
) {

  $actual_short_name = $short_name ? {
    undef    => $name,
    default  => $short_name,
  }

  exec { 'install search engine':
    command => template('chrome/search_engine/insert.sh.erb'),
    unless  => template('chrome/search_engine/select.sh.erb'),
    path    => '/bin:/usr/bin',
  }
}
