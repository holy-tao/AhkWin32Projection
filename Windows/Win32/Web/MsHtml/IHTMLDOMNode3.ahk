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
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_prefix(v) {
        result := ComCall(7, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_prefix(p) {
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_localName(p) {
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_namespaceURI(p) {
        result := ComCall(10, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textContent(v) {
        result := ComCall(11, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_textContent(p) {
        result := ComCall(12, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode3>} otherNode 
     * @param {Pointer<VARIANT_BOOL>} isEqual 
     * @returns {HRESULT} 
     */
    isEqualNode(otherNode, isEqual) {
        result := ComCall(13, this, "ptr", otherNode, "ptr", isEqual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarPrefix 
     * @param {Pointer<VARIANT>} pvarNamespaceURI 
     * @returns {HRESULT} 
     */
    lookupNamespaceURI(pvarPrefix, pvarNamespaceURI) {
        result := ComCall(14, this, "ptr", pvarPrefix, "ptr", pvarNamespaceURI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNamespaceURI 
     * @param {Pointer<VARIANT>} pvarPrefix 
     * @returns {HRESULT} 
     */
    lookupPrefix(pvarNamespaceURI, pvarPrefix) {
        result := ComCall(15, this, "ptr", pvarNamespaceURI, "ptr", pvarPrefix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNamespace 
     * @param {Pointer<VARIANT_BOOL>} pfDefaultNamespace 
     * @returns {HRESULT} 
     */
    isDefaultNamespace(pvarNamespace, pfDefaultNamespace) {
        result := ComCall(16, this, "ptr", pvarNamespace, "ptr", pfDefaultNamespace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} newChild 
     * @param {Pointer<IHTMLDOMNode>} node 
     * @returns {HRESULT} 
     */
    appendChild(newChild, node) {
        result := ComCall(17, this, "ptr", newChild, "ptr", node, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} newChild 
     * @param {VARIANT} refChild 
     * @param {Pointer<IHTMLDOMNode>} node 
     * @returns {HRESULT} 
     */
    insertBefore(newChild, refChild, node) {
        result := ComCall(18, this, "ptr", newChild, "ptr", refChild, "ptr", node, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} oldChild 
     * @param {Pointer<IHTMLDOMNode>} node 
     * @returns {HRESULT} 
     */
    removeChild(oldChild, node) {
        result := ComCall(19, this, "ptr", oldChild, "ptr", node, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} newChild 
     * @param {Pointer<IHTMLDOMNode>} oldChild 
     * @param {Pointer<IHTMLDOMNode>} node 
     * @returns {HRESULT} 
     */
    replaceChild(newChild, oldChild, node) {
        result := ComCall(20, this, "ptr", newChild, "ptr", oldChild, "ptr", node, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode3>} otherNode 
     * @param {Pointer<VARIANT_BOOL>} isSame 
     * @returns {HRESULT} 
     */
    isSameNode(otherNode, isSame) {
        result := ComCall(21, this, "ptr", otherNode, "ptr", isSame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} otherNode 
     * @param {Pointer<UInt16>} flags 
     * @returns {HRESULT} 
     */
    compareDocumentPosition(otherNode, flags) {
        result := ComCall(22, this, "ptr", otherNode, "ushort*", flags, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(23, this, "ptr", feature, "ptr", version, "ptr", pfisSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
