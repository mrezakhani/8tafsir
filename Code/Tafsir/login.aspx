﻿<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Tafsir.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div style="width:95%;margin-right:2.5%;margin-left:2.5%;overflow: hidden;">
        <h2 class="speratorLine"><p>ورود به سیستم</p></h2>
        <div class=""  style="box-shadow:0px 1px 4px rgba(0,0,0,0.95); border-radius:3px;margin-left:10px;margin-right:10px;margin-bottom:10px">
					
            <table style="width: 95%;" dir="rtl">
                <tbody>
                <tr>
                    <!--<td ><img class="boxOfContentImages" src="images/overView.jpg"></td>-->
                </tr>
                <tr>
                    <td>
                        <div class="register_form">
                            <h3>ورود به سیستم</h3>
                            <p>لطفاً نام کاربری و رمز خود را وارد کنید</p>
                            <form class="form_area" id="myForm" action="ََauthentication.html" method="post">
                                <div class="row">
                                    <div>
                                        <input name="name" placeholder="Your Name" required="" type="text" style="text-align:left"><br>
                                        <input name="name" placeholder="Your Password" required="" type="Password" style="text-align:left"><br>
                                    </div>
                                    <div class="col-lg-12 text-center">
                                        <button class="primary-btn">ورود</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="color: #2E2E2E; font-size: small;" >
								  
                        <a href="ForgatPassword.aspx" >
                            یا کلمه عبور خود را فراموش کرده اید؟</a>
                    </td>
                </tr>
                </tbody>
            </table>
						 
        </div>
	
    </div>

</asp:Content>
