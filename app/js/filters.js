app.filter('startFrom', function() {
    return function(data,start) {
    	start = + start;
        return data.slice(start);
    }
});