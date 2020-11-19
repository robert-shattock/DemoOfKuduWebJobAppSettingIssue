<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DemoOfKuduWebJobAppSettingIssue.Web._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead"><%=$"settingOrigin = {System.Configuration.ConfigurationManager.AppSettings["settingOrigin"]}" %></p>
    </div>
   
  </asp:Content>
