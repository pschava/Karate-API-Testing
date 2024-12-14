function fn() {
	var env = karate.env; // get system property 'karate.env'
	 karate.log('karate.env system property is:', env);

	 // Default environment
	 if (!env) {
	   env = 'dev';
	 }
	 
	
    var config = {
        // Your custom configuration values here
        env: env,  // Example configuration value
        baseUrl: 'https://jsonplaceholder.typicode.com',
		username: 'defaultUser',
		password: 'defaultPassword'
		
    };
	
	if (env === 'dev') {
	  config.baseUrl = 'https://jsonplaceholder.typicode.com';
	  config.username = 'devUser';
	  config.password = 'devPassword';
	  
	} else if (env === 'qa') {
	  config.baseUrl = 'http://qa.myapi.com';
	  config.username = 'qaUser';
	  config.password = 'qaPassword';
	  
	} else if (env === 'staging') {
	  config.baseUrl = 'http://staging.myapi.com';
	  config.username = 'stagingUser';
	  config.password = 'stagingPassword';
	  
	} else if (env === 'prod') {
	  config.baseUrl = 'http://prod.myapi.com';
	  config.username = 'prodUser';
	  config.password = 'prodPassword';
	}
	
	karate.configure('connectTimeout', 5000);
	karate.configure('readTimeout', 5000);	


    // Karate-specific configuration for reporting and other settings
    karate.configure('report', {
        showLog: true,          // Show logs in the report
        showAllSteps: true,    // Show all steps in the report
        outputPath: 'target/karate-reports/' // Path where reports will be saved
    });

	config.cucumberJson = 'target/cucumber-reports/cucumber.json';
	
	
    // Return the configuration object
    return config;
}