Demo of using the puppetlabs/tomcat module to deploy a basic
helloworld style war file.

Build
--------------

    docker build -t puppet_tomcat_hellowar .

Run
-----------------

    docker run -p 8080:8080 -it puppet_tomcat_hellowar
    # puppet apply /tmp/helloworld.pp

Test
-------------------

Open up http://localohst:8080/sample/
