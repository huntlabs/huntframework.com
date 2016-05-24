module application.controllers.base;

import hunt.web.http;
import hunt.web.view;

abstract class BaseController 
{
	TempleContext viewContext;
	this()
    {
        this.viewContext = new TempleContext();
        this.viewContext.static_url = "";
        this.viewContext.base_url = "base_url";
    }
}