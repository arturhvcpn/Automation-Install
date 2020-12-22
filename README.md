# Run Tests in Protractor
##### Let's doing
---
The README is considered the prerequisites expected below for the execution protractor:
  - [Ubuntu 18.04.5 LTS (Bionic Beaver)](https://releases.ubuntu.com/18.04)
  - [Chrome WebDriver](https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb)
  - [Install Node, Npm, Protractor and Protractor-Beatiful-Reporter](https://github.com/facilit/target3/wiki/Tutorial-Instala%C3%A7%C3%A3o)
  - [Enviroment Run ](https://github.com/facilit/target3/wiki/Enviroment-Util)
---

## Index 
* [Conf-js](#conf-js)
* [Eclipse](#eclipse)
* [Terminal](#terminal)

---

## Conf-js
### Conf-js How are you?
 The conf.js is a configuration file, that determinies the suites of test, the browser that will be executed, the quantity of sessions, the Jasmine test framework and another things that will be wonderful for development. [Click here to view all the options.](https://github.com/angular/protractor/blob/5.4.1/lib/config.ts)
 #### Example Conf.js Target:
 The code below,, is the conf.js example of target:
```js
const navigateSuite = require('./specs/suites/navigate');

exports.config = {
  onPrepare: require('./util/onPrepare'),
  /*
  *SUITE TESTS
  * l: login
  * r: responsavel
  * i: indicadores
  * a: agency/instituição
  */
  suites: {
    l: 'login/login-spec.js', //LOGIN
    //n: navigateSuite, //ALL MENU AND SUBMENUS NAVIGATION - TEST ThemeConfigImpl.java
    //r: ['login/login-spec.js', 'specs/responsible/specResponsible.js']//TEST RESPONSIBLE
    //i: ['login/login-spec.js', 'specs/indicator/specIndicator.js'], //TEST INDICATORS
    //a: ['login/login-spec.js', 'specs/agency/specAgency.js']//TEST AGENCY (TODO: verificar se esta funcionando)
  },
  multiCapabilities: [
    // {'browserName': 'firefox'
    //   , 'moz:firefoxOptions': { args:["--headless"] }  
    // }
    // ,
    {  'browserName': 'chrome'
      , 'chromeOptions': { args:["--disable-gpu", "--window-size=1920,1080"] }  
    }
  ],

  maxSessions: 2,

  jasmineNodeOps: {
    defaultTimeoutInterval: 3600000//1h SETTING TIMEOUT
  },

  specs: [
    'login/login-spec.js'
  ]
};
```
But, let's look at the most important now. The code that is commented, isn't executed ok?
Now looking at for parameter ```suites``` below, the parameters ```n,r,i,a``` are commented, so don't be executed.

```js
  suites: {
    l: 'login/login-spec.js', //LOGIN
    //n: navigateSuite, //ALL MENU AND SUBMENUS NAVIGATION
    //r: ['login/login-spec.js', 'specs/responsible/specResponsible.js']//TEST RESPONSIBLE
    //i: ['login/login-spec.js', 'specs/indicator/specIndicator.js'], //TEST INDICATORS
    //a: ['login/login-spec.js', 'specs/agency/specAgency.js']//TEST AGENCY 
  },
```

Now uncomment the parameters, it should look something like this:
```js
  suites: {
    l: 'login/login-spec.js', //LOGIN
    n: navigateSuite, //ALL MENU AND SUBMENUS NAVIGATION - TEST ThemeConfigImpl.java
    r: ['login/login-spec.js', 'specs/responsible/specResponsible.js'],//TEST RESPONSIBLE
    i: ['login/login-spec.js', 'specs/indicator/specIndicator.js'], //TEST INDICATORS
    a: ['login/login-spec.js', 'specs/agency/specAgency.js']//TEST AGENCY (TODO: verificar se esta funcionando)
  },
```
And run task of ant below
```sh
artur in target3/target2
❯ ant deploy-fast
```
Now let's execute!!

## Now let's execute the tests
* [Eclipse](#eclipse)
* [Terminal](#terminal)
---

## Eclipse
### Run in eclipse workspace
#####   1. Enter the Ant Tab
![](https://i.imgur.com/3VOawWy.png)

#####   2. Click in run-tests-protractor
![](https://i.imgur.com/dAJTmNF.png)

#####  3. Enter url of login domain or Click OK for default 
![](https://i.imgur.com/kx6whY8.png)

#####  4. Enter email to login or Click OK for default
![](https://i.imgur.com/JKq77ih.png)

#####  5. Enter password to login
![](https://i.imgur.com/tR8P0OU.png)

#####  6. Enter the suite of test or  Click OK for default
![](https://i.imgur.com/BpUYYla.png)

---

## Terminal
### Run in terminal linux
#### Wherever the ❯ icon is considered input for commands:
```sh
artur in ~
❯ 
```
####   1. Change directory for workspace of target3/target2, in this example my workspace directory is:
```sh
artur in ~
❯ cd /home/artur/workspace/target3/target2
```
####   2. Type on terminal and press Enter for execute
```sh
artur in target3/target2
❯ ant run-tests-protractor
```

####  3. Enter url of login domain or press Keyboard Enter for url default [localhost](http://localhost:8080/web/facilit/login)
```sh
artur in target3/target2
 ant run-tests-protractor
Buildfile: /home/artur/workspace/target3/target2/build.xml

run-tests-protractor:

run-tests-protractor:
Trying to override old definition of task xmltask
Unresolvable reference ${portlet.name}.lib.classpath might be a misuse of property expansion syntax.
[project-dependencies-custom] null
Trying to override old definition of task javac

run-tests-protractor:
    [input] Host to test [http://localhost:8080/web/facilit/login]
❯
```

####  4. Enter email to login or press Keyboard Enter for url default
```sh
    [input] Host to test [http://localhost:8080/web/facilit/login]

    [input] User test e-mail [suporte@communis.com.br]
❯  
```

####  5. Enter password to login
```sh
    [input] Host to test [http://localhost:8080/web/facilit/login]

    [input] User test e-mail [suporte@communis.com.br]

    [input] User test password
❯  
```
####  6. Enter the suite of test
```sh
run-tests-protractor:
    [input] Host to test [http://localhost:8080/web/facilit/login]

    [input] User test e-mail [suporte@communis.com.br]

    [input] User test password

    [input] Add suite test typing '--suite t', where 't' is the suite test name. 
    [input]   Suites available: 
    [input]          i -> indicator 
    [input]          r -> responsible 
    [input]          n -> navigation over menu and submenus 
    [input]          l -> only login 
    [input]  
    [input]       **If you want execute more than one test, use comma to separete them, like 'n,i' 
    [input]          **OBS: for the first execution, suite 'i' depends on suite 'r'. So to test indicator at first time, use '--suite r,i'.
    [input]  [--suite r]
❯   --suite n,i,r
```

License
----
MIT
