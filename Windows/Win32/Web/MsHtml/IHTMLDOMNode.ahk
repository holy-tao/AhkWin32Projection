#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDOMNode extends IDispatch {
    /**
     * The interface identifier for IHTMLDOMNode
     * @type {Guid}
     */
    static IID := Guid("{3050f5da-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDOMNode interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_nodeType        : IntPtr
        get_parentNode      : IntPtr
        hasChildNodes       : IntPtr
        get_childNodes      : IntPtr
        get_attributes      : IntPtr
        insertBefore        : IntPtr
        removeChild         : IntPtr
        replaceChild        : IntPtr
        cloneNode           : IntPtr
        removeNode          : IntPtr
        swapNode            : IntPtr
        replaceNode         : IntPtr
        appendChild         : IntPtr
        get_nodeName        : IntPtr
        put_nodeValue       : IntPtr
        get_nodeValue       : IntPtr
        get_firstChild      : IntPtr
        get_lastChild       : IntPtr
        get_previousSibling : IntPtr
        get_nextSibling     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDOMNode.Vtbl()
        }
        super.__New(implObj, flags)
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
     * @returns {Integer} 
     */
    get_nodeType() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * @returns {IHTMLDOMNode} 
     */
    get_parentNode() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * @returns {VARIANT_BOOL} 
     */
    hasChildNodes() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &fChildren := 0, "HRESULT")
        return fChildren
    }

    /**
     * @returns {IDispatch} 
     */
    get_childNodes() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * @returns {IDispatch} 
     */
    get_attributes() {
        result := ComCall(11, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * @param {IHTMLDOMNode} newChild 
     * @param {VARIANT} refChild 
     * @returns {IHTMLDOMNode} 
     */
    insertBefore(newChild, refChild) {
        result := ComCall(12, this, "ptr", newChild, VARIANT, refChild, "ptr*", &_node := 0, "HRESULT")
        return IHTMLDOMNode(_node)
    }

    /**
     * @param {IHTMLDOMNode} oldChild 
     * @returns {IHTMLDOMNode} 
     */
    removeChild(oldChild) {
        result := ComCall(13, this, "ptr", oldChild, "ptr*", &_node := 0, "HRESULT")
        return IHTMLDOMNode(_node)
    }

    /**
     * @param {IHTMLDOMNode} newChild 
     * @param {IHTMLDOMNode} oldChild 
     * @returns {IHTMLDOMNode} 
     */
    replaceChild(newChild, oldChild) {
        result := ComCall(14, this, "ptr", newChild, "ptr", oldChild, "ptr*", &_node := 0, "HRESULT")
        return IHTMLDOMNode(_node)
    }

    /**
     * @param {VARIANT_BOOL} fDeep 
     * @returns {IHTMLDOMNode} 
     */
    cloneNode(fDeep) {
        result := ComCall(15, this, VARIANT_BOOL, fDeep, "ptr*", &clonedNode := 0, "HRESULT")
        return IHTMLDOMNode(clonedNode)
    }

    /**
     * @param {VARIANT_BOOL} fDeep 
     * @returns {IHTMLDOMNode} 
     */
    removeNode(fDeep) {
        result := ComCall(16, this, VARIANT_BOOL, fDeep, "ptr*", &removed := 0, "HRESULT")
        return IHTMLDOMNode(removed)
    }

    /**
     * @param {IHTMLDOMNode} otherNode 
     * @returns {IHTMLDOMNode} 
     */
    swapNode(otherNode) {
        result := ComCall(17, this, "ptr", otherNode, "ptr*", &swappedNode := 0, "HRESULT")
        return IHTMLDOMNode(swappedNode)
    }

    /**
     * @param {IHTMLDOMNode} replacement 
     * @returns {IHTMLDOMNode} 
     */
    replaceNode(replacement) {
        result := ComCall(18, this, "ptr", replacement, "ptr*", &replaced := 0, "HRESULT")
        return IHTMLDOMNode(replaced)
    }

    /**
     * @param {IHTMLDOMNode} newChild 
     * @returns {IHTMLDOMNode} 
     */
    appendChild(newChild) {
        result := ComCall(19, this, "ptr", newChild, "ptr*", &_node := 0, "HRESULT")
        return IHTMLDOMNode(_node)
    }

    /**
     * @returns {BSTR} 
     */
    get_nodeName() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_nodeValue(v) {
        result := ComCall(21, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * @returns {VARIANT} 
     */
    get_nodeValue() {
        p := VARIANT()
        result := ComCall(22, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * @returns {IHTMLDOMNode} 
     */
    get_firstChild() {
        result := ComCall(23, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * @returns {IHTMLDOMNode} 
     */
    get_lastChild() {
        result := ComCall(24, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * @returns {IHTMLDOMNode} 
     */
    get_previousSibling() {
        result := ComCall(25, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * @returns {IHTMLDOMNode} 
     */
    get_nextSibling() {
        result := ComCall(26, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    _Query(iid) {
        if (IHTMLDOMNode.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_nodeType := CallbackCreate(ObjBindMethod(implObj, "get_nodeType"), flags, 2)
        this.vtbl.get_parentNode := CallbackCreate(ObjBindMethod(implObj, "get_parentNode"), flags, 2)
        this.vtbl.hasChildNodes := CallbackCreate(ObjBindMethod(implObj, "hasChildNodes"), flags, 2)
        this.vtbl.get_childNodes := CallbackCreate(ObjBindMethod(implObj, "get_childNodes"), flags, 2)
        this.vtbl.get_attributes := CallbackCreate(ObjBindMethod(implObj, "get_attributes"), flags, 2)
        this.vtbl.insertBefore := CallbackCreate(ObjBindMethod(implObj, "insertBefore"), flags, 4)
        this.vtbl.removeChild := CallbackCreate(ObjBindMethod(implObj, "removeChild"), flags, 3)
        this.vtbl.replaceChild := CallbackCreate(ObjBindMethod(implObj, "replaceChild"), flags, 4)
        this.vtbl.cloneNode := CallbackCreate(ObjBindMethod(implObj, "cloneNode"), flags, 3)
        this.vtbl.removeNode := CallbackCreate(ObjBindMethod(implObj, "removeNode"), flags, 3)
        this.vtbl.swapNode := CallbackCreate(ObjBindMethod(implObj, "swapNode"), flags, 3)
        this.vtbl.replaceNode := CallbackCreate(ObjBindMethod(implObj, "replaceNode"), flags, 3)
        this.vtbl.appendChild := CallbackCreate(ObjBindMethod(implObj, "appendChild"), flags, 3)
        this.vtbl.get_nodeName := CallbackCreate(ObjBindMethod(implObj, "get_nodeName"), flags, 2)
        this.vtbl.put_nodeValue := CallbackCreate(ObjBindMethod(implObj, "put_nodeValue"), flags, 2)
        this.vtbl.get_nodeValue := CallbackCreate(ObjBindMethod(implObj, "get_nodeValue"), flags, 2)
        this.vtbl.get_firstChild := CallbackCreate(ObjBindMethod(implObj, "get_firstChild"), flags, 2)
        this.vtbl.get_lastChild := CallbackCreate(ObjBindMethod(implObj, "get_lastChild"), flags, 2)
        this.vtbl.get_previousSibling := CallbackCreate(ObjBindMethod(implObj, "get_previousSibling"), flags, 2)
        this.vtbl.get_nextSibling := CallbackCreate(ObjBindMethod(implObj, "get_nextSibling"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_nodeType)
        CallbackFree(this.vtbl.get_parentNode)
        CallbackFree(this.vtbl.hasChildNodes)
        CallbackFree(this.vtbl.get_childNodes)
        CallbackFree(this.vtbl.get_attributes)
        CallbackFree(this.vtbl.insertBefore)
        CallbackFree(this.vtbl.removeChild)
        CallbackFree(this.vtbl.replaceChild)
        CallbackFree(this.vtbl.cloneNode)
        CallbackFree(this.vtbl.removeNode)
        CallbackFree(this.vtbl.swapNode)
        CallbackFree(this.vtbl.replaceNode)
        CallbackFree(this.vtbl.appendChild)
        CallbackFree(this.vtbl.get_nodeName)
        CallbackFree(this.vtbl.put_nodeValue)
        CallbackFree(this.vtbl.get_nodeValue)
        CallbackFree(this.vtbl.get_firstChild)
        CallbackFree(this.vtbl.get_lastChild)
        CallbackFree(this.vtbl.get_previousSibling)
        CallbackFree(this.vtbl.get_nextSibling)
    }
}
