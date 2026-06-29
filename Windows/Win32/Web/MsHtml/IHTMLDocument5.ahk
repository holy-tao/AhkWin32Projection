#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLDOMImplementation.ahk" { IHTMLDOMImplementation }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLDOMAttribute.ahk" { IHTMLDOMAttribute }
#Import ".\IHTMLDOMNode.ahk" { IHTMLDOMNode }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDocument5 extends IDispatch {
    /**
     * The interface identifier for IHTMLDocument5
     * @type {Guid}
     */
    static IID := Guid("{3050f80c-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDocument5 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_onmousewheel       : IntPtr
        get_onmousewheel       : IntPtr
        get_doctype            : IntPtr
        get_implementation     : IntPtr
        createAttribute        : IntPtr
        createComment          : IntPtr
        put_onfocusin          : IntPtr
        get_onfocusin          : IntPtr
        put_onfocusout         : IntPtr
        get_onfocusout         : IntPtr
        put_onactivate         : IntPtr
        get_onactivate         : IntPtr
        put_ondeactivate       : IntPtr
        get_ondeactivate       : IntPtr
        put_onbeforeactivate   : IntPtr
        get_onbeforeactivate   : IntPtr
        put_onbeforedeactivate : IntPtr
        get_onbeforedeactivate : IntPtr
        get_compatMode         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDocument5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    onmousewheel {
        get => this.get_onmousewheel()
        set => this.put_onmousewheel(value)
    }

    /**
     * @type {IHTMLDOMNode} 
     */
    doctype {
        get => this.get_doctype()
    }

    /**
     * @type {IHTMLDOMImplementation} 
     */
    implementation {
        get => this.get_implementation()
    }

    /**
     * @type {VARIANT} 
     */
    onfocusin {
        get => this.get_onfocusin()
        set => this.put_onfocusin(value)
    }

    /**
     * @type {VARIANT} 
     */
    onfocusout {
        get => this.get_onfocusout()
        set => this.put_onfocusout(value)
    }

    /**
     * @type {VARIANT} 
     */
    onactivate {
        get => this.get_onactivate()
        set => this.put_onactivate(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondeactivate {
        get => this.get_ondeactivate()
        set => this.put_ondeactivate(value)
    }

    /**
     * @type {VARIANT} 
     */
    onbeforeactivate {
        get => this.get_onbeforeactivate()
        set => this.put_onbeforeactivate(value)
    }

    /**
     * @type {VARIANT} 
     */
    onbeforedeactivate {
        get => this.get_onbeforedeactivate()
        set => this.put_onbeforedeactivate(value)
    }

    /**
     * @type {BSTR} 
     */
    compatMode {
        get => this.get_compatMode()
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousewheel(v) {
        result := ComCall(7, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousewheel() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_doctype() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {IHTMLDOMImplementation} 
     */
    get_implementation() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMImplementation(p)
    }

    /**
     * 
     * @param {BSTR} bstrattrName 
     * @returns {IHTMLDOMAttribute} 
     */
    createAttribute(bstrattrName) {
        bstrattrName := bstrattrName is String ? BSTR.Alloc(bstrattrName).Value : bstrattrName

        result := ComCall(11, this, BSTR, bstrattrName, "ptr*", &ppattribute := 0, "HRESULT")
        return IHTMLDOMAttribute(ppattribute)
    }

    /**
     * 
     * @param {BSTR} bstrdata 
     * @returns {IHTMLDOMNode} 
     */
    createComment(bstrdata) {
        bstrdata := bstrdata is String ? BSTR.Alloc(bstrdata).Value : bstrdata

        result := ComCall(12, this, BSTR, bstrdata, "ptr*", &ppRetNode := 0, "HRESULT")
        return IHTMLDOMNode(ppRetNode)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocusin(v) {
        result := ComCall(13, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocusin() {
        p := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocusout(v) {
        result := ComCall(15, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocusout() {
        p := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onactivate(v) {
        result := ComCall(17, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onactivate() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondeactivate(v) {
        result := ComCall(19, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondeactivate() {
        p := VARIANT()
        result := ComCall(20, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeactivate(v) {
        result := ComCall(21, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeactivate() {
        p := VARIANT()
        result := ComCall(22, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforedeactivate(v) {
        result := ComCall(23, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforedeactivate() {
        p := VARIANT()
        result := ComCall(24, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_compatMode() {
        p := BSTR.Owned()
        result := ComCall(25, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLDocument5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_onmousewheel := CallbackCreate(GetMethod(implObj, "put_onmousewheel"), flags, 2)
        this.vtbl.get_onmousewheel := CallbackCreate(GetMethod(implObj, "get_onmousewheel"), flags, 2)
        this.vtbl.get_doctype := CallbackCreate(GetMethod(implObj, "get_doctype"), flags, 2)
        this.vtbl.get_implementation := CallbackCreate(GetMethod(implObj, "get_implementation"), flags, 2)
        this.vtbl.createAttribute := CallbackCreate(GetMethod(implObj, "createAttribute"), flags, 3)
        this.vtbl.createComment := CallbackCreate(GetMethod(implObj, "createComment"), flags, 3)
        this.vtbl.put_onfocusin := CallbackCreate(GetMethod(implObj, "put_onfocusin"), flags, 2)
        this.vtbl.get_onfocusin := CallbackCreate(GetMethod(implObj, "get_onfocusin"), flags, 2)
        this.vtbl.put_onfocusout := CallbackCreate(GetMethod(implObj, "put_onfocusout"), flags, 2)
        this.vtbl.get_onfocusout := CallbackCreate(GetMethod(implObj, "get_onfocusout"), flags, 2)
        this.vtbl.put_onactivate := CallbackCreate(GetMethod(implObj, "put_onactivate"), flags, 2)
        this.vtbl.get_onactivate := CallbackCreate(GetMethod(implObj, "get_onactivate"), flags, 2)
        this.vtbl.put_ondeactivate := CallbackCreate(GetMethod(implObj, "put_ondeactivate"), flags, 2)
        this.vtbl.get_ondeactivate := CallbackCreate(GetMethod(implObj, "get_ondeactivate"), flags, 2)
        this.vtbl.put_onbeforeactivate := CallbackCreate(GetMethod(implObj, "put_onbeforeactivate"), flags, 2)
        this.vtbl.get_onbeforeactivate := CallbackCreate(GetMethod(implObj, "get_onbeforeactivate"), flags, 2)
        this.vtbl.put_onbeforedeactivate := CallbackCreate(GetMethod(implObj, "put_onbeforedeactivate"), flags, 2)
        this.vtbl.get_onbeforedeactivate := CallbackCreate(GetMethod(implObj, "get_onbeforedeactivate"), flags, 2)
        this.vtbl.get_compatMode := CallbackCreate(GetMethod(implObj, "get_compatMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_onmousewheel)
        CallbackFree(this.vtbl.get_onmousewheel)
        CallbackFree(this.vtbl.get_doctype)
        CallbackFree(this.vtbl.get_implementation)
        CallbackFree(this.vtbl.createAttribute)
        CallbackFree(this.vtbl.createComment)
        CallbackFree(this.vtbl.put_onfocusin)
        CallbackFree(this.vtbl.get_onfocusin)
        CallbackFree(this.vtbl.put_onfocusout)
        CallbackFree(this.vtbl.get_onfocusout)
        CallbackFree(this.vtbl.put_onactivate)
        CallbackFree(this.vtbl.get_onactivate)
        CallbackFree(this.vtbl.put_ondeactivate)
        CallbackFree(this.vtbl.get_ondeactivate)
        CallbackFree(this.vtbl.put_onbeforeactivate)
        CallbackFree(this.vtbl.get_onbeforeactivate)
        CallbackFree(this.vtbl.put_onbeforedeactivate)
        CallbackFree(this.vtbl.get_onbeforedeactivate)
        CallbackFree(this.vtbl.get_compatMode)
    }
}
