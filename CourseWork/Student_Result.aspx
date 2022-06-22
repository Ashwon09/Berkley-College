<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student_Result.aspx.cs" Inherits="CourseWork.Student_Result" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1> Student Result Details
                    </h1>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="NAME" DataValueField="STUDENT_ID" AutoPostBack="True">
                        </asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="Select P.name, S.Student_ID from Student S join Person P on P.Person_ID=S.Student_ID"></asp:SqlDataSource>
                    <asp:GridView class="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                            <asp:BoundField DataField="MODULE_CODE" HeaderText="MODULE_CODE" SortExpression="MODULE_CODE" />
                            <asp:BoundField DataField="MODULE_NAME" HeaderText="MODULE_NAME" SortExpression="MODULE_NAME" />
                            <asp:BoundField DataField="GRADE" HeaderText="GRADE" SortExpression="GRADE" />
                            <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="Select P.Name,  R.Module_Code, M.Module_name, R.Grade, G.status from student S join Person P on S.Student_ID= P.Person_ID join result R on R.Student_ID = S.Student_ID join Module M on M.Module_Code=R.Module_Code join Grade G on G.Grade=R.Grade where S.Student_ID=:stdid">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="stdid" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                 </div>
             </div>
          </div>
     </div>
</asp:Content>

