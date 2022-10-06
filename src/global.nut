const HAZELNUT_DIRECTORY_PATH = "/usr/share/hazelnut/";

::hazelScreenSize <- [windowW(), windowH()];
::hazelTexture <- newTexture(windowW(), windowH());
::hazelWidgetList <- [];
::hazelWidgetPositionList <- [];
::hazelSelectedWidget <- -1;
::hazelQuit <- false;
::hazelHandleInputs <- true;

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

::hazelInputHandler <- function() {
    local inputs = [];
    if (hazelSelectedWidget != -1 && hazelHandleInputs) {
        inputs.append(anyKeyPress());
        hazelWidgetList[hazelSelectedWidget].input(inputs)
    }
}