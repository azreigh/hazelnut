const HAZELNUT_DIRECTORY_PATH = "/usr/share/hazelnut/";

::hazelTexture <- newTexture(windowW(), windowH());
::hazelWidgetList <- [];
::hazelQuit <- false;

::hazelRootWidget <- 0;

::hazelSetRootWidget <- function(widget) {
    hazelRootWidget = widget.weakref();
}