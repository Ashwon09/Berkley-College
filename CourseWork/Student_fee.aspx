<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student_fee.aspx.cs" Inherits="CourseWork.Student_fee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h1 class="text-center">Student Fee Details   
            
        </h1>
    <asp:DropDownList class="dropdown" ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="NAME" DataValueField="STUDENT_ID">
            </asp:DropDownList>
      
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select p.name , s.student_id from person p join student s on s.student_id=p.person_id"></asp:SqlDataSource>
        <asp:GridView class="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="831px">
            <Columns>
                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                <asp:BoundField DataField="DATE_OF_PAYMENT" HeaderText="DATE_OF_PAYMENT" SortExpression="DATE_OF_PAYMENT" />
                <asp:BoundField DataField="PAYMENT_AMOUNT" HeaderText="PAYMENT_AMOUNT" SortExpression="PAYMENT_AMOUNT" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select p.name, p.email, f.date_of_payment, f.payment_amount from student s join person p on p.person_id= s.student_id join fee f on f.student_id=s.student_id where s.student_id = :sid
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="sid" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
      
</asp:Content>
