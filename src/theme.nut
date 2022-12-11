if (hazelDebug) const THEME_PATH = "/usr/share/hazelnut/themes"; // DEBUG
else const THEME_PATH = "./themes"; // DEBUG

::hazelTheme <- class {
	constructor(tName, tBgCol, tTextCol, tSelTextCol, fontPath, cursorPath) {
		themeName = tName
		bgCol = tBgCol
		textCol = tTextCol
		selTextCol = tSelTextCol

		if (fontPath.find("%s") != null) fontPath = format(fontPath, THEME_PATH);
		if (cursorPath.find("%s") != null) cursorPath = format(cursorPath, THEME_PATH);

		if (fileExists(fontPath)) {
			sprFont = newSprite(fontPath, 6, 8, 0, 0, 0, 0);
			font = newFont(sprFont, 0, 0, true, 0);
		}
		if (fileExists(cursorPath)) {
			sprCursor = newSprite(cursorPath, 10, 13, 0, 0, 0, 0);
		}
	}

	themeName = null
	bgCol = null
	textCol = null
	selTextCol = null
	sprFont = null
	font = null
	sprCursor = null
}

::hazelCurrentTheme <- 0

::hazelSetTheme <- function() {
	print("hi")
	local themeFile = mergeTable({}, jsonRead(fileRead(THEME_PATH + "/breeze_dark.json")))
	hazelCurrentTheme = hazelTheme(themeFile.themeName, themeFile.bgCol.tointeger(16), themeFile.textCol.tointeger(16), themeFile.selTextCol.tointeger(16), themeFile.fontPath, themeFile.cursorPath)
}