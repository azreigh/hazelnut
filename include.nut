// Include everything for the app. HazelDebug is for local testing of source changes

// What the hippity hoppity hiff is this nonsensical code
try {
    local hazelDebugEval = hazelDebug; // If hazelDebug doesn't exist, this throws an exception to force hazelDebug to become false
}
catch(exception) {
    ::hazelDebug <- false;
}

local srcDir = "./src"
if (!hazelDebug) {
    srcDir = "/usr/share/hazel/src"
}

donut(srcDir + "/cursor.nut")
donut(srcDir + "/global.nut")
donut(srcDir + "/render.nut")
donut(srcDir + "/scene.nut")
donut(srcDir + "/theme.nut")
donut(srcDir + "/util.nut")
donut(srcDir + "/widget.nut")  