using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace WebApplication2
{
	public partial class Admin : System.Web.UI.Page
	{
		MySqlConnection cnt;
		MySqlCommand cmd;
		string cnts;
		string sql;
		MySqlDataReader rd;
		MySqlCommand cmdi;

		protected void Page_Load(object sender, EventArgs e)
		{
			cnts = System.Configuration.ConfigurationManager.ConnectionStrings["Myconnection"].ToString();
			cnt = new MySqlConnection(cnts);
			cnt.Open();

			if (Request.QueryString["method"] == null)
			{

				lbl_Quanly.Text = "Hãy Chọn một Mục Quản Lý";
			}
			else
			{
				if (Request.QueryString["method"] == "QLX")
				{
					lbl_Quanly.Text = "Quản Lý Xe Máy";
					lbl_Quanly.EnableViewState = false;
					lbl_thongtin1.Text = "Nhập Tên";
					lbl_thongtin1.EnableViewState = false;
					lbl_thongtin2.Text = "Nhập Thông tin";
					lbl_thongtin2.EnableViewState = false;
					lbl_thongtin3.Text = "Nhập Id Loại xe";
					lbl_thongtin3.EnableViewState = false;
					lbl_thongtin4.Text = "Nhập Giá";
					lbl_thongtin4.EnableViewState = false;
					sql = "select * from xe";
					cmd = new MySqlCommand(sql, cnt);
					rd = cmd.ExecuteReader();
					while (rd.HasRows && rd.Read())
					{
						lbl_Quanly.Text += "<table width='250px' height='250px' border='1'><tr><td><table width='100%' border='0'><tr><td height='200px'><img src=" + rd.GetString(rd.GetOrdinal("Hinh")) + " width='250px' height='150px' /> <br /> " + rd.GetString(rd.GetOrdinal("Tenx")) + "</td></tr><tr><td height='50px'><table height='50px' border='0'><tr><td width='125px'>" + rd.GetString(rd.GetOrdinal("Gia")) + "</td><td width='125px'>" + "<a href='admin.aspx?method=Sua&xe=" + rd.GetString(rd.GetOrdinal("Idx")) + "'>Sửa</a>" + "</td></tr></table></td></tr></table></td></tr></table>" + "\t";
					}

				}
				if(Request.QueryString["method"] == "QLLX")
				{
					lbl_Quanly.Text = "Quản Lý Loai Xe Máy";
					lbl_Quanly.EnableViewState = false;
					lbl_thongtin1.Text = "Nhập Tên";
					lbl_thongtin1.EnableViewState = false;
					sql = "select * from loaixe";
					cmd = new MySqlCommand(sql, cnt);
					rd = cmd.ExecuteReader();
					while (rd.HasRows && rd.Read())
					{
						lbl_Quanly.Text += "<ul><li>"+ rd.GetString(rd.GetOrdinal("Idlx")) +"</li><li>" + rd.GetString(rd.GetOrdinal("Tenlx")) + "</li></ul><br/>";
					}
				}
				if(Request.QueryString["method"] == "QLA")
				{
					lbl_Quanly.Text = "Quản Lý Loai Xe Máy";
					lbl_Quanly.EnableViewState = false;
					lbl_thongtin1.Text = "Nhập Tên";
					lbl_thongtin1.EnableViewState = false;
					sql = "select * from account";
					cmd = new MySqlCommand(sql, cnt);
					rd = cmd.ExecuteReader();
					while (rd.HasRows && rd.Read())
					{
						lbl_Quanly.Text += "<ul><li>" + rd.GetString(rd.GetOrdinal("Ida")) + "</li><li>" + rd.GetString(rd.GetOrdinal("username")) + "</li></ul><br/>";
					}
				}
			}
		}

		protected void btn_ThemX_Click(object sender, EventArgs e)
		{
			cnts = System.Configuration.ConfigurationManager.ConnectionStrings["Myconnection"].ToString();
			cnt = new MySqlConnection(cnts);
					string filename = "~/Hinh/" + FileUpload1.FileName;
					string filepath = MapPath(filename);
					FileUpload1.SaveAs(filepath);
					Image1.ImageUrl = filename;
					sql = "insert into xe(Tenx,Thongtinx,Gia,Hinh,Idlx) values('"+Txt_thongtin1.Text+"','"+Txt_Thongtin2.Text+"','"+Txt_Thongtin4.Text+"','Hinh/"+FileUpload1.FileName+"','"+Txt_Thongtin3.Text+"')";
					cnt.Open();
			cmd = new MySqlCommand(sql, cnt);
			rd = cmd.ExecuteReader();
			lbl_chon.Text = "Da Them Xe trong CSDL";
				}

		protected void btn_XoaXe_Click(object sender, EventArgs e)
		{
			cnts = System.Configuration.ConfigurationManager.ConnectionStrings["Myconnection"].ToString();
			cnt = new MySqlConnection(cnts);
			sql = "delete from xe where Tenx="+Txt_thongtin1.Text;
			cnt.Open();
			cmd = new MySqlCommand(sql, cnt);
			rd = cmd.ExecuteReader();
			lbl_chon.Text = "Da Xoa Xe trong CSDL";
		}

		protected void btn_Them_X_Click(object sender, EventArgs e)
		{
			cnts = System.Configuration.ConfigurationManager.ConnectionStrings["Myconnection"].ToString();
			cnt = new MySqlConnection(cnts);
			sql = "insert into loaixe(Tenlx) values('"+ Txt_thongtin1.Text +"')";
			cnt.Open();
			cmd = new MySqlCommand(sql, cnt);
			rd = cmd.ExecuteReader();
			lbl_chon.Text = "Da Them Loai Xe trong CSDL";
		}

		protected void btn_XoaLX_Click(object sender, EventArgs e)
		{
			cnts = System.Configuration.ConfigurationManager.ConnectionStrings["Myconnection"].ToString();
			cnt = new MySqlConnection(cnts);
			sql = "delete from loaixe where Tenlx=" + Txt_thongtin1.Text;
			cnt.Open();
			cmd = new MySqlCommand(sql, cnt);
			rd = cmd.ExecuteReader();
			lbl_chon.Text = "Da Xoa Loai Xe trong CSDL";
		}
	}
		
	
}