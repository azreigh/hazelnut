::hazelRenderTexture <- function() {
    local screenSizeCheck = [windowW(), windowH()];
    if (hazelScreenSize[0] != screenSizeCheck[0] && hazelScreenSize[1] != screenSizeCheck[1]) {
        setResolution(screenSizeCheck[0], screenSizeCheck[1])
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
    hazelUpdateCursor()
    resetDrawTarget()
    drawImage(hazelTexture, 0, 0)
}