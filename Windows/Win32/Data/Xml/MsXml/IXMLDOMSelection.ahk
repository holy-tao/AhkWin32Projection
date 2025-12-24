#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLDOMNode.ahk
#Include .\IXMLDOMSelection.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\IXMLDOMNodeList.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMSelection extends IXMLDOMNodeList{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMSelection
     * @type {Guid}
     */
    static IID => Guid("{aa634fc7-5888-44a7-a257-3a47150d3a0e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_expr", "put_expr", "get_context", "putref_context", "peekNode", "matches", "removeNext", "removeAll", "clone", "getProperty", "setProperty"]

    /**
     * @type {BSTR} 
     */
    expr {
        get => this.get_expr()
        set => this.put_expr(value)
    }

    /**
     * @type {IXMLDOMNode} 
     */
    context {
        get => this.get_context()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_expr() {
        expression := BSTR()
        result := ComCall(12, this, "ptr", expression, "HRESULT")
        return expression
    }

    /**
     * 
     * @param {BSTR} expression 
     * @returns {HRESULT} 
     */
    put_expr(expression) {
        expression := expression is String ? BSTR.Alloc(expression).Value : expression

        result := ComCall(13, this, "ptr", expression, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    get_context() {
        result := ComCall(14, this, "ptr*", &ppNode := 0, "HRESULT")
        return IXMLDOMNode(ppNode)
    }

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @returns {HRESULT} 
     */
    putref_context(pNode) {
        result := ComCall(15, this, "ptr", pNode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    peekNode() {
        result := ComCall(16, this, "ptr*", &ppNode := 0, "HRESULT")
        return IXMLDOMNode(ppNode)
    }

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @returns {IXMLDOMNode} 
     */
    matches(pNode) {
        result := ComCall(17, this, "ptr", pNode, "ptr*", &ppNode := 0, "HRESULT")
        return IXMLDOMNode(ppNode)
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    removeNext() {
        result := ComCall(18, this, "ptr*", &ppNode := 0, "HRESULT")
        return IXMLDOMNode(ppNode)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    removeAll() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXMLDOMSelection} 
     */
    clone() {
        result := ComCall(20, this, "ptr*", &ppNode := 0, "HRESULT")
        return IXMLDOMSelection(ppNode)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {VARIANT} 
     */
    getProperty(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        value := VARIANT()
        result := ComCall(21, this, "ptr", name, "ptr", value, "HRESULT")
        return value
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     */
    setProperty(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(22, this, "ptr", name, "ptr", value, "HRESULT")
        return result
    }
}
