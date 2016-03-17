app.factory('Resources', ['$http', 'api_key', 'base_url', function($http, api_key, base_url){
  'use strict';

  this.getResources = function(resource, resourceParams){
    var params = Object.assign({ key: api_key }, resourceParams);
    return $http.get(base_url + resource, {
      params: params,
      cache: true
    })
  }

  this.postResource = function(resource, object, resourceParams, baseUrl, headers){
    console.log(headers);
    var params = Object.assign({ key: api_key }, resourceParams);
    var url = baseUrl == undefined ? base_url : baseUrl;
    return $http.post(url + resource, object,{
      headers: headers,
      params: params
    })
  }

  this.deleteResource = function(resource, headers, baseUrl, resourceParams){
    var params = Object.assign({ key: api_key }, resourceParams);
    var url = baseUrl == undefined ? base_url : baseUrl;
    return $http.delete(url + resource,{
      headers: headers,
      params: params
    })
  }

  this.editResource = function(resource, headers, object, baseUrl, resourceParams){
    var params = Object.assign({ key: api_key }, resourceParams);
    var url = baseUrl == undefined ? base_url : baseUrl;
    return $http.put(url + resource, object, {
      headers: headers,
      params: params
    })
  }

  return this;
}])
