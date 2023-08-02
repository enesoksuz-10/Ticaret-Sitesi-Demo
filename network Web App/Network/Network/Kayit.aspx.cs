using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Network
{
    public partial class Kayitt : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnKayit_Click(object sender, EventArgs e)
        {
            try
            {
                // sqle bağlanıyoruz
                baglanti.ConnectionString = "Data Source=ENES\\MSSQLSERVER2;Initial Catalog=networkLoginDatabase2;Integrated Security=true";

                // Kullanıcı adının veritabanında var olup olmadığını kontrol et
                SqlCommand cmdKullaniciKontrol = new SqlCommand("SELECT COUNT(*) FROM Users WHERE KullaniciAdi = @KullaniciAdi", baglanti);


                cmdKullaniciKontrol.Parameters.AddWithValue("@KullaniciAdi", txtKullaniciAdi.Text);
                baglanti.Open();
                int kullaniciAdiSayisi = (int)cmdKullaniciKontrol.ExecuteScalar();

                // E-postanın veritabanında var olup olmadığını kontrol et
                SqlCommand cmdEpostaKontrol = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Eposta = @Eposta", baglanti);
                cmdEpostaKontrol.Parameters.AddWithValue("@Eposta", tbEposta.Text);
                int epostaSayisi = (int)cmdEpostaKontrol.ExecuteScalar();
                if (string.IsNullOrEmpty(txtKullaniciAdi.Text) || string.IsNullOrEmpty(tbSifre.Text) || string.IsNullOrEmpty(tbAdi.Text) || string.IsNullOrEmpty(tbSoyadi.Text) || string.IsNullOrEmpty(tbSifre.Text))
                {
                    lblSonuc.Text = "Lütfen boş bırakılan yerleri doldurunuz.";
                }
                // Kullanıcı adı veya e-posta zaten kullanılıyorsa hata mesajı göster
                else if (kullaniciAdiSayisi > 0)
                {
                    lblSonuc.Text = "Kullanıcı adı zaten kullanılıyor.";
                }
                else if (epostaSayisi > 0)
                {
                    lblSonuc.Text = "E-posta zaten kullanılıyor.";
                }

                else
                {
                    // Yeni kayıt ekleme işlemi
                    SqlCommand cmdekle = new SqlCommand("INSERT INTO Users (Adi, Soyadi, KullaniciAdi, Sifre, Eposta) VALUES (@Adi, @Soyadi, @KullaniciAdi, @Sifre, @Eposta)", baglanti);
                    cmdekle.Parameters.AddWithValue("@Adi", tbAdi.Text);
                    cmdekle.Parameters.AddWithValue("@Soyadi", tbSoyadi.Text);
                    cmdekle.Parameters.AddWithValue("@KullaniciAdi", txtKullaniciAdi.Text);
                    cmdekle.Parameters.AddWithValue("@Eposta", tbEposta.Text);
                    cmdekle.Parameters.AddWithValue("@Sifre", tbSifre.Text);

                    cmdekle.ExecuteNonQuery(); // insert into cümlesini çalıştırıyor.
                    
                    lblSonuc.Text = "Kayıt Başarılı.";
                    System.Threading.Thread.Sleep(1000);
                    Response.Redirect("Login");
                    // gvKullanicilar.DataBind(); // tabloyu butona tıklar tıklamaz yeniler.
                }
            }
            catch (Exception)
            {
            }
            finally
            {
                baglanti.Close();
                tbAdi.Text = "";
                tbSoyadi.Text = "";
                txtKullaniciAdi.Text = "";
                tbEposta.Text = "";
                tbSifre.Text = "";
            }
        }
    }
}