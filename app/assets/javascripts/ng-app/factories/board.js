angular.module('MyTrello')
  .factory('Board', function() {
    var Board = function(data) {
      angular.extend(this, {
      });
      angular.extend(this, data);
    };
    return Board;
  });
