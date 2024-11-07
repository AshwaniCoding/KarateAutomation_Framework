package com.automation.runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate runTest(){
        return Karate.run("classpath:feature")
                .outputCucumberJson(true)
                .reportDir("karate-report");
    }

}
