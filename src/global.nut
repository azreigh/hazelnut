const HAZELNUT_DIRECTORY_PATH = "/usr/share/hazelnut/";

::hazelScreenSize <- [screenW(), screenH()];
::hazelTexture <- newTexture(screenW(), screenH());
::hazelWidgetList <- [];
::hazelQuit <- false;

::hazelRootWidget <- 0;

::hazelRegisterWidget <- function(widget) {
    hazelWidgetList.append(widget.weakref());
    return hazelWidgetList.len() - 1;
}

::hazelSetRootWidget <- function(widget) {
    widget.id = hazelRegisterWidget(widget)
    hazelRootWidget = widget.id;
}