const HAZELNUT_DIRECTORY_PATH = "/usr/share/hazelnut/";

::hazelScreenSize <- [screenW(), screenH()];
::hazelTexture <- newTexture(screenW(), screenH());
::hazelWidgetList <- [];
::hazelWidgetPositionList <- [];
::hazelQuit <- false;

::hazelRootWidget <- null;

::hazelRenderCursor <- true;

::hazelRegisterWidget <- function(widget) {
    hazelWidgetList.append(widget.weakref());
    return hazelWidgetList.len() - 1;
}

::hazelSetRootWidget <- function(widget) {
    if (hazelRootWidget != null) throw Error("Attempted to set the root widget twice.")
    widget.id = hazelRegisterWidget(widget)
    hazelRootWidget = widget.id;
    hazelWidgetPositionList.append([widget.positionx, widget.positiony, widget.positionx + widget.width, widget.positiony + widget.height]);
}