// Include everything for the app

local ogdir = getdir()
chdir("/usr/share/hazel")
donut("src/cursor.nut")
donut("src/global.nut")
donut("src/render.nut")
donut("src/theme.nut")
donut("src/util.nut")
donut("src/widget.nut")
chdir(ogdir)