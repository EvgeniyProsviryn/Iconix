

app.controller('loginCtrl', ['$scope','$location','$http','getser', function(scope,location,http,getser){
	scope.login = function(){
		var username = scope.username;
		var password = scope.password;

		http({
			url: 'php/server.php',
			method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			},
			data: 'username='+username+'&password='+password
		}).then(function(response){
			if(response.data.status == 'loggedAdmin'){
				getser.saveData(response.data);


				/*getser.userLoggedIn();
				getser.setName(response.data.user);
				*/
				location.path('/dashboard');
			}else if(response.data.status == 'logged'){
				getser.saveData(response.data);
				location.path('/user');
			}else{
				alert("invalid login");
			}
		})

		}

}])

app.controller('registerCtrl', ['$scope','$location','$http', function(scope,location,http){

	scope.register = function(){
		var userName = scope.userName;
		var firstName = scope.firstName;
		var lastName = scope.lastName;
		var passWord = scope.passWord;
		var email = scope.email;
		var form_data = new FormData()

		

		http({
			url: 'php/register.php',
			method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			},
			data: 'username='+userName+'&password='+passWord+'&firstname='+firstName+'&lastname='+lastName+'&email='+email
		}).then(function(response){
			if(response.data.status == 'registered'){
				alert("registered");
				location.path('/');
			}else{
				alert("invalid register");
			}
		})

		/*http.post('register.php', form_data,
		{
			transformRequest:angular.identity,
			headers: {'Content-Type': undefined,'Process-Data': false}
		}).then(function(response){
			if(response.data.status == 'registered'){
				alert("registered");
				location.path('/');
			}else{
				alert("invalid register");
			}
		})*/


	}



}])

app.controller('dashCtrl', ['$scope','getser','$location','$http', function(scope,getser,location,http){
	scope.user = getser.getName();

	scope.pageSize = 5;
	scope.currentPage = 1;
	scope.pageSizeAdd = 5;
	scope.currentPageAdd = 1;
	scope.icons = [];
	scope.cats = [];

	scope.logoutClick = function(){
		getser.clearData();
		location.path('/');
	}

	scope.iconsActive = function(){
		document.getElementById("ic").classList.add("active");
		document.getElementById("cat").classList.remove("active");
	}

	scope.categoryActive = function(){
		document.getElementById("cat").classList.add("active");
		document.getElementById("ic").classList.remove("active");
	}

	

	scope.addCategory = function(){
		var categoryName = scope.categoryName;
		var form_data = new FormData()
		
		angular.forEach(scope.files, function(file){
			form_data.append('file',file);
			form_data.append('categoryName',categoryName);
		});
		
		http.post('php/addCategory.php', form_data,
		{
			transformRequest:angular.identity,
			headers: {'Content-Type': undefined,'Process-Data': false}
		}).then(function(response){
			scope.select();
		})

	}

	scope.select = function(){
			http.get('php/select.php')
			.then(function(data){
				scope.cats = data.data;
			})
	}

	scope.selectIcon = function(){
			http.get('php/selectIcon.php')
			.then(function(data){
				scope.icons = data.data;
			})
	}

	scope.deleteCategory = function(key){
		http({
			url: 'php/deleteCategory.php',
			method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			},
			data: 'key='+key
		}).then(function(response){
			scope.select();
		})
		
		
	}

	scope.deleteIcon = function(key){

		http({
			url: 'php/deleteIcon.php',
			method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			},
			data: 'key='+key
		}).then(function(response){
			scope.selectIcon();
		})
		
	}

	scope.addIcon = function(){
		var categorySelect = scope.categorySelect;
		var icon_form_data = new FormData()
		var iname = scope.icName;

		angular.forEach(scope.files, function(file){
			icon_form_data.append('file',file);
			icon_form_data.append('categorySelect',categorySelect);
			icon_form_data.append('iname',iname);
		});

		http.post('php/addIcon.php', icon_form_data,
		{
			transformRequest:angular.identity,
			headers: {'Content-Type': undefined,'Process-Data': false}
		}).then(function(response){
			scope.selectIcon();
		})
	}

}])

app.controller('userCtrl', ['$scope','getser','$location', function(scope,getser,location){
	scope.user = getser.getName();
	scope.logoutClick = function(){
		getser.clearData();
		location.path('/');
	}
}])

app.controller('home', ['$scope','$http','$location','catSer','getser', function(scope,http,location,catSer,getser){
	scope.pageSizeLatest = 18;
	scope.currentPageLatest = 1;
	scope.pageSizePopular = 24;
	scope.currentPagePopular = 1;
	scope.icons = [];
	scope.cats = [];

	scope.likedOrNot = function(id){
		if(!localStorage.getItem('login')){
			scope.liked = false;
			return false
		}else{
			login = JSON.parse(localStorage.getItem('login'));
			username = login.username

			http({
				url: 'php/getLikedList.php',
				method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			},
				data: 'username='+username+'&postId='+id
			}).then(function(response){
				resultData = response.data
				if(resultData==="true[]"){
					scope.liked = true
				}else{
					scope.liked = false
				}
			})

			
			return scope.liked
		}
	}

	scope.like = function(id){
		scope.liked = false;
		if(!localStorage.getItem('login')){
			alert("login or register")
			scope.liked = false;
			return false
		}else{
			login = JSON.parse(localStorage.getItem('login'));
			username = login.username

			http({
				url: 'php/like.php',
				method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			},
				data: 'username='+username+'&postId='+id
			}).then(function(response){
			
			})
			scope.liked = true;
			return scope.liked
		}
		
	}

	scope.catPage = function(key){
		location.path('/category/'+key);
	}

	scope.search = function(){
		location.path('/search')
	}

	scope.selectIcon = function(){
			http.get('php/selectIcon.php')
			.then(function(data){
				scope.icons = data.data;
			})
	}

	scope.select = function(){
			http.get('php/select.php')
			.then(function(data){
				scope.cats = data.data;
			})
	}

	scope.getIconClick = function(key){
		http({
			url: 'php/getIconById.php',
			method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			},
			data: 'key='+key
		}).then(function(data){
			scope.iconsById = data.data[0];
			
		})
	}


}])

app.controller('searchCtrl', ['$scope','$http','$location','getser','filterFilter', function(scope,http,location,getser,filterFilter){
	scope.pageSizeSearch = 12;
	scope.currentPageSearch = 1;
	scope.icons = [];
	scope.$watch('search', function (newVal, oldVal) {
		scope.filtered = filterFilter(scope.icons, newVal);
		scope.total = scope.filtered.length;
		scope.currentPageSearch = 1;
	}, true);

	scope.logoutClick = function(){
		getser.clearData();
		location.path('/');
	}

	scope.getIconClick = function(key){
		http({
			url: 'php/getIconById.php',
			method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			},
			data: 'key='+key
		}).then(function(data){
			scope.iconsById = data.data[0];
		})
	}

	scope.selectIcon = function(){
			http.get('php/selectIcon.php')
			.then(function(data){
				scope.icons = data.data;
				scope.total = scope.icons.length;
			})
	}
}])

app.controller('categoryCtrl', ['$scope','$routeParams','catSer','$http', function(scope,routeParams,catSer,http){
	scope.pageSizeCategory = 12;
	scope.currentPageCategory = 1;
	scope.iconsByCategory = [];

	scope.catName = routeParams.categoryName;
	
	scope.selectIconsByCategory = function(){
			http({
				url: 'php/getIconByCategory.php',
				method: 'POST',
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded'
				},
				data: 'key='+routeParams.categoryName
				}).then(function(data){
				scope.iconsByCategory = data.data
			})	
	}

	scope.selectIconsByCategory();
	
}])

