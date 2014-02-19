<?xml version="1.0" encoding="UTF-8"?>
<!--
    THIS XSLT IS AUTOGENERATED DO NOT EDIT
    GENERATED ON: 2014-02-19T13:49:56.188-06:00
-->
<xsl:stylesheet xmlns:event="http://docs.rackspace.com/core/event"
                xmlns:atom="http://www.w3.org/2005/Atom"
                xmlns:httpx="http://openrepose.org/repose/httpx/v1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://wadl.dev.java.net/2009/02"
                version="2.0">
   <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
   <xsl:param name="input-headers-uri"/>
   <xsl:variable name="headerDoc" select="doc($input-headers-uri)"/>
   <xsl:template match="@*|node()">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

    <!--For product: CloudServers -->
    <xsl:template xmlns:pf="http://docs.rackspace.com/event/servers/slice"
                 match="pf:product[@version='1']/@*[some $x in ('rootPassword', 'options', 'huddleId', 'serverId', 'customerId', 'sliceType') satisfies $x eq local-name(.)]">
      <xsl:if test="exists($headerDoc//httpx:request/httpx:header[@name = 'x-roles' and @value = 'cloudfeeds:service-admin'])">
         <xsl:copy-of select="."/>
      </xsl:if>
   </xsl:template>

    <!--For product: Widget -->
    <xsl:template xmlns:pf="http://docs.rackspace.com/usage/widget"
                 match="pf:product[@version='3']/@*[some $x in ('privateAttribute1', 'myAttribute', 'privateAttribute3') satisfies $x eq local-name(.)]">
      <xsl:if test="exists($headerDoc//httpx:request/httpx:header[@name = 'x-roles' and @value = 'cloudfeeds:service-admin'])">
         <xsl:copy-of select="."/>
      </xsl:if>
   </xsl:template>
   <xsl:template xmlns:pf="http://docs.rackspace.com/usage/widget"
                 match="pf:product[@version='3']/pf:metaData/@*[some $x in ('value') satisfies $x eq local-name(.)]">
      <xsl:if test="exists($headerDoc//httpx:request/httpx:header[@name = 'x-roles' and @value = 'cloudfeeds:service-admin'])">
         <xsl:copy-of select="."/>
      </xsl:if>
   </xsl:template>
   <xsl:template xmlns:pf="http://docs.rackspace.com/usage/widget"
                 match="pf:product[@version='3']/pf:mixPublicPrivateAttributes/@*[some $x in ('privateAttribute3') satisfies $x eq local-name(.)]">
      <xsl:if test="exists($headerDoc//httpx:request/httpx:header[@name = 'x-roles' and @value = 'cloudfeeds:service-admin'])">
         <xsl:copy-of select="."/>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>
