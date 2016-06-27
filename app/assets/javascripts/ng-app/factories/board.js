angular.module('MyTrello')
  .factory('Board', function(List) {
    var Board = function(data) {
      angular.extend(this, {
      });
      if(angular.isDefined(data.lists)) {
        var lists = data.lists.map(function(list) {
          return new List(list);
        });
        data.lists = lists;
      }
      angular.extend(this, data);
    };
    return Board;
  });
