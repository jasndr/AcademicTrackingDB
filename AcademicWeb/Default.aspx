<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AcademicWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Academic Tracking Database</h1>
        <p class="lead"><em>Hosted at Ved-HP</em></p>
        <ul>
            <li><a runat="server" href="~/SeminarTraining.aspx">Sample Tracking Form - Seminar Training</a></li>
            <li><a runat="server" href="~/Teaching.aspx">Sample Tracking Form - Teaching</a></li>
        </ul>
    </div>

   
   

</asp:Content>
