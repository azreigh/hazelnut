// Include everything for the app. HazelDebug is for local testing of source changes

// What the hippity hoppity hiff is this nonsensical code
try {
    local hazelDebugEval = hazelDebug; // If HazelDebug doesn't exist, this throws an exception to force HazelDebug to become false
}
catch(exception) {
    ::hazelDebug <- false;
}

if (hazelDebug) {
    donut("src/cursor.nut")
    donut("src/global.nut")
    donut("src/render.nut")
    donut("src/theme.nut")
    donut("src/util.nut")
    donut("src/widget.nut")
} else {
    donut("/usr/share/hazel/src/cursor.nut")
    donut("/usr/share/hazel/src/global.nut")
    donut("/usr/share/hazel/src/render.nut")
    donut("/usr/share/hazel/src/theme.nut")
    donut("/usr/share/hazel/src/util.nut")
    donut("/usr/share/hazel/src/widget.nut")
}