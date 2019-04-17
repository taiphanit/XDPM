<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Thongtin.aspx.cs" Inherits="WebApplication2.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<table width="500px" height="750px" border="1">
  <tr>
    <td width="200px" height="450px">
		<asp:Label ID="Hinh" runat="server" Text=""></asp:Label>
	</td>
    <td width="300px" height="450px">
		<asp:Label ID="Ten" runat="server" Text=""></asp:Label>
	  <asp:Label ID="Loai" runat="server" Text=""></asp:Label>
	  <asp:Label ID="Gia" runat="server" Text=""></asp:Label>
		</td>
  </tr>
  <tr>
    <td width="200px" height="250px">
		<asp:Label ID="Thongtin" runat="server" Text=""></asp:Label></td>
    <td width="300px" height="250px"></td>
  </tr>
</table>
</asp:Content>
