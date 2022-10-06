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
    constructor(_name, _x, _y, _width, _height, _minWidth, _minHeight, _text = "", _flat = false) {
        base.constructor(_name, _x, _y, _width, _height, _minWidth, _minHeight);
        text = _text;
        flat = _flat;
        local tmptxt = split(text, "\n")
        local highestLen = 0
        foreach (line in tmptxt) {
            if (line.len() > highestLen) {
                highestLen = line.len()
            }
        }
        width = highestLen * 6
        height = tmptxt.len() * 8
    }
    
    function draw() {
        base.draw();
        if (!flat) {
            setDrawColor(hazelCurrentTheme.selTextCol);
            drawRec(positionx, positiony, width, height, true);
        }
        
        drawText(hazelCurrentTheme.font, positionx, positiony, text);
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
    constructor(_name, _x, _y, _width, _height, _minWidth, _minHeight, _text = "", _flat = false) {
        base.constructor(_name, _x, _y, _width, _height, _minWidth, _minHeight, _text, _flat);
    }
    
    function input(inputs) {
        foreach (input in inputs) {
            local tmp = keyString(input)
            if (tmp != "") {
                text += tmp
            }
        }
    }
}