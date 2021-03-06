# XSD 1.0 Core Schema

This directory contains XSD 1.0 versions of the core event/usage
XSDs. These XSDs are non-normative, that is to say, these are not the
XSDs that will be used for validation.

The normative XSDs are the ones in the parent directory, they are
based on the XSD 1.1 standard, and contain many business assertions
not found in these XSDs.

The XSDs found in this directory are meant to be consumed by tools
like JAX-B which currently do not have support for XSD 1.1.

**DO NOT USE THE XSDs IN THIS DIRECTORY FOR VALIDATION**

If you need to do XSD 1.1 validation, there are currently two tools
available:

1. Xerces: Is an OpenSource Java implementation, with command line
   utilities etc. We have a patched version which incorporates many bug
   fixes.  You can find it here:
   https://github.com/RackerWilliams/xercesj

   If you use maven, you can pull it in from here:

   ```xml
   <dependency>
     <groupId>xerces</groupId>
     <artifactId>xerces-xsd11</artifactId>
     <version>2.12.0-rax</version>
   </dependency>
   ```

   ```xml
   <repository>
     <id>rackspace-research</id>
     <name>Rackspace Research Repository</name>
     <url>http://maven.research.rackspacecloud.com/content/groups/public/</url>
   </repository>
   ```

2. Saxon: A proprietary tool, it is significantly faster than Xerces.

   If you use maven, you can pull it from here:

   ```xml
   <dependency>
      <groupId>net.sf.saxon</groupId>
      <artifactId>saxon-ee</artifactId>
      <version>9.4.0.4</version>
   </dependency>
   ```

   ```xml
   <repository>
      <id>rackspace-research</id>
      <name>Rackspace Research Repository</name>
      <url>http://maven.research.rackspacecloud.com/content/groups/public/</url>
   </repository>
   ```

   Saxon is proprietary and therefore requires a license. Rackspace
   has a site license for Saxon. Contact Jesse Gonzalez for details.

## Generating Code from XSD 1.0 Schema Files

The files in this directory can be consumed by code generation tools such as JAX-B. 

You would need an extra XSD file containing the import of specific product schema
XSD files, similar to the file [usage.xsd](../usage.xsd) in the parent directory.

If you want to generate code for all the product schemas, simply make a copy of the 
[usage.xsd](../usage.xsd) that's XML Schema 1.0 compatible when run your code 
generation tool.

If you only want to generate code for one or two specific product schemas, you
will have to create your own XSD file that contains the relevant import statements.
For example, if you want to generate code for the Support product schemas, you
need to create an XSD file that contains these:
```
<schema
    elementFormDefault="qualified"
    attributeFormDefault="unqualified"
    xmlns="http://www.w3.org/2001/XMLSchema"
    xmlns:event="http://docs.rackspace.com/core/event"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:vc="http://www.w3.org/2007/XMLSchema-versioning"
    targetNamespace="http://docs.rackspace.com/core/event">

    <include schemaLocation="core.xsd"/>

    <import namespace="http://docs.rackspace.com/event/support/account"
            schemaLocation="../generated_product_xsds/support-account_support.xsd"/>

    <element name="event" type="event:EventV1"/>
</schema>
```

## Regenerating XSD 1.0 Core Schema Files

**DO NOT edit the XSD 1.0 files directly**

The XSD 1.0 files are generated by running transformation on the 
XSD 1.1 files. If you are changing XSD 1.1 files, you will want
to re-generate the XSD 1.0 files. To do that, run the following:

```
$ mvn clean generate-resources -P transform-xsd
$ cp target/generated-resources/xml/xslt/core.xsd core_xsd/xsd10/_1.0Core.xsd
$ cp target/generated-resources/xml/xslt/entry.xsd core_xsd/xsd10/entry.xsd
$ git diff 
```

**DO NOT copy over the ```core_xsd/xsd10/core.xsd```**

That is the glue that links the correct version of core schema

Review the diff and make sure those are the changes you want before checking in.
