<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="content">
	Tên Đăng Nhập:
	<br />
	<asp:textbox id="txt_namein" runat="server" ></asp:textbox>
	<br />
	<br />
	Mật Khẩu:
	<br />
	<asp:textbox ID="txt_passin" runat="server"></asp:textbox>
	<br />
	<br />
	<asp:Button ID="btn_login" runat="server" Text="Đăng Nhập" OnClick="btn_login_Click" />
	<asp:Button ID="btn_res" runat="server" Text="Đăng Ký" OnClick="btn_res_Click" />
	<br />
	<br />
	<asp:Label ID="lbl_Messeger" runat="server" Text=""></asp:Label>
	
</div>
</asp:Content>
