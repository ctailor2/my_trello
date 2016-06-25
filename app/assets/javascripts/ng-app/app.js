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
  });
