#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDOMNode3 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDOMNode3
     * @type {Guid}
     */
    static IID => Guid("{305106e0-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_prefix", "get_prefix", "get_localName", "get_namespaceURI", "put_textContent", "get_textContent", "isEqualNode", "lookupNamespaceURI", "lookupPrefix", "isDefaultNamespace", "appendChild", "insertBefore", "removeChild", "replaceChild", "isSameNode", "compareDocumentPosition", "isSupported"]

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_prefix(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_prefix(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_localName(p) {
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_namespaceURI(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textContent(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_textContent(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDOMNode3} otherNode 
     * @param {Pointer<VARIANT_BOOL>} isEqual 
     * @returns {HRESULT} 
     */
    isEqualNode(otherNode, isEqual) {
        result := ComCall(13, this, "ptr", otherNode, "ptr", isEqual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarPrefix 
     * @param {Pointer<VARIANT>} pvarNamespaceURI 
     * @returns {HRESULT} 
     */
    lookupNamespaceURI(pvarPrefix, pvarNamespaceURI) {
        result := ComCall(14, this, "ptr", pvarPrefix, "ptr", pvarNamespaceURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNamespaceURI 
     * @param {Pointer<VARIANT>} pvarPrefix 
     * @returns {HRESULT} 
     */
    lookupPrefix(pvarNamespaceURI, pvarPrefix) {
        result := ComCall(15, this, "ptr", pvarNamespaceURI, "ptr", pvarPrefix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNamespace 
     * @param {Pointer<VARIANT_BOOL>} pfDefaultNamespace 
     * @returns {HRESULT} 
     */
    isDefaultNamespace(pvarNamespace, pfDefaultNamespace) {
        result := ComCall(16, this, "ptr", pvarNamespace, "ptr", pfDefaultNamespace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @param {Pointer<IHTMLDOMNode>} node 
     * @returns {HRESULT} 
     */
    appendChild(newChild, node) {
        result := ComCall(17, this, "ptr", newChild, "ptr*", node, "HRESULT")
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
        result := ComCall(18, this, "ptr", newChild, "ptr", refChild, "ptr*", node, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDOMNode} oldChild 
     * @param {Pointer<IHTMLDOMNode>} node 
     * @returns {HRESULT} 
     */
    removeChild(oldChild, node) {
        result := ComCall(19, this, "ptr", oldChild, "ptr*", node, "HRESULT")
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
        result := ComCall(20, this, "ptr", newChild, "ptr", oldChild, "ptr*", node, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDOMNode3} otherNode 
     * @param {Pointer<VARIANT_BOOL>} isSame 
     * @returns {HRESULT} 
     */
    isSameNode(otherNode, isSame) {
        result := ComCall(21, this, "ptr", otherNode, "ptr", isSame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDOMNode} otherNode 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     */
    compareDocumentPosition(otherNode, flags) {
        flagsMarshal := flags is VarRef ? "ushort*" : "ptr"

        result := ComCall(22, this, "ptr", otherNode, flagsMarshal, flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} feature 
     * @param {VARIANT} version 
     * @param {Pointer<VARIANT_BOOL>} pfisSupported 
     * @returns {HRESULT} 
     */
    isSupported(feature, version, pfisSupported) {
        feature := feature is String ? BSTR.Alloc(feature).Value : feature

        result := ComCall(23, this, "ptr", feature, "ptr", version, "ptr", pfisSupported, "HRESULT")
        return result
    }
}
