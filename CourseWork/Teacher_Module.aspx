<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Teacher_Module.aspx.cs" Inherits="CourseWork.Teacher_Module" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="text-center">Teacher Module Mapping    </h1>
    
        <asp:DropDownList ID="DropDownList1" runat="server" Height="27px" DataSourceID="SqlDataSource1" DataTextField="NAME" DataValueField="TEACHER_ID" AutoPostBack="True">
        </asp:DropDownList>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="Select T.teacher_id , P.name from Teacher T join Person P ON P.person_id = T.teacher_id "></asp:SqlDataSource>
    <asp:GridView class="table" ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" Width="679px">
        <Columns>
            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
            <asp:BoundField DataField="SALARY" HeaderText="SALARY" SortExpression="SALARY" />
            <asp:BoundField DataField="MODULE_NAME" HeaderText="MODULE_NAME" SortExpression="MODULE_NAME" />
            <asp:BoundField DataField="MODULE_CODE" HeaderText="MODULE_CODE" SortExpression="MODULE_CODE" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="Select P.name, P.email, T.salary, M.module_name, M.module_code from Person P join Teacher T on P.person_id=T.teacher_id join teacher_module TM on TM.teacher_id=T.teacher_id join Module M on M.module_code=TM.module_code where T.teacher_id= :teacherid">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="teacherid" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
