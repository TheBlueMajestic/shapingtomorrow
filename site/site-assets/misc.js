/* Add a class to the HTML Head for pages */
var pageURL = location.href
var pageURLSplit = pageURL.split("/")
var pageName = pageURLSplit[pageURLSplit.length - 2]

//Home page name
if (pageURLSplit.length == 4) {
    pageName = "p-home"
} else {
    pageName = "p-" + pageName
}

head.feature(pageName, true);