package com.example;
//import static org.junit.Assert.assertTrue;

import static org.junit.Assert.assertTrue;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
//import org.junit.jupiter.api.Test;
import org.junit.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;





//@RunWith(Karate.class)  // JUnit 4 Runner for Karate tests
public class KarateTestRunner {
    // No need to manually call Karate.run here
	
	
	@Test
	   public void testParallel() {
	       //Results results = Runner.path("classpath:com/example/api-tests.feature").tags("@done").outputCucumberJson(true).parallel(1);
	       Results results = Runner.path("classpath:com/example/api-tests.feature").outputCucumberJson(true).parallel(1);
	       //Results results = Runner.path("classpath:com/example/auth-and-protected-test.feature").outputCucumberJson(true).parallel(1);
	       generateReport(results.getReportDir());
	       System.out.println("this is "+results.getReportDir());
	       assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
	       
	        
	        
	   }
	 public static void generateReport(String karateOutputPath) {
	        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
	        List<String> jsonPaths = new ArrayList(jsonFiles.size());
	        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
	        Configuration config = new Configuration(new File("target"), "qa-automation");
	        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
	        reportBuilder.generateReports();
	    }
	  
}



