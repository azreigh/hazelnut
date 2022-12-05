::hazelBaseWidget <- class {
    name = "";
    id = null;
    parentId = null;
    
    positionx = null
    positiony = null
    width = null
    height = null
    minWidth = null
    minHeight = null
    
    children = [];
    
    topLevel = false;
    
    parent = null;
    
    constructor(_name, _x, _y, _width, _height, _minWidth, _minHeight) {
        name = _name;
        positionx = _x
        positiony = _y
        width = _width
        height = _height
        minWidth = _minWidth
        minHeight = _minHeight
    }
    
    function draw() {}
    
    function addChild(widget) {
        widget.id = hazelRegisterWidget(widget);
        widget.parentId = id;
        children.append(widget.id);
        widget.positionx += positionx
        widget.positiony += positiony
        hazelWidgetPositionList.append([widget.positionx, widget.positiony, widget.positionx + widget.width, widget.positiony + widget.height]);
    }
    
    function input(inputs) {}
}

::hazelLabelWidget <- class extends hazelBaseWidget {
    text = "";
    flat = false;
    constantSize = false;
    
    textLineCount = 0;
    textLineLengths = null;
    
    internalCursorPosition = null; // X - 0, Y - 1
    
    constructor(_name, _x, _y, _width, _height, _minWidth, _minHeight, _text = "", _flat = false, _constSize = false) {
        base.constructor(_name, _x, _y, _width, _height, _minWidth, _minHeight);
        text = _text;
        flat = _flat;
        constantSize = _constSize;
        internalCursorPosition = [-1, -1];
        textLineLengths = [];
        resizeToText();
    }
    
    function draw() {
        base.draw();
        if (!flat) {
            setDrawColor(hazelCurrentTheme.selTextCol);
            drawRec(positionx, positiony, width, height, true);
        }
        
        if (hazelCurrentTheme.font != null) drawText(hazelCurrentTheme.font, positionx, positiony, text);
    }
    
    function resizeToText() {
        if (constantSize) return;
        local tmptxt = split(text, "\n")
        textLineLengths.clear()
        textLineCount = tmptxt.len()
        local highestLen = 0
        foreach (line in tmptxt) {
            textLineLengths.append(line.len())
            if (line.len() > highestLen) {
                highestLen = line.len()
            }
        }
        width = highestLen * 6
        height = tmptxt.len() * 8
    }
}
    
::hazelButtonWidget <- class extends hazelLabelWidget {
    func = null;
        
    constructor(_name, _x, _y, _width, _height, _minWidth, _minHeight, _func, _text = "", _flat = false) {
        base.constructor(_name, _x, _y, _width, _height, _minWidth, _minHeight, _text, _flat);
        func = _func
    }
}

::hazelTextboxWidget <- class extends hazelLabelWidget {
    constructor(_name, _x, _y, _width, _height, _minWidth, _minHeight, _text = "", _flat = false, _constSize = false) {
        base.constructor(_name, _x, _y, _width, _height, _minWidth, _minHeight, _text, _flat, _constSize);
    }
    
    function input(inputs) {
        foreach (input in inputs) {
            switch (input) {
                case k_backspace:
                    if (text.len() > 0) text = text.slice(0, text.len()-1); // TEMP
                    break;
                case k_tab:
                    text += "\t";
                    break;
                case k_enter:
                    text += "\n";
                    break;
                default:
                    local tmp = keyString(input)
                    if (tmp != "") {
                        text += tmp
                    }
                    break;
            }
        }
        resizeToText();
    }
}

::hazelProgressBarWidget <- class extends hazelLabelWidget {
    constructor(_name, _x, _y, _width, _height, _minWidth, _minHeight, _text = "", _flat = false, _constSize = false) {
        base.constructor(_name, _x, _y, _width, _height, _minWidth, _minHeight, _text, _flat, _constSize);
    }
}