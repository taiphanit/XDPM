<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" EnableViewState="false" CodeBehind="Admin.aspx.cs" Inherits="WebApplication2.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div id="ndcontent">
	<h1>Admin</h1>
	</div>
	<table width="500px" border="1">
  <tr>
    <td width="30%">
		<ul>
			<li><a href="Admin.aspx?method=QLX">Quản Lý Xe</a></li>
			<li><a href="Admin.aspx?method=QLLX">Quản Lý Loại Xe</a></li>
			<li><a href="Admin.aspx?method=QLA">Quản Lý Tài Khoản Khách Hàng</a></li>
		</ul>
    </td>
    <td width="70%">
		<asp:Label ID="lbl_Quanly" runat="server" Text=""></asp:Label>
		<br />
		<asp:Label ID="lbl_thongtin1" runat="server" Text=""></asp:Label>
		<asp:TextBox ID="Txt_thongtin1" runat="server"></asp:TextBox>
		<br />
		<asp:Label ID="lbl_thongtin2" runat="server" Text=""></asp:Label>
		<asp:TextBox ID="Txt_Thongtin2" runat="server"></asp:TextBox>
		<br />
		<asp:Label ID="lbl_thongtin3" runat="server" Text=""></asp:Label>
		<asp:TextBox ID="Txt_Thongtin3" runat="server"></asp:TextBox>
		<br />
		<asp:Label ID="lbl_thongtin4" runat="server" Text=""></asp:Label>
		<asp:TextBox ID="Txt_Thongtin4" runat="server"></asp:TextBox>
		<br />
		<asp:Label ID="Label1" runat="server" Text="Chọn Hình Ảnh"></asp:Label>
		<asp:FileUpload ID="FileUpload1" runat="server" />
		<asp:Image ID="Image1" runat="server" />
		<br />
		<asp:Button ID="btn_ThemX" runat="server" Text="Them Xe" OnClick="btn_ThemX_Click" />
		
		<asp:Button ID="btn_XoaXe" runat="server" Text="Xoa Xe" OnClick="btn_XoaXe_Click" />
		<br />
		<asp:Button ID="btn_ThemLX" runat="server" Text="Them Loai Xe" OnClick="btn_Them_X_Click" />
		
		<asp:Button ID="btn_XoaLX" runat="server" Text="Xoa Loai Xe" OnClick="btn_XoaLX_Click" />
		<br />
		<asp:Label ID="lbl_chon" runat="server" Text=""></asp:Label>

    </td>
  </tr>
</table>

</asp:Content>
