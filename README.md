# Demo of Kudu WebJob AppSetting Override Issue
Demo project to illustrate a bug with WebJobs in Kudu not always having their appSettings overridden by Azure App Service app settings

**Expectation:** AppSettings in app.config of a WebJob deployed in place should be overridden if set in the hosting Azure App Service application settings.
**Actual:** AppSetting as per WebJob is used, the Azure App Service application setting is not used by the WebJob.

**NOTE:** This only occurs for in place deployment, if "is_in_place" in the settings.job file of the WebJob is false then its AppSettings are correctly overridden by the hosting Azure App Service application settings.

**Steps to reproduce:**
* This repo contains a web project for hosting the WebJobs and two WebJobs - one set to be deployed in place and the other to be deployed to a temp location.  Each project has an Application Setting called settingOrigin... which is set to Website, WebJob - In Place and WebJob - Not in Place respectively.
* Clone repository
* Deploy web project to app service (it should also deploy the two WebJobs - if it doesn't then right click the web project and choose "Add Existing Project as Azure WebJob" - do this for both web jobs and then deploy web project again).
* When each project is run locally they will say:
  * Web: settingOrigin = Website
  * WebJob: settingOrigin = WebJob - In Place
  * WebJobNoInPlace: settingOrigin = WebJob - Not In Place
* Create Application Setting in the Azure portal for the website with key=settingOrigin and value=Azure App Service Application Setting, save setting.
* When each project is run in Azure they will now say:
  * Web: settingOrigin = Azure App Service Application Setting
  * WebJob: settingOrigin = WebJob - In Place **(this is the bug, it should be Azure App Service Application Setting)**
  * WebJobNoInPlace: settingOrigin = Azure App Service Application Setting
