using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;


namespace WebApplication2
{
	public partial class Home : System.Web.UI.MasterPage
	{
		MySqlConnection cnt;
		MySqlCommand cmd;
		string cnts;
		string sql;
		MySqlDataReader rd;
		protected void Page_Load(object sender, EventArgs e)
		{
			outdataloaixe.Text = "<b>Loại xe</b><br/>";
			cnts = System.Configuration.ConfigurationManager.ConnectionStrings["Myconnection"].ToString();
			cnt = new MySqlConnection(cnts);
			cnt.Open();
			sql = "select * from loaixe";
			cmd = new MySqlCommand(sql, cnt);
			rd = cmd.ExecuteReader();
			while (rd.HasRows && rd.Read())
			{
				outdataloaixe.Text += "<a href='index.aspx?Loaixe=" + rd.GetString(rd.GetOrdinal("Idlx")) + "'>" + rd.GetString(rd.GetOrdinal("Tenlx")) + "</a><br/>";
			}
			cnt.Close();
		}
	}
}