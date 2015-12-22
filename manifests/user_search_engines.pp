define google_chrome::user_search_engines(
  $collection_name  = undef,
  $search_engines   = {},
  $profile          = $google_chrome::params::default_profile,
  $home             = undef,
  $web_data_path    = undef,
) {

  $actual_search_engines = $collection_name ? {
    undef    => $search_engines,
    default  => merge(hiera_hash($collection_name, {}), $search_engines),
  }

  $actual_home = $home ? {
    undef   => "${google_chrome::params::home_base}/${name}",
    default => $home,
  }

  $profiles_path = "${actual_home}/${google_chrome::params::profiles_path}"
  $actual_web_data_path = $web_data_path ? {
    undef   => "${profiles_path}/${profile}/${google_chrome::params::web_data_file}",
    default => $web_data_path,
  }

  create_resources('google_chrome::search_engine', $actual_search_engines, {
    # TODO prefix name with user e.g. $actual_search_engines.map($k, $v => "${name}/$k", $v)
    web_data_path   => $web_data_path,
  })

}
