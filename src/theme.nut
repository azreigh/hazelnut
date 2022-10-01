const THEME_PATH = HAZELNUT_DIRECTORY_PATH + "themes/";

::Theme <- class {
	constructor(tName, tBgCol, tTextCol, fontPath, cursorPath) {
		themeName = tName
		bgCol = tBgCol
		textCol = tTextCol
		sprFont = newSprite(fontPath, 6, 8, 0, 0, 0, 0)
		font = newFont(sprFont, 0, 0, true, 0)
		sprCursor = newSprite(cursorPath, 10, 13, 0, 0, 0, 0)
	}

	themeName = null
	bgCol = null
	textCol = null
	sprFont = null
	font = null
	sprCursor = null
}
