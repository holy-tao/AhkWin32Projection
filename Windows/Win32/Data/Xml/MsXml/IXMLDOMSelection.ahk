#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} expression 
     * @returns {HRESULT} 
     */
    get_expr(expression) {
        result := ComCall(12, this, "ptr", expression, "HRESULT")
        return result
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
     * @param {Pointer<IXMLDOMNode>} ppNode 
     * @returns {HRESULT} 
     */
    get_context(ppNode) {
        result := ComCall(14, this, "ptr*", ppNode, "HRESULT")
        return result
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
     * @param {Pointer<IXMLDOMNode>} ppNode 
     * @returns {HRESULT} 
     */
    peekNode(ppNode) {
        result := ComCall(16, this, "ptr*", ppNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @param {Pointer<IXMLDOMNode>} ppNode 
     * @returns {HRESULT} 
     */
    matches(pNode, ppNode) {
        result := ComCall(17, this, "ptr", pNode, "ptr*", ppNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} ppNode 
     * @returns {HRESULT} 
     */
    removeNext(ppNode) {
        result := ComCall(18, this, "ptr*", ppNode, "HRESULT")
        return result
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
     * @param {Pointer<IXMLDOMSelection>} ppNode 
     * @returns {HRESULT} 
     */
    clone(ppNode) {
        result := ComCall(20, this, "ptr*", ppNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} 
     */
    getProperty(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(21, this, "ptr", name, "ptr", value, "HRESULT")
        return result
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
