class helloworld {

  $sample_war = 'https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war'

  class{'tomcat':}

  tomcat::instance { 'tomcat6':
    install_from_source => false,
    package_name  => 'tomcat6',
  } ->
  tomcat::config::server { 'tomcat6':
    catalina_base => '/var/lib/tomcat6',
    port          => '8105';
  } ->
  tomcat::config::server::connector { 'tomcat6-http':
    catalina_base         => '/var/lib/tomcat6',
    port                  => '8180',
    protocol              => 'HTTP/1.1',
    additional_attributes => {
      'redirectPort' => '8543'
    };
  } ->
  tomcat::war { 'sample.war':
    catalina_base => '/var/lib/tomcat6',
    war_source    => $sample_war;
  } ->
  tomcat::service { 'default':
    use_jsvc => false,
    use_init => true,
    service_name => 'tomcat6',
  }
}

class {'helloworld': }

