using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; //bunlar önemli
using System.Data.SqlClient; //bunlar önemli sql bağlanmak için


namespace Network
{
    public partial class Login : System.Web.UI.Page
    {
        //sqle bağlanıyoruz
        SqlConnection baglanti = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnGiris_Click(object sender, EventArgs e)
        {
            string kullaniciAdi = txtKullaniciAdi.Text;
            string sifre=txtSifre.Text;
            //sqle bağlanıyoruz
            baglanti.ConnectionString  = "Data Source=ENES\\MSSQLSERVER2;Initial Catalog = networkLoginDatabase2;Integrated Security=true";
            SqlCommand sorgula = new SqlCommand("SELECT * FROM Users WHERE KullaniciAdi = @KullaniciAdi AND Sifre = @Sifre", baglanti);
            sorgula.Parameters.AddWithValue("@KullaniciAdi", kullaniciAdi);
            sorgula.Parameters.AddWithValue("@Sifre", sifre);
            baglanti.Open();
            SqlDataReader oku = sorgula.ExecuteReader();
            if (oku.Read())
            {
                //Sayfa yönlendirme
                Session["kullaniciAdi"] = oku["KullaniciAdi"].ToString();
                Response.Redirect("Index");
            }
            else
            {
                lblSonuc.Text = "Kullanıcı adı ya da şifre hatalı.";
            }
            oku.Close();
            baglanti.Close();
        }
        protected void btnKayit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Kayit");
        }
    }
}