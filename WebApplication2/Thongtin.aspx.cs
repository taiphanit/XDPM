using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace WebApplication2
{
	public partial class WebForm2 : System.Web.UI.Page
	{
		MySqlConnection cnt;
		MySqlCommand cmd;
		string cnts;
		string sql;
		MySqlDataReader rd;
		protected void Page_Load(object sender, EventArgs e)
		{
			string url = Request.QueryString["thongtin"];
			cnts = System.Configuration.ConfigurationManager.ConnectionStrings["Myconnection"].ToString();
			cnt = new MySqlConnection(cnts);
			cnt.Open();
			sql = "select * from xe where idx=" + url;
			cmd = new MySqlCommand(sql, cnt);
			rd = cmd.ExecuteReader();
			while (rd.Read())
			{
				Hinh.Text = "<img src='" + rd.GetString(rd.GetOrdinal("Hinh")) + "' />";
				Ten.Text = "Tên Xe:<br/><b>" + rd.GetString(rd.GetOrdinal("Tenx")) + "</b><br/>";
				Gia.Text = "Giá Xe:<br/><b>" + rd.GetString(rd.GetOrdinal("Gia")) + "</b><br/>";
				Thongtin.Text = "Thong Tin:<br/><b>" + rd.GetString(rd.GetOrdinal("Thongtinx")) + "</b>";
			}
			string sqlidlx = "select * from loaixe where idlx=" + rd.GetString(rd.GetOrdinal("idlx"));
			cnt.Close();
			cnt.Open();
			cmd = new MySqlCommand(sqlidlx, cnt);
				rd = cmd.ExecuteReader();
			while (rd.Read())
			{
				Loai.Text = "Loại Xe:<br/><b>" + rd.GetString(rd.GetOrdinal("idlx")) + "</b><br/>";
			}
		}
	}
}