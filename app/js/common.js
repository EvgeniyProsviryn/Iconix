$(function(){
	$(".collection").hover(function(){
		$(".collection-block").stop().fadeIn(500)
	},function(){
		$(".collection-block").stop().fadeOut(500)
	})

	$('.icons-active').click(function(){
		$('.ic').css({'display':'block'});
		$('.cat').css({'display':'none'});
	})

	$('.category-active').click(function(){
		$('.ic').css({'display':'none'});
		$('.cat').css({'display':'block'});
	})

	

})

var app = angular.module('iconix',['ngRoute','bw.paging']);


app.config(['$routeProvider','$locationProvider',function(routeProvider,locationProvider,getser) {
	
	

	routeProvider.when('/login',{
		controller: 'loginCtrl'
	}).when('/',{
		controller: 'homeCtrl'
	}).when('/category/:categoryName',{
		templateUrl: './templates/category.html',
		controller: 'categoryCtrl'
	}).when('/register',{
		controller: 'registerCtrl'
	}).when('/dashboard',{
		templateUrl: './templates/dashboard.html',
		controller: 'dashCtrl',
		resolve:{
			check: ['$location','getser',function(location,getser){
				if(!getser.isUserLoggedIn()){
					location.path('/')
				}

				if(getser.getName() !== 'admin'){
					location.path('/user')
				}

			}]
		}
	}).when('/search',{
		templateUrl: './templates/search.html',
		controller: 'searchCtrl'
	}).when('/user',{
		templateUrl: './templates/user.html',
		controller: 'userCtrl',
		resolve:{
			checkUser: ['$location','getser',function(location,getser){
				if(!getser.isUserLoggedIn()){
					location.path('/')
				}

			}]
		}
	}).otherwise({
		template: '404'
	})	

	locationProvider.html5Mode(true);
}]);

