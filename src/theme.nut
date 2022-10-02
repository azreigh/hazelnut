const THEME_PATH = "/usr/share/hazelnut/themes/";

::hazelTheme <- class {
	constructor(tName, tBgCol, tTextCol, tSelTextCol, fontPath, cursorPath) {
		themeName = tName
		bgCol = tBgCol
		textCol = tTextCol
		selTextCol = tSelTextCol
		sprFont = newSprite(fontPath, 6, 8, 0, 0, 0, 0)
		font = newFont(sprFont, 0, 0, true, 0)
		sprCursor = newSprite(cursorPath, 10, 13, 0, 0, 0, 0)
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

::hazeldbgSetTheme <- function() {
	local themeFile = mergeTable({}, jsonRead(fileRead("themes/breeze_dark.json")))
	hazelCurrentTheme = hazelTheme(themeFile.themeName, themeFile.bgCol.tointeger(16), themeFile.textCol.tointeger(16), themeFile.selTextCol.tointeger(16), themeFile.fontPath, themeFile.cursorPath)
}