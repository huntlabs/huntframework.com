import std.stdio;
import std.functional;
import hunt.web.application;
import collie.socket;
import hunt.web.view;

enum RESOURCES_FILE_PATH ="./";

void resources(Request req, Response res)
{
	import std.path;
	auto file_path = absolutePath(RESOURCES_FILE_PATH) ~ req.Header.path();
	auto ext = extension(file_path);///.css
	trace("file_path:", file_path);
    //res.setHeader("Content-Type","text/html;charset=UTF-8");
    import hunt.utils.string;
    res.setHeader("Content-Type",mimeContentType( ext));
    res.done(file_path);
}


void main()
{
	globalLogLevel(LogLevel.trace);
	WebApplication app = new WebApplication();
	app.setRouterConfig(new ConfigSignalModule("config/router.conf"));
	app.addRouter("GET", "/resources/statics/{path:.*}", toDelegate(&resources));
	app.bind(8080);
	app.run();
	
}

