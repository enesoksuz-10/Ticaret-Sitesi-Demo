using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Network
{
    public partial class SiteMaster : MasterPage
    {
        SqlConnection baglanti = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Eğer siteye direkt linkten girmeye çalışırsa giriş ekranına gönder.
            //if (Session["KullaniciAdi"] == null)
            //{
            //    Response.Redirect("Login");
            //}
        }

        protected void btnCikis_Click(object sender, EventArgs e)
        {
            Session.Abandon();//Session kapattık.
            Response.Redirect("Login"); //Yönlendirme
        }

        protected void btnAra_Click(object sender, EventArgs e)
        {

        }
    }
}