angular.module('MyTrello')
  .controller('BoardsController', function($scope, $http, BoardService, Board) {
    BoardService.getAll().then(
      function(boards) {
        $scope.boards = boards;
      },
      function() {
      }
    );

    $scope.create = function(name) {
      BoardService.create({ name: name }).then(
        function(board) {
          $scope.name = '';
          $scope.boards.push(board);
        },
        function() {
        }
      );
    };
  });

