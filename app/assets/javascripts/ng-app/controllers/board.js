angular.module('MyTrello')
  .controller('BoardController', function($scope, $http, BoardService, Board) {
    var path = window.location.pathname;

    BoardService.get(path).then(
      function(board) {
        $scope.board = board;
      },
      function() {
      }
    );

    $scope.create = function(name) {
    };
  });

