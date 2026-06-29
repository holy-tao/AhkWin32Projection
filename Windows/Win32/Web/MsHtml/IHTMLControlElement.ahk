#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLControlElement extends IDispatch {
    /**
     * The interface identifier for IHTMLControlElement
     * @type {Guid}
     */
    static IID := Guid("{3050f4e9-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLControlElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_tabIndex     : IntPtr
        get_tabIndex     : IntPtr
        focus            : IntPtr
        put_accessKey    : IntPtr
        get_accessKey    : IntPtr
        put_onblur       : IntPtr
        get_onblur       : IntPtr
        put_onfocus      : IntPtr
        get_onfocus      : IntPtr
        put_onresize     : IntPtr
        get_onresize     : IntPtr
        blur             : IntPtr
        addFilter        : IntPtr
        removeFilter     : IntPtr
        get_clientHeight : IntPtr
        get_clientWidth  : IntPtr
        get_clientTop    : IntPtr
        get_clientLeft   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLControlElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    tabIndex {
        get => this.get_tabIndex()
        set => this.put_tabIndex(value)
    }

    /**
     * @type {BSTR} 
     */
    accessKey {
        get => this.get_accessKey()
        set => this.put_accessKey(value)
    }

    /**
     * @type {VARIANT} 
     */
    onblur {
        get => this.get_onblur()
        set => this.put_onblur(value)
    }

    /**
     * @type {VARIANT} 
     */
    onfocus {
        get => this.get_onfocus()
        set => this.put_onfocus(value)
    }

    /**
     * @type {VARIANT} 
     */
    onresize {
        get => this.get_onresize()
        set => this.put_onresize(value)
    }

    /**
     * @type {Integer} 
     */
    clientHeight {
        get => this.get_clientHeight()
    }

    /**
     * @type {Integer} 
     */
    clientWidth {
        get => this.get_clientWidth()
    }

    /**
     * @type {Integer} 
     */
    clientTop {
        get => this.get_clientTop()
    }

    /**
     * @type {Integer} 
     */
    clientLeft {
        get => this.get_clientLeft()
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_tabIndex(v) {
        result := ComCall(7, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_tabIndex() {
        result := ComCall(8, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    focus() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_accessKey(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(10, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_accessKey() {
        p := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onblur(v) {
        result := ComCall(12, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onblur() {
        p := VARIANT()
        result := ComCall(13, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocus(v) {
        result := ComCall(14, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocus() {
        p := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onresize(v) {
        result := ComCall(16, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onresize() {
        p := VARIANT()
        result := ComCall(17, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    blur() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     */
    addFilter(pUnk) {
        result := ComCall(19, this, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     */
    removeFilter(pUnk) {
        result := ComCall(20, this, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientHeight() {
        result := ComCall(21, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientWidth() {
        result := ComCall(22, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientTop() {
        result := ComCall(23, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientLeft() {
        result := ComCall(24, this, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLControlElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_tabIndex := CallbackCreate(GetMethod(implObj, "put_tabIndex"), flags, 2)
        this.vtbl.get_tabIndex := CallbackCreate(GetMethod(implObj, "get_tabIndex"), flags, 2)
        this.vtbl.focus := CallbackCreate(GetMethod(implObj, "focus"), flags, 1)
        this.vtbl.put_accessKey := CallbackCreate(GetMethod(implObj, "put_accessKey"), flags, 2)
        this.vtbl.get_accessKey := CallbackCreate(GetMethod(implObj, "get_accessKey"), flags, 2)
        this.vtbl.put_onblur := CallbackCreate(GetMethod(implObj, "put_onblur"), flags, 2)
        this.vtbl.get_onblur := CallbackCreate(GetMethod(implObj, "get_onblur"), flags, 2)
        this.vtbl.put_onfocus := CallbackCreate(GetMethod(implObj, "put_onfocus"), flags, 2)
        this.vtbl.get_onfocus := CallbackCreate(GetMethod(implObj, "get_onfocus"), flags, 2)
        this.vtbl.put_onresize := CallbackCreate(GetMethod(implObj, "put_onresize"), flags, 2)
        this.vtbl.get_onresize := CallbackCreate(GetMethod(implObj, "get_onresize"), flags, 2)
        this.vtbl.blur := CallbackCreate(GetMethod(implObj, "blur"), flags, 1)
        this.vtbl.addFilter := CallbackCreate(GetMethod(implObj, "addFilter"), flags, 2)
        this.vtbl.removeFilter := CallbackCreate(GetMethod(implObj, "removeFilter"), flags, 2)
        this.vtbl.get_clientHeight := CallbackCreate(GetMethod(implObj, "get_clientHeight"), flags, 2)
        this.vtbl.get_clientWidth := CallbackCreate(GetMethod(implObj, "get_clientWidth"), flags, 2)
        this.vtbl.get_clientTop := CallbackCreate(GetMethod(implObj, "get_clientTop"), flags, 2)
        this.vtbl.get_clientLeft := CallbackCreate(GetMethod(implObj, "get_clientLeft"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_tabIndex)
        CallbackFree(this.vtbl.get_tabIndex)
        CallbackFree(this.vtbl.focus)
        CallbackFree(this.vtbl.put_accessKey)
        CallbackFree(this.vtbl.get_accessKey)
        CallbackFree(this.vtbl.put_onblur)
        CallbackFree(this.vtbl.get_onblur)
        CallbackFree(this.vtbl.put_onfocus)
        CallbackFree(this.vtbl.get_onfocus)
        CallbackFree(this.vtbl.put_onresize)
        CallbackFree(this.vtbl.get_onresize)
        CallbackFree(this.vtbl.blur)
        CallbackFree(this.vtbl.addFilter)
        CallbackFree(this.vtbl.removeFilter)
        CallbackFree(this.vtbl.get_clientHeight)
        CallbackFree(this.vtbl.get_clientWidth)
        CallbackFree(this.vtbl.get_clientTop)
        CallbackFree(this.vtbl.get_clientLeft)
    }
}
