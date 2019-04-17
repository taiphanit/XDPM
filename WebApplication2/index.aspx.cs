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
	public partial class index : System.Web.UI.Page
	{
		MySqlConnection cnt;
		MySqlCommand cmd;
		string cnts;
		string sql;
		MySqlDataReader rd;
		protected void Page_Load(object sender, EventArgs e)
		{
			outdataxe.Text = "";
			cnts = System.Configuration.ConfigurationManager.ConnectionStrings["Myconnection"].ToString();
			cnt = new MySqlConnection(cnts);
			cnt.Open();
			sql = "select * from xe";
			cmd = new MySqlCommand(sql, cnt);
			rd = cmd.ExecuteReader();

			if(Request.QueryString["Loaixe"]==null)
			{
				while (rd.HasRows && rd.Read())
				{
					outdataxe.Text += "<table width='250px' height='250px' border='1'><tr><td><table width='100%' border='0'><tr><td height='200px'><img src=" + rd.GetString(rd.GetOrdinal("Hinh")) + " width='250px' height='150px' /> <br /><a href='Thongtin.aspx?thongtin="+ rd.GetString(rd.GetOrdinal("Idx")) + "'>" + rd.GetString(rd.GetOrdinal("Tenx")) + "</a></td></tr><tr><td height='50px'><table height='50px' border='0'><tr><td width='125px'>" + rd.GetString(rd.GetOrdinal("Gia")) + "</td><td width='125px'> <asp:Button ID='Btn_dathang' runat='server' Text='dathang' /> </td></tr></table></td></tr></table></td></tr></table>" + "\t";
				}
			}
			else
			{
				
				{
					while (rd.HasRows && rd.Read())
					{
						if (rd.GetString(rd.GetOrdinal("Idlx")) == Request.QueryString["Loaixe"])
						{
							outdataxe.Text += "<table width='250px' height='250px' border='1'><tr><td><table width='100%' border='0'><tr><td height='200px'><img src=" + rd.GetString(rd.GetOrdinal("Hinh")) + " width='250px' height='150px' /> <br /><a href='Thongtin.aspx?thongtin=" + rd.GetString(rd.GetOrdinal("Idx")) + "'>" + rd.GetString(rd.GetOrdinal("Tenx")) + "</a></td></tr><tr><td height='50px'><table height='50px' border='0'><tr><td width='125px'>" + rd.GetString(rd.GetOrdinal("Gia")) + "</td><td width='125px'> <asp:Button ID='Btn_dathang' runat='server' Text='dathang' /> </td></tr></table></td></tr></table></td></tr></table>" + "\t";
						}
					}
				}
			}
			cnt.Close();

		}
	}
}