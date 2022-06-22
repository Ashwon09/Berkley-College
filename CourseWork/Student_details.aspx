<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student_details.aspx.cs" Inherits="CourseWork.Student_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h1 class="text-center">Student Details
           </h1>
    <asp:GridView class="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PERSON_ID" DataSourceID="SqlDataSource1" AllowSorting="True">
         <Columns>
             <asp:BoundField DataField="PERSON_ID" HeaderText="PERSON_ID" ReadOnly="True" SortExpression="PERSON_ID" />
             <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
             <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
             <asp:BoundField DataField="FACULTY" HeaderText="FACULTY" SortExpression="FACULTY" />
             <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
         </Columns>
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="Select P.person_id, P.name, S.dob, S.faculty, P.email from student S join person P on s.student_id=P.person_id"></asp:SqlDataSource>
            
        <a href="edit_student" class="btn btn-success">Add OR Edit Student</a>
             

</asp:Content>
