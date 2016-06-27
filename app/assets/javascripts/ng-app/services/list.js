angular.module('MyTrello')
  .service('ListService', function($http, $q, apiConfig, List) {
    return {
      create: function(path, list) {
        var deferredHandler = $q.defer();

        $http.post(apiConfig.url() + '/v1' + path + '/lists', { list: list }).then(
          function(successResult) {
            var list = new List(successResult.data);
            deferredHandler.resolve(list);
          },
          function(errorResult) {
            // TODO: Handle error
          }
        );

        return deferredHandler.promise;
      }
    }
  });

