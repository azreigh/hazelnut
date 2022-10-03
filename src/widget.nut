::hazelBaseWidget <- class {
    name = "";
    id = null;
    parentId = null;
    
    position = {
        x = 0
        y = 0
    }
    
    size = {
        width = 0
        height = 0
        minWidth = 0
        minHeight = 0
    }
    
    children = [];
    
    topLevel = false;
    
    parent = null;
    
    constructor(_name, _x, _y, _width, _height, _minWidth, _minHeight) {
        name = _name;
        position.x = _x
        position.y = _y
        size.width = _width
        size.height = _height
        size.minWidth = _minWidth
        size.minHeight = _minHeight
    }
    
    function draw() {}
    
    function addChild(widget) {
        widget.id = hazelRegisterWidget(widget);
        widget.parentId = id;
        children.append(widget.id);
        local parentPosition = hazelWidgetList[widget.parentId].position;
        widget.position.x += parentPosition.x
        widget.position.y += parentPosition.y
    }
}

::hazelLabelWidget <- class extends hazelBaseWidget {
    text = "";
    flat = false;
    constructor(_name, _x, _y, _width, _height, _minWidth, _minHeight, _text = "", _flat = false) {
        base.constructor(_name, _x, _y, _width, _height, _minWidth, _minHeight);
        text = _text;
        flat = _flat;
    }
    
    function draw() {
        base.draw();
        if (flat) {
            setDrawColor(hazelCurrentTheme.selTextCol);
            drawRec(position.x, position.y, size.width, size.height, true);
        }
        
        drawText(hazelCurrentTheme.font, position.x, position.y, text);
    }
}