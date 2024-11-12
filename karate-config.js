function fn() {
    var config = {
        // Your custom configuration values here
        environment: 'test',  // Example configuration value
        baseUrl: 'https://api.example.com'
    };

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

