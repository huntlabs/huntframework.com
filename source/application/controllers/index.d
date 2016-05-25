module application.controllers.index;

import hunt.web.http;
import application.controllers.base;
import hunt.web.view;

class IndexController : BaseController,  IController
{
    mixin HuntDynamicCallFun;
    
    void installation(Request req, Response res)
    {
        res.setHeader("content-type","text/html;charset=UTF-8");
        this.viewContext.title = "how to use";
        auto layout  = compile_temple_file!"layouts/main.html";
        auto child  = compile_temple_file!"partials/installation.html";
		auto composed = layout.layout(&child);
    	res.setContext(composed.toString(this.viewContext));
        res.done();
    }

    void routing(Request req, Response res)
    {
        res.setHeader("content-type","text/html;charset=UTF-8");
        this.viewContext.title = "routing";
        auto layout  = compile_temple_file!"layouts/main.html";
        auto child  = compile_temple_file!"partials/routing.html";
        auto composed = layout.layout(&child);
        res.setContext(composed.toString(this.viewContext));
        res.done();   
    }
}