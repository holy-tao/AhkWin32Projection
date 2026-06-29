#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLDOMNode.ahk" { IHTMLDOMNode }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDOMNode3 extends IDispatch {
    /**
     * The interface identifier for IHTMLDOMNode3
     * @type {Guid}
     */
    static IID := Guid("{305106e0-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDOMNode3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_prefix              : IntPtr
        get_prefix              : IntPtr
        get_localName           : IntPtr
        get_namespaceURI        : IntPtr
        put_textContent         : IntPtr
        get_textContent         : IntPtr
        isEqualNode             : IntPtr
        lookupNamespaceURI      : IntPtr
        lookupPrefix            : IntPtr
        isDefaultNamespace      : IntPtr
        appendChild             : IntPtr
        insertBefore            : IntPtr
        removeChild             : IntPtr
        replaceChild            : IntPtr
        isSameNode              : IntPtr
        compareDocumentPosition : IntPtr
        isSupported             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDOMNode3.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(7, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_prefix() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_localName() {
        p := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_namespaceURI() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textContent(v) {
        result := ComCall(11, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textContent() {
        p := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IHTMLDOMNode3} otherNode 
     * @returns {VARIANT_BOOL} 
     */
    isEqualNode(otherNode) {
        result := ComCall(13, this, "ptr", otherNode, VARIANT_BOOL.Ptr, &isEqual := 0, "HRESULT")
        return isEqual
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarPrefix 
     * @returns {VARIANT} 
     */
    lookupNamespaceURI(pvarPrefix) {
        pvarNamespaceURI := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, pvarPrefix, VARIANT.Ptr, pvarNamespaceURI, "HRESULT")
        return pvarNamespaceURI
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNamespaceURI 
     * @returns {VARIANT} 
     */
    lookupPrefix(pvarNamespaceURI) {
        pvarPrefix := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, pvarNamespaceURI, VARIANT.Ptr, pvarPrefix, "HRESULT")
        return pvarPrefix
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNamespace 
     * @returns {VARIANT_BOOL} 
     */
    isDefaultNamespace(pvarNamespace) {
        result := ComCall(16, this, VARIANT.Ptr, pvarNamespace, VARIANT_BOOL.Ptr, &pfDefaultNamespace := 0, "HRESULT")
        return pfDefaultNamespace
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @returns {IHTMLDOMNode} 
     */
    appendChild(newChild) {
        result := ComCall(17, this, "ptr", newChild, "ptr*", &_node := 0, "HRESULT")
        return IHTMLDOMNode(_node)
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @param {VARIANT} refChild 
     * @returns {IHTMLDOMNode} 
     */
    insertBefore(newChild, refChild) {
        result := ComCall(18, this, "ptr", newChild, VARIANT, refChild, "ptr*", &_node := 0, "HRESULT")
        return IHTMLDOMNode(_node)
    }

    /**
     * 
     * @param {IHTMLDOMNode} oldChild 
     * @returns {IHTMLDOMNode} 
     */
    removeChild(oldChild) {
        result := ComCall(19, this, "ptr", oldChild, "ptr*", &_node := 0, "HRESULT")
        return IHTMLDOMNode(_node)
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @param {IHTMLDOMNode} oldChild 
     * @returns {IHTMLDOMNode} 
     */
    replaceChild(newChild, oldChild) {
        result := ComCall(20, this, "ptr", newChild, "ptr", oldChild, "ptr*", &_node := 0, "HRESULT")
        return IHTMLDOMNode(_node)
    }

    /**
     * 
     * @param {IHTMLDOMNode3} otherNode 
     * @returns {VARIANT_BOOL} 
     */
    isSameNode(otherNode) {
        result := ComCall(21, this, "ptr", otherNode, VARIANT_BOOL.Ptr, &isSame := 0, "HRESULT")
        return isSame
    }

    /**
     * 
     * @param {IHTMLDOMNode} otherNode 
     * @returns {Integer} 
     */
    compareDocumentPosition(otherNode) {
        result := ComCall(22, this, "ptr", otherNode, "ushort*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * 
     * @param {BSTR} feature 
     * @param {VARIANT} _version 
     * @returns {VARIANT_BOOL} 
     */
    isSupported(feature, _version) {
        feature := feature is String ? BSTR.Alloc(feature).Value : feature

        result := ComCall(23, this, BSTR, feature, VARIANT, _version, VARIANT_BOOL.Ptr, &pfisSupported := 0, "HRESULT")
        return pfisSupported
    }

    Query(iid) {
        if (IHTMLDOMNode3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_prefix := CallbackCreate(GetMethod(implObj, "put_prefix"), flags, 2)
        this.vtbl.get_prefix := CallbackCreate(GetMethod(implObj, "get_prefix"), flags, 2)
        this.vtbl.get_localName := CallbackCreate(GetMethod(implObj, "get_localName"), flags, 2)
        this.vtbl.get_namespaceURI := CallbackCreate(GetMethod(implObj, "get_namespaceURI"), flags, 2)
        this.vtbl.put_textContent := CallbackCreate(GetMethod(implObj, "put_textContent"), flags, 2)
        this.vtbl.get_textContent := CallbackCreate(GetMethod(implObj, "get_textContent"), flags, 2)
        this.vtbl.isEqualNode := CallbackCreate(GetMethod(implObj, "isEqualNode"), flags, 3)
        this.vtbl.lookupNamespaceURI := CallbackCreate(GetMethod(implObj, "lookupNamespaceURI"), flags, 3)
        this.vtbl.lookupPrefix := CallbackCreate(GetMethod(implObj, "lookupPrefix"), flags, 3)
        this.vtbl.isDefaultNamespace := CallbackCreate(GetMethod(implObj, "isDefaultNamespace"), flags, 3)
        this.vtbl.appendChild := CallbackCreate(GetMethod(implObj, "appendChild"), flags, 3)
        this.vtbl.insertBefore := CallbackCreate(GetMethod(implObj, "insertBefore"), flags, 4)
        this.vtbl.removeChild := CallbackCreate(GetMethod(implObj, "removeChild"), flags, 3)
        this.vtbl.replaceChild := CallbackCreate(GetMethod(implObj, "replaceChild"), flags, 4)
        this.vtbl.isSameNode := CallbackCreate(GetMethod(implObj, "isSameNode"), flags, 3)
        this.vtbl.compareDocumentPosition := CallbackCreate(GetMethod(implObj, "compareDocumentPosition"), flags, 3)
        this.vtbl.isSupported := CallbackCreate(GetMethod(implObj, "isSupported"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_prefix)
        CallbackFree(this.vtbl.get_prefix)
        CallbackFree(this.vtbl.get_localName)
        CallbackFree(this.vtbl.get_namespaceURI)
        CallbackFree(this.vtbl.put_textContent)
        CallbackFree(this.vtbl.get_textContent)
        CallbackFree(this.vtbl.isEqualNode)
        CallbackFree(this.vtbl.lookupNamespaceURI)
        CallbackFree(this.vtbl.lookupPrefix)
        CallbackFree(this.vtbl.isDefaultNamespace)
        CallbackFree(this.vtbl.appendChild)
        CallbackFree(this.vtbl.insertBefore)
        CallbackFree(this.vtbl.removeChild)
        CallbackFree(this.vtbl.replaceChild)
        CallbackFree(this.vtbl.isSameNode)
        CallbackFree(this.vtbl.compareDocumentPosition)
        CallbackFree(this.vtbl.isSupported)
    }
}
