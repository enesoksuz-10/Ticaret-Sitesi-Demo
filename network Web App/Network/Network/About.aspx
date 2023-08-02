<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Network.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <center>
        <div style="margin-left:150px; margin-top:200px;">
            <asp:GridView ID="gvKullanicilar" runat="server" class="table table-bordered table-hover" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" OnRowCommand="gvKullanicilar_RowCommand" DataKeyNames="Id">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                    <asp:BoundField DataField="Adi" HeaderText="Adi" SortExpression="Adi"></asp:BoundField>
                    <asp:BoundField DataField="Soyadi" HeaderText="Soyadi" SortExpression="Soyadi"></asp:BoundField>
                    <asp:BoundField DataField="KullaniciAdi" HeaderText="KullaniciAdi" SortExpression="KullaniciAdi"></asp:BoundField>
                    <asp:BoundField DataField="Sifre" HeaderText="Sifre" SortExpression="Sifre"></asp:BoundField>
                    <asp:BoundField DataField="Eposta" HeaderText="Eposta" SortExpression="Eposta"></asp:BoundField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteRow" CommandArgument='<%# Eval("Id") %>' OnClick="btnDelete_Click" />
                           <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="UpdateRow" OnClientClick='<%# "openPopup(" + Eval("Id") + "); return false;" %>' />

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:networkLoginDatabase2ConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
        </div>
    </center>
<div id="myModal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: white; width: 300px; padding: 20px;">
    <h3 style="text-align: center;">Güncelle</h3>
    <asp:TextBox ID="txtAdi" runat="server" placeholder="Adı" style="width: 100%; margin-bottom: 10px;"></asp:TextBox>
    <asp:TextBox ID="txtSoyadi" runat="server" placeholder="Soyadı" style="width: 100%; margin-bottom: 10px;"></asp:TextBox>
    <asp:TextBox ID="txtKullaniciAdi" runat="server" placeholder="Kullanıcı Adı" style="width: 100%; margin-bottom: 10px;"></asp:TextBox>
    <asp:TextBox ID="txtSifre" runat="server" placeholder="Şifre" style="width: 100%; margin-bottom: 10px;"></asp:TextBox>
    <asp:TextBox ID="txtEposta" runat="server" placeholder="E-posta" style="width: 100%; margin-bottom: 10px;"></asp:TextBox>
    <div style="text-align: center;">
        <asp:Button ID="btnClose" runat="server" Text="Kapat" OnClientClick="closePopup()" style="margin-right: 10px;" />
        <asp:Button ID="btnSave" runat="server" Text="Kaydet" OnClick="btnSave_Click" />
    </div>
</div>

<script type="text/javascript">
    function openPopup(id) {
        var modal = document.getElementById("myModal");
        modal.style.display = "block";

        // Pop-up içeriğini doldurmak için gerekli kodu buraya ekleyin
        // Verileri pop-up alanlarına doldurun
    }

    function closePopup() {
        var modal = document.getElementById("myModal");
        modal.style.display = "none";
    }

    function updateData() {
        // Pop-up içeriğindeki verileri almak ve güncelleme işlemini gerçekleştirmek için gerekli kodu buraya ekleyin
        // Örneğin, AJAX isteği yaparak veritabanını güncelleyebilirsiniz

        closePopup();
    }

    // Dışarı tıklandığında pop-up'ın kapatılması
    window.onclick = function (event) {
        var modal = document.getElementById("myModal");
        if (event.target == modal) {
            closePopup();
        }
    }
</script>





</asp:Content>
