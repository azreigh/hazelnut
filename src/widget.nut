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
        local draw = {
            x = position.x
            y = position.y
        }
        if (parentId != null && !topLevel) {
            local parentPosition = hazelWidgetList[parentId].position;
            draw.x += parentPosition.x
            draw.y += parentPosition.y
        }
        if (flat) {
            setDrawColor(hazelCurrentTheme.selTextCol);
            drawRec(draw.x, draw.y, size.width, size.height, true);
        }
        
        drawText(hazelCurrentTheme.font, draw.x, draw.y, text);
    }
}