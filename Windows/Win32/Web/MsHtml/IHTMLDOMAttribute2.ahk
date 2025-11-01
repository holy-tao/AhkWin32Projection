#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

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
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_name(p) {
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_value(p) {
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_expando(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_nodeType(p) {
        result := ComCall(11, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} p 
     * @returns {HRESULT} 
     */
    get_parentNode(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_childNodes(p) {
        result := ComCall(13, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} p 
     * @returns {HRESULT} 
     */
    get_firstChild(p) {
        result := ComCall(14, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} p 
     * @returns {HRESULT} 
     */
    get_lastChild(p) {
        result := ComCall(15, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} p 
     * @returns {HRESULT} 
     */
    get_previousSibling(p) {
        result := ComCall(16, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} p 
     * @returns {HRESULT} 
     */
    get_nextSibling(p) {
        result := ComCall(17, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_attributes(p) {
        result := ComCall(18, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_ownerDocument(p) {
        result := ComCall(19, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @param {VARIANT} refChild 
     * @param {Pointer<IHTMLDOMNode>} node 
     * @returns {HRESULT} 
     */
    insertBefore(newChild, refChild, node) {
        result := ComCall(20, this, "ptr", newChild, "ptr", refChild, "ptr*", node, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @param {IHTMLDOMNode} oldChild 
     * @param {Pointer<IHTMLDOMNode>} node 
     * @returns {HRESULT} 
     */
    replaceChild(newChild, oldChild, node) {
        result := ComCall(21, this, "ptr", newChild, "ptr", oldChild, "ptr*", node, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDOMNode} oldChild 
     * @param {Pointer<IHTMLDOMNode>} node 
     * @returns {HRESULT} 
     */
    removeChild(oldChild, node) {
        result := ComCall(22, this, "ptr", oldChild, "ptr*", node, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @param {Pointer<IHTMLDOMNode>} node 
     * @returns {HRESULT} 
     */
    appendChild(newChild, node) {
        result := ComCall(23, this, "ptr", newChild, "ptr*", node, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} fChildren 
     * @returns {HRESULT} 
     */
    hasChildNodes(fChildren) {
        result := ComCall(24, this, "ptr", fChildren, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fDeep 
     * @param {Pointer<IHTMLDOMAttribute>} clonedNode 
     * @returns {HRESULT} 
     */
    cloneNode(fDeep, clonedNode) {
        result := ComCall(25, this, "short", fDeep, "ptr*", clonedNode, "HRESULT")
        return result
    }
}
