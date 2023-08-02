using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Network
{
    public partial class About : Page
    {
        SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvKullanicilar_SelectedIndexChanged(object sender, EventArgs e)
        {


            GridViewRow selectedRow = gvKullanicilar.SelectedRow;
            string adi = selectedRow.Cells[1].Text;
            string soyadi = selectedRow.Cells[2].Text;
            string kullaniciAdi = selectedRow.Cells[3].Text;
            string sifre = selectedRow.Cells[4].Text;
            string eposta = selectedRow.Cells[5].Text;

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            GridViewRow row = (GridViewRow)btnDelete.NamingContainer;
            int rowIndex = row.RowIndex;
            string id = gvKullanicilar.DataKeys[rowIndex].Value.ToString();

            // Silme işlemini gerçekleştirin
            // Veritabanından satırı silmek için gerekli işlemleri yapabilirsiniz

            // Örnek bir silme işlemi:
            string connectionString = ConfigurationManager.ConnectionStrings["networkLoginDatabase2ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM [Users] WHERE Id = @Id", con);
                cmd.Parameters.AddWithValue("@Id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            // GridView'i güncelleyin
            BindGridView();
        }

        private void BindGridView()
        {
            // GridView'i yeniden veriyle bağlama işlemini yapabilirsiniz
            gvKullanicilar.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string adi = txtAdi.Text;
            string soyadi = txtSoyadi.Text;
            string kullaniciAdi = txtKullaniciAdi.Text;
            string sifre = txtSifre.Text;
            string eposta = txtEposta.Text;

            // GridView'deki seçili satırı alın
            GridViewRow selectedRow = gvKullanicilar.SelectedRow;

            if (selectedRow != null)
            {
                // Seçili satırdan Id değerini alın
                int id = Convert.ToInt32(selectedRow.Cells[0].Text);

                // Örnek bir güncelleme işlemi:
                string connectionString = ConfigurationManager.ConnectionStrings["networkLoginDatabase2ConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("UPDATE Users SET Adi = @Adi, Soyadi = @Soyadi, KullaniciAdi = @KullaniciAdi, Sifre = @Sifre, Eposta = @Eposta WHERE Id = @Id", con);

                    cmd.Parameters.AddWithValue("@Adi", adi);
                    cmd.Parameters.AddWithValue("@Soyadi", soyadi);
                    cmd.Parameters.AddWithValue("@KullaniciAdi", kullaniciAdi);
                    cmd.Parameters.AddWithValue("@Sifre", sifre);
                    cmd.Parameters.AddWithValue("@Eposta", eposta);
                    cmd.Parameters.AddWithValue("@Id", id);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                // GridView'i güncelleyin
                BindGridView();
            }
        }


        protected void gvKullanicilar_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRow")
            {
                // Silme işlemini gerçekleştirin
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                // GridView'den veri silme işlemlerini yapabilirsiniz
            }
            else if (e.CommandName == "UpdateRow")
            {
                // Güncelleme işlemini gerçekleştirin
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                // GridView'deki veriyi güncelleme işlemlerini yapabilirsiniz
            }
        }

    }
}