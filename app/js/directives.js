app.directive("fileInput", ['$parse',function (parse) {
    return {
        link: function (scope, element, attrs) {
            element.bind("change", function (event) {
                var files = event.target.files;
                parse(attrs.fileInput).assign(scope,element[0].files);
                scope.$apply();
            });
        }
    }
}]);

app.directive("magnificForm",function(){
	return{
		restrict: "A",
		link: function(scope,element,attrs){
			$(element).magnificPopup({
				type: 'inline',
				preloader: false,
				focus: '#name',
				closeBtnInside: false,
				callbacks: {
					beforeOpen: function() {
						if($(window).width() < 700) {
							this.st.focus = false;
						} else {
							this.st.focus = '#name';
						}
					}
				}
			})
		}
	}
})

app.directive("magnificZoom",function(){
	return{
		restrict: "A",
		link: function(scope,element,attrs){
			$(element).magnificPopup({
				type: 'inline',
				fixedContentPos: false,
				fixedBgPos: true,
				overflowY: 'auto',
				closeBtnInside: false,
				preloader: false,
				midClick: true,
				removalDelay: 300,
				mainClass: 'my-mfp-zoom-in'
			})
		}
	}
})