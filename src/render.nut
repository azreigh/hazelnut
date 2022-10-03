::hazelRenderTexture <- function() {
    local screenSizeCheck = [screenW(), screenH()];
    if (hazelScreenSize[0] != screenSizeCheck[0]) {
        hazelTexture = newTexture(screenSizeCheck[0], screenSizeCheck[1])
        hazelScreenSize = screenSizeCheck
    }
    setDrawTarget(hazelTexture)
    setDrawColor(hazelCurrentTheme.bgCol)
    clearScreen()
    foreach (widget in hazelWidgetList) {
        widget.draw()
        setDrawColor(hazelCurrentTheme.bgCol)
    }
    resetDrawTarget()
    drawImage(hazelTexture, 0, 0)
}