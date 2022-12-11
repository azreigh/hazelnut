::loadScene <- function(scenePath) {
    print(scenePath)
    hazelWidgetList.clear();
    hazelWidgetPositionList.clear();
    hazelSelectedWidget = -1;
    
    if (fileExists(scenePath)) {
        local sceneConf = jsonRead(fileRead(scenePath));
        
        foreach (widget in sceneConf.widgets) {
            print("WIDGET: " + widget.args[0]);
            local instanceArgs = ""
            local instanceClass = widget.widgettype
            print(widget.args.len())
            for (local i = 0; i<widget.args.len(); i++) {
                switch (widget.argtypes[i]) {
                    case "int":
                    case "bool":
                        instanceArgs += widget.args[i]
                        break
                    case "string":
                        instanceArgs += format("\"%s\"", widget.args[i]);
                        break
                }
                
                if (i != widget.args.len()-1) instanceArgs += ","
            }
            
            print(instanceArgs)
            
            for (local i = 0; i<widget.children.len(); i++) {
                widget.children[i] = widget.children[i].tointeger();
            }
            
            // PLS LET ME WIN AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
            dostr(format("hazelWidgetList.append(%s(%s));", widget.widgettype, instanceArgs))
        }
        hazelRootWidget = hazelWidgetList[sceneConf.root.tointeger()]
    }
}