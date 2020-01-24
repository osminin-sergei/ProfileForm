<%@ Page Title="Profile Form" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfileForm.aspx.cs" Inherits="ProfileForm.ProfileForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>

    <asp:HiddenField ID="hfId" runat="server" />
    <div>
        <label>First Name</label>
        <asp:TextBox ID ="txtFirstName" runat="server"/>
        <asp:RequiredFieldValidator runat="server" ID="rfvFirstName" ControlToValidate="txtFirstName" ErrorMessage="First Name is required." Display="Dynamic"/>
    </div>
    <div>
        <label>Last Name</label>
        <asp:TextBox ID ="txtLastName" runat="server" />
        <asp:RequiredFieldValidator runat="server" ID="rfvLastName" ControlToValidate="txtLastName" ErrorMessage="Last Name is required." Display="Dynamic"/>
    </div>
    <div>
        <label>Age</label>
        <asp:TextBox ID ="txtAge" runat="server" />
        <asp:RequiredFieldValidator runat="server" ID="rfvAge" ControlToValidate="txtAge" ErrorMessage="Age is required." Display="Dynamic"/>
        <asp:RegularExpressionValidator runat="server" ID="revAge" ControlToValidate="txtAge" ErrorMessage="Only digits are allowed." ValidationExpression="[\d]*" Display="Dynamic"/>
    </div>
    <div>
        <label>Phone Number</label>
        <asp:TextBox ID ="txtPhoneNumber" runat="server" />
        <asp:RequiredFieldValidator runat="server" ID="rfvPhoneNumber" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number is required." Display="Dynamic"/>
    </div>
    <div>
        <label>Gender</label>
        <asp:RadioButtonList ID="rblGender" runat="server">
            <asp:ListItem Text="Male" Value="MALE" Selected="True"></asp:ListItem>
            <asp:ListItem Text="Female" Value="FEMALE"></asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <div>
        <label>Email</label>
        <asp:TextBox ID ="txtEmail" runat="server" />
        <asp:RequiredFieldValidator runat="server" ID="rfvEmail" ControlToValidate="txtEmail" ErrorMessage="Email is required." Display="Dynamic"/>
        <asp:RegularExpressionValidator runat="server" ID="revEmail" ControlToValidate="txtEmail" ErrorMessage="Email is not valid" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"/>
    </div>
    <div>
        <label>Address</label>
        <asp:TextBox ID ="txtAddress" runat="server" />
        <asp:RequiredFieldValidator runat="server" ID="rfvAddress" ControlToValidate="txtAddress" ErrorMessage="Address is required." Display="Dynamic"/>
    </div>
    <div>
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
    </div>

    <br/>
    <br/>
    <br/>

    <asp:GridView ID="gvProfiles" runat="server" AutoGenerateColumns="false" class="table">
        
    <Columns>
        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="lnkEdit_Click">Edit</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    </asp:GridView>
</asp:Content>
