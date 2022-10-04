::lastMouseX <- mouseX();
::lastMouseY <- mouseY();

::hazelUpdateCursor <- function() {
	if(!hazelRenderCursor) return; //If the cursor is disabled.

	drawSprite(hazelCurrentTheme.sprCursor, 0, mouseX(), mouseY()) //Draw the cursor.

	if(mouseX() == lastMouseX && mouseY() == lastMouseY) return; //If the cursor hasn't moved.

	lastMouseX = mouseX()
	lastMouseY = mouseY()
}

::processCursorInput <- function() {
	if(!hazelRenderCursor) return; //If the cursor is disabled.
}
