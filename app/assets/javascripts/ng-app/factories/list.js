angular.module('MyTrello')
  .factory('List', function() {
    var List = function(data) {
      angular.extend(this, {
      });
      angular.extend(this, data);
    };
    return List;
  });
