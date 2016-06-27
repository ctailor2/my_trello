angular.module('MyTrello')
  .controller('BoardController', function($scope, $http, BoardService, ListService) {
    var path = window.location.pathname;

    BoardService.get(path, { 'with_assocs[]': ['lists'] }).then(
      function(board) {
        $scope.board = board;
      },
      function() {
      }
    );

    $scope.createList = function(name) {
      ListService.create(path, { name: name }).then(
        function(list) {
          $scope.listName = '';
          $scope.board.lists.push(list);
        }
      );
    };
  });

