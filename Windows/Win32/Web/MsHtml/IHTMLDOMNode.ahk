#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLDOMNode.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDOMNode extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDOMNode
     * @type {Guid}
     */
    static IID => Guid("{3050f5da-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_nodeType", "get_parentNode", "hasChildNodes", "get_childNodes", "get_attributes", "insertBefore", "removeChild", "replaceChild", "cloneNode", "removeNode", "swapNode", "replaceNode", "appendChild", "get_nodeName", "put_nodeValue", "get_nodeValue", "get_firstChild", "get_lastChild", "get_previousSibling", "get_nextSibling"]

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
     * @type {IDispatch} 
     */
    attributes {
        get => this.get_attributes()
    }

    /**
     * @type {BSTR} 
     */
    nodeName {
        get => this.get_nodeName()
    }

    /**
     * @type {VARIANT} 
     */
    nodeValue {
        get => this.get_nodeValue()
        set => this.put_nodeValue(value)
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
     * 
     * @returns {Integer} 
     */
    get_nodeType() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_parentNode() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    hasChildNodes() {
        result := ComCall(9, this, "short*", &fChildren := 0, "HRESULT")
        return fChildren
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_childNodes() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_attributes() {
        result := ComCall(11, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @param {VARIANT} refChild 
     * @returns {IHTMLDOMNode} 
     */
    insertBefore(newChild, refChild) {
        result := ComCall(12, this, "ptr", newChild, "ptr", refChild, "ptr*", &node := 0, "HRESULT")
        return IHTMLDOMNode(node)
    }

    /**
     * 
     * @param {IHTMLDOMNode} oldChild 
     * @returns {IHTMLDOMNode} 
     */
    removeChild(oldChild) {
        result := ComCall(13, this, "ptr", oldChild, "ptr*", &node := 0, "HRESULT")
        return IHTMLDOMNode(node)
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @param {IHTMLDOMNode} oldChild 
     * @returns {IHTMLDOMNode} 
     */
    replaceChild(newChild, oldChild) {
        result := ComCall(14, this, "ptr", newChild, "ptr", oldChild, "ptr*", &node := 0, "HRESULT")
        return IHTMLDOMNode(node)
    }

    /**
     * 
     * @param {VARIANT_BOOL} fDeep 
     * @returns {IHTMLDOMNode} 
     */
    cloneNode(fDeep) {
        result := ComCall(15, this, "short", fDeep, "ptr*", &clonedNode := 0, "HRESULT")
        return IHTMLDOMNode(clonedNode)
    }

    /**
     * 
     * @param {VARIANT_BOOL} fDeep 
     * @returns {IHTMLDOMNode} 
     */
    removeNode(fDeep) {
        result := ComCall(16, this, "short", fDeep, "ptr*", &removed := 0, "HRESULT")
        return IHTMLDOMNode(removed)
    }

    /**
     * 
     * @param {IHTMLDOMNode} otherNode 
     * @returns {IHTMLDOMNode} 
     */
    swapNode(otherNode) {
        result := ComCall(17, this, "ptr", otherNode, "ptr*", &swappedNode := 0, "HRESULT")
        return IHTMLDOMNode(swappedNode)
    }

    /**
     * 
     * @param {IHTMLDOMNode} replacement 
     * @returns {IHTMLDOMNode} 
     */
    replaceNode(replacement) {
        result := ComCall(18, this, "ptr", replacement, "ptr*", &replaced := 0, "HRESULT")
        return IHTMLDOMNode(replaced)
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @returns {IHTMLDOMNode} 
     */
    appendChild(newChild) {
        result := ComCall(19, this, "ptr", newChild, "ptr*", &node := 0, "HRESULT")
        return IHTMLDOMNode(node)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_nodeName() {
        p := BSTR()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_nodeValue(v) {
        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_nodeValue() {
        p := VARIANT()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_firstChild() {
        result := ComCall(23, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_lastChild() {
        result := ComCall(24, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_previousSibling() {
        result := ComCall(25, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_nextSibling() {
        result := ComCall(26, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }
}
