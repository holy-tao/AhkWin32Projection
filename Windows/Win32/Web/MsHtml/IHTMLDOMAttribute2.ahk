#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLDOMNode.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\IHTMLDOMAttribute.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDOMAttribute2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDOMAttribute2
     * @type {Guid}
     */
    static IID => Guid("{3050f810-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_name", "put_value", "get_value", "get_expando", "get_nodeType", "get_parentNode", "get_childNodes", "get_firstChild", "get_lastChild", "get_previousSibling", "get_nextSibling", "get_attributes", "get_ownerDocument", "insertBefore", "replaceChild", "removeChild", "appendChild", "hasChildNodes", "cloneNode"]

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
    }

    /**
     * @type {BSTR} 
     */
    value {
        get => this.get_value()
        set => this.put_value(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    expando {
        get => this.get_expando()
    }

    /**
     * @type {Integer} 
     */
    nodeType {
        get => this.get_nodeType()
    }

    /**
     * @type {IHTMLDOMNode} 
     */
    parentNode {
        get => this.get_parentNode()
    }

    /**
     * @type {IDispatch} 
     */
    childNodes {
        get => this.get_childNodes()
    }

    /**
     * @type {IHTMLDOMNode} 
     */
    firstChild {
        get => this.get_firstChild()
    }

    /**
     * @type {IHTMLDOMNode} 
     */
    lastChild {
        get => this.get_lastChild()
    }

    /**
     * @type {IHTMLDOMNode} 
     */
    previousSibling {
        get => this.get_previousSibling()
    }

    /**
     * @type {IHTMLDOMNode} 
     */
    nextSibling {
        get => this.get_nextSibling()
    }

    /**
     * @type {IDispatch} 
     */
    attributes {
        get => this.get_attributes()
    }

    /**
     * @type {IDispatch} 
     */
    ownerDocument {
        get => this.get_ownerDocument()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_value(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(8, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_value() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_expando() {
        result := ComCall(10, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_nodeType() {
        result := ComCall(11, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_parentNode() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_childNodes() {
        result := ComCall(13, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_firstChild() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_lastChild() {
        result := ComCall(15, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_previousSibling() {
        result := ComCall(16, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_nextSibling() {
        result := ComCall(17, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_attributes() {
        result := ComCall(18, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_ownerDocument() {
        result := ComCall(19, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @param {VARIANT} refChild 
     * @returns {IHTMLDOMNode} 
     */
    insertBefore(newChild, refChild) {
        result := ComCall(20, this, "ptr", newChild, "ptr", refChild, "ptr*", &node := 0, "HRESULT")
        return IHTMLDOMNode(node)
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @param {IHTMLDOMNode} oldChild 
     * @returns {IHTMLDOMNode} 
     */
    replaceChild(newChild, oldChild) {
        result := ComCall(21, this, "ptr", newChild, "ptr", oldChild, "ptr*", &node := 0, "HRESULT")
        return IHTMLDOMNode(node)
    }

    /**
     * 
     * @param {IHTMLDOMNode} oldChild 
     * @returns {IHTMLDOMNode} 
     */
    removeChild(oldChild) {
        result := ComCall(22, this, "ptr", oldChild, "ptr*", &node := 0, "HRESULT")
        return IHTMLDOMNode(node)
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @returns {IHTMLDOMNode} 
     */
    appendChild(newChild) {
        result := ComCall(23, this, "ptr", newChild, "ptr*", &node := 0, "HRESULT")
        return IHTMLDOMNode(node)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    hasChildNodes() {
        result := ComCall(24, this, "short*", &fChildren := 0, "HRESULT")
        return fChildren
    }

    /**
     * 
     * @param {VARIANT_BOOL} fDeep 
     * @returns {IHTMLDOMAttribute} 
     */
    cloneNode(fDeep) {
        result := ComCall(25, this, "short", fDeep, "ptr*", &clonedNode := 0, "HRESULT")
        return IHTMLDOMAttribute(clonedNode)
    }
}
