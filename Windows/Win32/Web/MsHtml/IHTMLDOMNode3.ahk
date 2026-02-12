#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLDOMNode.ahk
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
     * @type {VARIANT} 
     */
    prefix {
        get => this.get_prefix()
        set => this.put_prefix(value)
    }

    /**
     * @type {VARIANT} 
     */
    localName {
        get => this.get_localName()
    }

    /**
     * @type {VARIANT} 
     */
    namespaceURI {
        get => this.get_namespaceURI()
    }

    /**
     * @type {VARIANT} 
     */
    textContent {
        get => this.get_textContent()
        set => this.put_textContent(value)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_prefix(v) {
        result := ComCall(7, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_prefix() {
        p := VARIANT()
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_localName() {
        p := VARIANT()
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_namespaceURI() {
        p := VARIANT()
        result := ComCall(10, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textContent(v) {
        result := ComCall(11, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textContent() {
        p := VARIANT()
        result := ComCall(12, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {IHTMLDOMNode3} otherNode 
     * @returns {VARIANT_BOOL} 
     */
    isEqualNode(otherNode) {
        result := ComCall(13, this, "ptr", otherNode, "short*", &isEqual := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isEqual
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarPrefix 
     * @returns {VARIANT} 
     */
    lookupNamespaceURI(pvarPrefix) {
        pvarNamespaceURI := VARIANT()
        result := ComCall(14, this, "ptr", pvarPrefix, "ptr", pvarNamespaceURI, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarNamespaceURI
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNamespaceURI 
     * @returns {VARIANT} 
     */
    lookupPrefix(pvarNamespaceURI) {
        pvarPrefix := VARIANT()
        result := ComCall(15, this, "ptr", pvarNamespaceURI, "ptr", pvarPrefix, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarPrefix
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNamespace 
     * @returns {VARIANT_BOOL} 
     */
    isDefaultNamespace(pvarNamespace) {
        result := ComCall(16, this, "ptr", pvarNamespace, "short*", &pfDefaultNamespace := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfDefaultNamespace
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @returns {IHTMLDOMNode} 
     */
    appendChild(newChild) {
        result := ComCall(17, this, "ptr", newChild, "ptr*", &node_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDOMNode(node_)
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @param {VARIANT} refChild 
     * @returns {IHTMLDOMNode} 
     */
    insertBefore(newChild, refChild) {
        result := ComCall(18, this, "ptr", newChild, "ptr", refChild, "ptr*", &node_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDOMNode(node_)
    }

    /**
     * 
     * @param {IHTMLDOMNode} oldChild 
     * @returns {IHTMLDOMNode} 
     */
    removeChild(oldChild) {
        result := ComCall(19, this, "ptr", oldChild, "ptr*", &node_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDOMNode(node_)
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @param {IHTMLDOMNode} oldChild 
     * @returns {IHTMLDOMNode} 
     */
    replaceChild(newChild, oldChild) {
        result := ComCall(20, this, "ptr", newChild, "ptr", oldChild, "ptr*", &node_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDOMNode(node_)
    }

    /**
     * 
     * @param {IHTMLDOMNode3} otherNode 
     * @returns {VARIANT_BOOL} 
     */
    isSameNode(otherNode) {
        result := ComCall(21, this, "ptr", otherNode, "short*", &isSame := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isSame
    }

    /**
     * 
     * @param {IHTMLDOMNode} otherNode 
     * @returns {Integer} 
     */
    compareDocumentPosition(otherNode) {
        result := ComCall(22, this, "ptr", otherNode, "ushort*", &flags := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return flags
    }

    /**
     * 
     * @param {BSTR} feature 
     * @param {VARIANT} version_ 
     * @returns {VARIANT_BOOL} 
     */
    isSupported(feature, version_) {
        if(feature is String) {
            pin := BSTR.Alloc(feature)
            feature := pin.Value
        }

        result := ComCall(23, this, "ptr", feature, "ptr", version_, "short*", &pfisSupported := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfisSupported
    }
}
