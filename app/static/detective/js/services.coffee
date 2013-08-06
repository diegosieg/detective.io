# Services
angular
    .module('detectiveServices', ['ngResource'])
    .factory("Individual", [ '$resource', '$http', ($resource, $http)->
    	$resource '/api/v1/:type/:id/#', {}, {
            query: {
                method : 'GET', 
                isArray: true,
                cache  : true,
                transformResponse: $http.defaults.transformResponse.concat([(data, headersGetter) ->
                    data.objects
                ])
            }
        }
    ])
    .factory("Search", [ '$resource', '$http', ($resource, $http)->
        $resource '/api/v1/:type/search/#', {}, {
            query: {
                method : 'GET', 
                isArray: true,
                cache  : true,
                transformResponse: $http.defaults.transformResponse.concat([(data, headersGetter) ->                    
                    data.objects
                ])
            }
        }
    ])
    .factory('User', ['$http', ($http)->           
        sdo =
            is_logged: false
            username: ''
            
        # Sync User object
        $http.get('/api/v1/user/status/').success (data)-> $.extend sdo, data

        return sdo
    ])