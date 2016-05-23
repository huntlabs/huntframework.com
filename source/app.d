import std.stdio;
import std.functional;
import hunt.web.application;
import collie.socket;

void hello(Request, Response res)
{
    res.setContext("hello world");
    res.setHeader("content-type","text/html;charset=UTF-8");
    res.done();
}

void main()
{
	globalLogLevel(LogLevel.error);
	WebApplication app = new WebApplication();
	app.addRouter("GET", "/hello", toDelegate(&hello));
	app.bind(8080);
	app.run();
	
}
