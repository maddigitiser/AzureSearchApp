<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="SearchApp" generation="1" functional="0" release="0" Id="5d87b1f8-8bf1-4363-96fc-a139a42e1eff" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="SearchAppGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="FrontEndWebRole:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/SearchApp/SearchAppGroup/LB:FrontEndWebRole:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="BackEndWorker:Microsoft.ServiceBus.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/SearchApp/SearchAppGroup/MapBackEndWorker:Microsoft.ServiceBus.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="BackEndWorker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/SearchApp/SearchAppGroup/MapBackEndWorker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="BackEndWorker:SqlAzureServer" defaultValue="">
          <maps>
            <mapMoniker name="/SearchApp/SearchAppGroup/MapBackEndWorker:SqlAzureServer" />
          </maps>
        </aCS>
        <aCS name="BackEndWorkerInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/SearchApp/SearchAppGroup/MapBackEndWorkerInstances" />
          </maps>
        </aCS>
        <aCS name="FrontEndWebRole:Microsoft.ServiceBus.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/SearchApp/SearchAppGroup/MapFrontEndWebRole:Microsoft.ServiceBus.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="FrontEndWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/SearchApp/SearchAppGroup/MapFrontEndWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="FrontEndWebRole:SqlAzureServer" defaultValue="">
          <maps>
            <mapMoniker name="/SearchApp/SearchAppGroup/MapFrontEndWebRole:SqlAzureServer" />
          </maps>
        </aCS>
        <aCS name="FrontEndWebRoleInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/SearchApp/SearchAppGroup/MapFrontEndWebRoleInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:FrontEndWebRole:Endpoint1">
          <toPorts>
            <inPortMoniker name="/SearchApp/SearchAppGroup/FrontEndWebRole/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapBackEndWorker:Microsoft.ServiceBus.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/SearchApp/SearchAppGroup/BackEndWorker/Microsoft.ServiceBus.ConnectionString" />
          </setting>
        </map>
        <map name="MapBackEndWorker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/SearchApp/SearchAppGroup/BackEndWorker/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapBackEndWorker:SqlAzureServer" kind="Identity">
          <setting>
            <aCSMoniker name="/SearchApp/SearchAppGroup/BackEndWorker/SqlAzureServer" />
          </setting>
        </map>
        <map name="MapBackEndWorkerInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/SearchApp/SearchAppGroup/BackEndWorkerInstances" />
          </setting>
        </map>
        <map name="MapFrontEndWebRole:Microsoft.ServiceBus.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/SearchApp/SearchAppGroup/FrontEndWebRole/Microsoft.ServiceBus.ConnectionString" />
          </setting>
        </map>
        <map name="MapFrontEndWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/SearchApp/SearchAppGroup/FrontEndWebRole/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapFrontEndWebRole:SqlAzureServer" kind="Identity">
          <setting>
            <aCSMoniker name="/SearchApp/SearchAppGroup/FrontEndWebRole/SqlAzureServer" />
          </setting>
        </map>
        <map name="MapFrontEndWebRoleInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/SearchApp/SearchAppGroup/FrontEndWebRoleInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="BackEndWorker" generation="1" functional="0" release="0" software="C:\Users\Tom\documents\visual studio 2012\Projects\SearchApp\SearchApp\csx\Debug\roles\BackEndWorker" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="1792" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <settings>
              <aCS name="Microsoft.ServiceBus.ConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="SqlAzureServer" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;BackEndWorker&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;BackEndWorker&quot; /&gt;&lt;r name=&quot;FrontEndWebRole&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/SearchApp/SearchAppGroup/BackEndWorkerInstances" />
            <sCSPolicyFaultDomainMoniker name="/SearchApp/SearchAppGroup/BackEndWorkerFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
        <groupHascomponents>
          <role name="FrontEndWebRole" generation="1" functional="0" release="0" software="C:\Users\Tom\documents\visual studio 2012\Projects\SearchApp\SearchApp\csx\Debug\roles\FrontEndWebRole" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.ServiceBus.ConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="SqlAzureServer" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;FrontEndWebRole&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;BackEndWorker&quot; /&gt;&lt;r name=&quot;FrontEndWebRole&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/SearchApp/SearchAppGroup/FrontEndWebRoleInstances" />
            <sCSPolicyFaultDomainMoniker name="/SearchApp/SearchAppGroup/FrontEndWebRoleFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyFaultDomain name="BackEndWorkerFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyFaultDomain name="FrontEndWebRoleFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="BackEndWorkerInstances" defaultPolicy="[1,1,1]" />
        <sCSPolicyID name="FrontEndWebRoleInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="baa5536d-9eba-4662-b9a2-04816f1a86a8" ref="Microsoft.RedDog.Contract\ServiceContract\SearchAppContract@ServiceDefinition.build">
      <interfacereferences>
        <interfaceReference Id="897a112b-b04f-4dc6-aac3-4f81e1a8535e" ref="Microsoft.RedDog.Contract\Interface\FrontEndWebRole:Endpoint1@ServiceDefinition.build">
          <inPort>
            <inPortMoniker name="/SearchApp/SearchAppGroup/FrontEndWebRole:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>