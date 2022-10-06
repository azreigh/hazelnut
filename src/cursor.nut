::lastMouseX <- mouseX();
::lastMouseY <- mouseY();

::hazelUpdateCursor <- function() {
	if(!hazelRenderCursor) return; //If the cursor is disabled.

	drawSprite(hazelCurrentTheme.sprCursor, 0, mouseX(), mouseY()) //Draw the cursor.
	
	if (mousePress(0)) {
		foreach (index, value in hazelWidgetPositionList) {
			if (value[0] <= mouseX() && value[1] <= mouseY() && value[3] >= mouseY() && value[2] >= mouseX()) {
				hazelSelectedWidget = index;
				if (hazelWidgetList[index].rawin("func")) {
					hazelWidgetList[index].func();
				}
			}
		}
	}
	
	if(mouseX() == lastMouseX && mouseY() == lastMouseY) return; //If the cursor hasn't moved.

	lastMouseX = mouseX()
	lastMouseY = mouseY()
}

::processCursorInput <- function() {
	if(!hazelRenderCursor) return; //If the cursor is disabled.
}
