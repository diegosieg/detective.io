angular.module('detectiveServices').factory("Summary", [ '$resource', '$http', ($resource, $http)->
    $resource '/api/common/v1/summary/:id/', {}, {
        get: {
            method : 'GET', 
            isArray: false,
            cache  : true
        }
    }
])