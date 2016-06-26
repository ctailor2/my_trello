angular
  .module('MyTrello', [
    'templates'
  ])
  .constant('apiConfig', {
    'host': 'http://localhost',
    'port': '3000',
    'url': function() {
      return [this.host, this.port].join(':');
    }
  })
  .config(function($locationProvider) {
    $locationProvider.html5Mode(true);
  })
  .config(function($httpProvider) {
    // TODO: Extract client token to envar
    $httpProvider.defaults.headers.common['Client-Token'] = 'IVfbd2pXd4s_qijchDqxe-28J9XrUD3g';
    $httpProvider.defaults.headers.common['Session-Token'] = Cookies.get('token');
  });
