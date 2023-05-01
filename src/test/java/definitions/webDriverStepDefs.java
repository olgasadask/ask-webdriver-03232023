package definitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

import static support.TestContext.getDriver;

public class webDriverStepDefs {
    @Given("AV navigate to {string}")
    public void avNavigateTo(String sURL) {
        // getDriver().get("https://www.google.com/");

        switch (sURL) {
            case "Google":
                getDriver().get("https://www.google.com/");
                break;
            case "Portnov":
                getDriver().get("https://www.portnov.com/");
                break;
            case "ask-int":
                getDriver().get("http://ask-int.portnov.com/");
                break;
            default:
                System.out.println("No URL found");

        }
    }

    @Then("AV get page information")
    public void avGetPageInformation() {
        System.out.println("The page title is " + getDriver().getTitle());
        System.out.println("The page URL is " + getDriver().getCurrentUrl());
        System.out.println("The window handle is " + getDriver().getWindowHandle());

    }

    @And("AV maximize the window")
    public void avMaximizeTheWindow() {
        getDriver().manage().window().maximize();
    }
}


