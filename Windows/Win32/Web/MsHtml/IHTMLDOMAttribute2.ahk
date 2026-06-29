#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLDOMAttribute.ahk" { IHTMLDOMAttribute }
#Import ".\IHTMLDOMNode.ahk" { IHTMLDOMNode }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDOMAttribute2 extends IDispatch {
    /**
     * The interface identifier for IHTMLDOMAttribute2
     * @type {Guid}
     */
    static IID := Guid("{3050f810-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDOMAttribute2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_name            : IntPtr
        put_value           : IntPtr
        get_value           : IntPtr
        get_expando         : IntPtr
        get_nodeType        : IntPtr
        get_parentNode      : IntPtr
        get_childNodes      : IntPtr
        get_firstChild      : IntPtr
        get_lastChild       : IntPtr
        get_previousSibling : IntPtr
        get_nextSibling     : IntPtr
        get_attributes      : IntPtr
        get_ownerDocument   : IntPtr
        insertBefore        : IntPtr
        replaceChild        : IntPtr
        removeChild         : IntPtr
        appendChild         : IntPtr
        hasChildNodes       : IntPtr
        cloneNode           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDOMAttribute2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_value(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(8, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_value() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_expando() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
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
        result := ComCall(20, this, "ptr", newChild, VARIANT, refChild, "ptr*", &_node := 0, "HRESULT")
        return IHTMLDOMNode(_node)
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @param {IHTMLDOMNode} oldChild 
     * @returns {IHTMLDOMNode} 
     */
    replaceChild(newChild, oldChild) {
        result := ComCall(21, this, "ptr", newChild, "ptr", oldChild, "ptr*", &_node := 0, "HRESULT")
        return IHTMLDOMNode(_node)
    }

    /**
     * 
     * @param {IHTMLDOMNode} oldChild 
     * @returns {IHTMLDOMNode} 
     */
    removeChild(oldChild) {
        result := ComCall(22, this, "ptr", oldChild, "ptr*", &_node := 0, "HRESULT")
        return IHTMLDOMNode(_node)
    }

    /**
     * 
     * @param {IHTMLDOMNode} newChild 
     * @returns {IHTMLDOMNode} 
     */
    appendChild(newChild) {
        result := ComCall(23, this, "ptr", newChild, "ptr*", &_node := 0, "HRESULT")
        return IHTMLDOMNode(_node)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    hasChildNodes() {
        result := ComCall(24, this, VARIANT_BOOL.Ptr, &fChildren := 0, "HRESULT")
        return fChildren
    }

    /**
     * 
     * @param {VARIANT_BOOL} fDeep 
     * @returns {IHTMLDOMAttribute} 
     */
    cloneNode(fDeep) {
        result := ComCall(25, this, VARIANT_BOOL, fDeep, "ptr*", &clonedNode := 0, "HRESULT")
        return IHTMLDOMAttribute(clonedNode)
    }

    Query(iid) {
        if (IHTMLDOMAttribute2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.put_value := CallbackCreate(GetMethod(implObj, "put_value"), flags, 2)
        this.vtbl.get_value := CallbackCreate(GetMethod(implObj, "get_value"), flags, 2)
        this.vtbl.get_expando := CallbackCreate(GetMethod(implObj, "get_expando"), flags, 2)
        this.vtbl.get_nodeType := CallbackCreate(GetMethod(implObj, "get_nodeType"), flags, 2)
        this.vtbl.get_parentNode := CallbackCreate(GetMethod(implObj, "get_parentNode"), flags, 2)
        this.vtbl.get_childNodes := CallbackCreate(GetMethod(implObj, "get_childNodes"), flags, 2)
        this.vtbl.get_firstChild := CallbackCreate(GetMethod(implObj, "get_firstChild"), flags, 2)
        this.vtbl.get_lastChild := CallbackCreate(GetMethod(implObj, "get_lastChild"), flags, 2)
        this.vtbl.get_previousSibling := CallbackCreate(GetMethod(implObj, "get_previousSibling"), flags, 2)
        this.vtbl.get_nextSibling := CallbackCreate(GetMethod(implObj, "get_nextSibling"), flags, 2)
        this.vtbl.get_attributes := CallbackCreate(GetMethod(implObj, "get_attributes"), flags, 2)
        this.vtbl.get_ownerDocument := CallbackCreate(GetMethod(implObj, "get_ownerDocument"), flags, 2)
        this.vtbl.insertBefore := CallbackCreate(GetMethod(implObj, "insertBefore"), flags, 4)
        this.vtbl.replaceChild := CallbackCreate(GetMethod(implObj, "replaceChild"), flags, 4)
        this.vtbl.removeChild := CallbackCreate(GetMethod(implObj, "removeChild"), flags, 3)
        this.vtbl.appendChild := CallbackCreate(GetMethod(implObj, "appendChild"), flags, 3)
        this.vtbl.hasChildNodes := CallbackCreate(GetMethod(implObj, "hasChildNodes"), flags, 2)
        this.vtbl.cloneNode := CallbackCreate(GetMethod(implObj, "cloneNode"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.put_value)
        CallbackFree(this.vtbl.get_value)
        CallbackFree(this.vtbl.get_expando)
        CallbackFree(this.vtbl.get_nodeType)
        CallbackFree(this.vtbl.get_parentNode)
        CallbackFree(this.vtbl.get_childNodes)
        CallbackFree(this.vtbl.get_firstChild)
        CallbackFree(this.vtbl.get_lastChild)
        CallbackFree(this.vtbl.get_previousSibling)
        CallbackFree(this.vtbl.get_nextSibling)
        CallbackFree(this.vtbl.get_attributes)
        CallbackFree(this.vtbl.get_ownerDocument)
        CallbackFree(this.vtbl.insertBefore)
        CallbackFree(this.vtbl.replaceChild)
        CallbackFree(this.vtbl.removeChild)
        CallbackFree(this.vtbl.appendChild)
        CallbackFree(this.vtbl.hasChildNodes)
        CallbackFree(this.vtbl.cloneNode)
    }
}
