﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tafsir
{
    public partial class Booklist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Repeater2.DataSource = new TafsirLib.BookName().Load();
                Repeater2.DataBind();
            }
            catch (Exception)
            {
                //var err = ex.Message;
            }
        }
    }
}