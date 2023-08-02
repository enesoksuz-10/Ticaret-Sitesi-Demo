<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Network.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .baslik {
            text-align: center;
        }
        .urnekle{
            margin-left:10%;
            margin-top:70px;
        }

        
    </style><h3 class="baslik">Ürün Ekleme Sayfası(Tasarım Yapılacak)</h3>
    <div class="urnekle" >
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="txtCategory">Category:</label>
                        <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtTitle">Title:</label>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtBrand">Brand:</label>
                        <asp:TextBox ID="txtBrand" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtImageUrl">ImageUrl:</label>
                        <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                     <div class="form-group">
                        <label for="txtPrice">Price:</label>
                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnAddCard" runat="server" Text="Add Card" CssClass="btn btn-primary" OnClick="btnAddCard_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
