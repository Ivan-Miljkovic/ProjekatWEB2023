<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpravljajKorisnicima.aspx.cs" Inherits="WEBSAJT_IVAN_MILJKOVIC_IV_4.Account.UpravljajKorisnicima" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br /><br />
    <h1>Upravljaj Korisnicima</h1>
    <br /><br />
    <asp:Label ID="ErrLabel" runat="server" Text="" ForeColor="Red"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateSelectButton="true" SelectedRowStyle-BackColor="LightBlue"
         SelectedRowStyle-ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"></asp:GridView>
    <br />
    <br />
    <asp:Label ID="Kontrola" runat="server" Text=""></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="ID:"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Ime i prezime: "></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Adresa: "></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="Telefon: "></asp:Label>
    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" Text="Kreditna kartica: "></asp:Label>
    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Unesi" runat="server" Text="Unesi korisnika" CssClass="btn btn-primary" OnClick="Unesi_Click"/>
&nbsp;&nbsp; <asp:Button ID="Promeni" runat="server" Text="Promeni korisnika" CssClass="btn btn-warning" OnClick="Promeni_Click"/>
</asp:Content>
