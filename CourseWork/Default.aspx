<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CourseWork._Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Berkeley College
    </h1>
    <h2 class="text-center">Admin Dashboard</h2>
    <div class="row">
        <div class="col-md-6 text-center">
            <h2>Number of Teachers along With their Salary
            </h2>
            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Width="411px">
                <series>
                    <asp:Series Name="Series1" XValueMember="COUNT(*)" YValueMembers="SALARY">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
                </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select salary, count(*)  from teacher group by salary"></asp:SqlDataSource>
        </div>
        <div class="col-md-6 text-center">
    <h2>Number of Students in Each Faculty</h2>
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="430px">
        <series>
            <asp:Series Name="Series1" XValueMember="FACULTY" YValueMembers="COUNT(*)" ChartType="Pie">
            </asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </chartareas>
        </asp:Chart>
            </div>
     </div>
     <div class="row">
        <div class="col-md-6 text-center">
            <h2>Student and Grade</h2>
            <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource3" Width="464px">
                <series>
                    <asp:Series ChartType="Pie" Name="Series1" XValueMember="GRADE" YValueMembers="COUNT(*)">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select Grade, count(*) from result group by grade"></asp:SqlDataSource>
         </div>

         <div class="col-md-6 text-center">
             <h2>People and their Address
             </h2>
             <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSource4" Width="410px">
                 <series>
                     <asp:Series Name="Series1" XValueMember="PROVINCE" YValueMembers="COUNT(*)">
                     </asp:Series>
                 </series>
                 <chartareas>
                     <asp:ChartArea Name="ChartArea1">
                     </asp:ChartArea>
                 </chartareas>
                 </asp:Chart>
             <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select Province, count(*) from Address_Details AD join Person_Address PA on AD.address_id= PA.person_id group by province"></asp:SqlDataSource>
         </div>
  

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select faculty, count(*) from student group by faculty"></asp:SqlDataSource>
  

    </div>
</asp:Content>
