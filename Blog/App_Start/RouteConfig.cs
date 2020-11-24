using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Blog
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.IgnoreRoute("{*botdetect}",
                new { botdetect = @"(.*)BotDetectCaptcha\.ashx" });

            routes.MapRoute(
                            name: "post Category",
                            url: "post/{metatitle}-{cateId}",
                            defaults: new { controller = "Post", action = "Category", id = UrlParameter.Optional },
                            namespaces: new[] { "Blog.Controllers" }
                        );


            routes.MapRoute(
                            name: "Post Detail",
                            url: "Detail/{metatitle}-{id}",
                            defaults: new { controller = "Post", action = "Detail", id = UrlParameter.Optional },
                            namespaces: new[] { "Blog.Controllers" }
                        );

            routes.MapRoute(
                            name: "Tags",
                            url: "tag/{tagId}",
                            defaults: new { controller = "Content", action = "Tag", id = UrlParameter.Optional },
                            namespaces: new[] { "Blog.Controllers" }
                        );

            routes.MapRoute(
                            name: "Content Detail",
                            url: "Content Detail/{metatitle}-{id}",
                            defaults: new { controller = "Content", action = "Detail", id = UrlParameter.Optional },
                            namespaces: new[] { "Blog.Controllers" }
                        );

            routes.MapRoute(
                            name: "About",
                            url: "about",
                            defaults: new { controller = "About", action = "Index", id = UrlParameter.Optional },
                            namespaces: new[] { "Blog.Controllers" }
                        );

            routes.MapRoute(
                            name: "Contact",
                            url: "contact",
                            defaults: new { controller = "Contact", action = "Index", id = UrlParameter.Optional },
                            namespaces: new[] { "Blog.Controllers" }
                        );

            routes.MapRoute(
                            name: "News",
                            url: "news",
                            defaults: new { controller = "Content", action = "Index", id = UrlParameter.Optional },
                            namespaces: new[] { "Blog.Controllers" }
                        );

            routes.MapRoute(
                           name: "Login",
                           url: "Login",
                           defaults: new { controller = "Users", action = "Login", id = UrlParameter.Optional },
                           namespaces: new[] { "Blog.Controllers" }
                       );

            routes.MapRoute(
                           name: "Search",
                           url: "search",
                           defaults: new { controller = "Post", action = "Search", id = UrlParameter.Optional },
                           namespaces: new[] { "Blog.Controllers" }
                       );

            routes.MapRoute(
                           name: "Register",
                           url: "register",
                           defaults: new { controller = "Users", action = "Register", id = UrlParameter.Optional },
                           namespaces: new[] { "Blog.Controllers" }
                       );


            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Blog.Controllers" }
            );


        }
    }
}
