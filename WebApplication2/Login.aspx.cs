using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace WebApplication2
{
	public partial class WebForm1 : System.Web.UI.Page
	{
		MySqlConnection cnt;
		MySqlCommand cmd;
		string cnts;
		string sql;
		MySqlDataReader rd;
		MySqlCommand cmdi;
		string sqlinsert;
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void btn_login_Click(object sender, EventArgs e)
		{
			cnts = System.Configuration.ConfigurationManager.ConnectionStrings["Myconnection"].ToString();
			cnt = new MySqlConnection(cnts);
			cnt.Open();
			sql = "select * from account";
			cmd = new MySqlCommand(sql, cnt);
			rd = cmd.ExecuteReader();
			while (rd.HasRows && rd.Read())
			{
				if (txt_namein.Text == "Admin" && txt_passin.Text == "123456")
				{
					lbl_Messeger.Text = "Đăng Nhập Thành Công,Xin chào Admin . <a href='Admin.aspx'>Đăng Nhập</a></li> ";

				}
				else
				{
				if (txt_namein.Text == rd.GetString(rd.GetOrdinal("username")) && txt_passin.Text == rd.GetString(rd.GetOrdinal("password")))
					{
						lbl_Messeger.Text = "Đăng Nhập Thành Công,Xin chào" + rd.GetString(rd.GetOrdinal("username")) + " . <a href='index.aspx?userid="+ rd.GetString(rd.GetOrdinal("Ida")) + "'>Đăng Nhập</a></li> ";

					}
				}
			}

			cnt.Close();
		}

		protected void btn_res_Click(object sender, EventArgs e)
		{


			cnts = System.Configuration.ConfigurationManager.ConnectionStrings["Myconnection"].ToString();
			cnt = new MySqlConnection(cnts);
			sqlinsert = "insert into account(username,password) values('"+ txt_namein.Text + "','"+ txt_passin.Text+"')";

			cmdi = new MySqlCommand(sqlinsert, cnt);
			sql = "select username from account";
			cmd = new MySqlCommand(sql, cnt);
			cnt.Open();
			rd = cmd.ExecuteReader();
			while (rd.HasRows && rd.Read())
			{
				if(txt_namein.Text == rd.GetString(rd.GetOrdinal("username")))
				{
					lbl_Messeger.Text = "Tên đăng nhập đã tồn tại";
				}
				else
				{
					cnt.Close();
					cnt.Open();
					rd = cmdi.ExecuteReader();
					lbl_Messeger.Text = "Đăng Ký Thành Công.Mời Đăng Nhập lại";
				}
			}
			cnt.Close();

		}
	}
}