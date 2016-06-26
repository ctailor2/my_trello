angular.module('MyTrello')
  .service('BoardService', function($http, $q, apiConfig, Board) {
    return {
      getAll: function() {
        var deferredHandler = $q.defer();

        $http.get(apiConfig.url() + '/v1/boards').then(
          function(successResult) {
            var boards = successResult.data.map(function(board) {
              return new Board(board);
            });
            deferredHandler.resolve(boards);
          },
          function(errorResult) {
            // TODO: Handle error
          }
        );

        return deferredHandler.promise;
      },
      create: function(board) {
        var deferredHandler = $q.defer();

        $http.post(apiConfig.url() + '/v1/boards', { board: board }).then(
          function(successResult) {
            var board = new Board(successResult.data);
            deferredHandler.resolve(board);
          },
          function(errorResult) {
            // TODO: Handle error
          }
        );

        return deferredHandler.promise;
      }
    }
  });
