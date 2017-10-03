app.service('getser',function(){
	var username;
	var loggedin = false;
	var id;
	return {
		/*setName: function(name){
			username = name;
		},*/

		getName: function(){
			return username
		},

		setID: function(userID){
			id = userID;
		},

		getID: function(){
			return id
		},

		/*userLoggedIn: function(){
			loggedin = true
		},*/
		isUserLoggedIn: function(){
			if(!!localStorage.getItem('login')){
				loggedin = true;
				var data = JSON.parse(localStorage.getItem('login'));
				username = data.username;
				id = data.id;
			}
			return loggedin
		},

		saveData: function(data){
			username = data.user;
			id = data.id;
			loggedin = true;
			localStorage.setItem('login',JSON.stringify({
				username: username,
				id: id
			}))
		},

		clearData: function(){
			localStorage.removeItem('login');
			username = "";
			id = "";
			loggedin = false;
		}

	}
})

app.service('catSer',['$http',function(http){
	return {
		getCategory: function(key){
			http({
				url: 'getIconByCategory.php',
				method: 'POST',
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded'
				},
				data: 'key='+key
				}).then(function(data){
				return data.data;	
			})	
		}
	}
}])


