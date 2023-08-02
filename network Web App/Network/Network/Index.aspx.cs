using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Network
{

    public partial class Index : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindData();
            }

        }
        private void BindData()
        {
            string connectionString = "Data Source=ENES\\MSSQLSERVER2;Initial Catalog=networkLoginDatabase2;Integrated Security=true";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM Card", connection);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                tekrarlayici.DataSource = dt;
                tekrarlayici.DataBind();
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }
    }

}

