<!--
.. title: Generating partner.jar for Salesforce API Integration
.. slug: generating-partnerjar-for-salesforce-api-integration
.. date: 11/12/2014 02:12:38 AM UTC
.. tags: tutorials, java
.. link:
.. description:
.. type: text
-->

I ran into a small issue recently when setting up a Java project to use the
Salesforce APIs.

Basically, you need to download a WSDL file from Salesforce, then use a tool made
by them to generate a jar that you then include in your Java program.

They instruct you to [download `force-wsc.jar`](http://mvnrepository.com/artifact/com.force.api/force-wsc/) and then run it, but when
you run it you realize they didn't pack the dependencies within the jar!

To solve this problem, you need to download the following jars:

 - [js-1.7R2.jar](http://mvnrepository.com/artifact/rhino/js/1.7R2)
 - [ST-4.0.7.jar](http://mvnrepository.com/artifact/org.antlr/ST4/4.0.7)

And then run `force-wsc.jar`, including the dependencies in the classpath:

```bash
$ java -classpath force-wsc-32.1.1.jar:js-1.7R2.jar:ST-4.0.7.jar \
  com.sforce.ws.tools.wsdlc partner.wsdl partner-32.1.1.jar
```

Please note these were the versions that worked for me. If your `force-wsc.jar` is
a different version, check if you need to include other version of its dependencies.
