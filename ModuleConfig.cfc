component {

	this.name           = "easykontocfml";
	this.title          = "easyKonto CFML";
	this.author         = "Blackbuck Software";
	this.webURL         = "https://github.com/blackbucksoftware/easykonto-cfml";
	this.description    = "This module will provide you with connectivity to the easyKonto API for any ColdFusion (CFML) application.";
	this.entryPoint     = "easykontocfml";
	this.modelNamespace = "easykontocfml";
	this.cfmapping      = "easykontocfml";
	this.dependencies   = [];

	function configure(){
		settings = { key : "", secret : "", baseUrl : "https://api.easykonto.de/v5" };
	}

	function onLoad(){
		binder.map( "easykonto@easykontocfml" ).to( "#moduleMapping#.easykonto" ).asSingleton().initWith( key = settings.key, baseUrl = settings.baseUrl );
	}

}
