#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLFrameBase extends IDispatch {
    /**
     * The interface identifier for IHTMLFrameBase
     * @type {Guid}
     */
    static IID := Guid("{3050f311-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLFrameBase
     * @type {Guid}
     */
    static CLSID := Guid("{3050f312-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLFrameBase interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_src          : IntPtr
        get_src          : IntPtr
        put_name         : IntPtr
        get_name         : IntPtr
        put_border       : IntPtr
        get_border       : IntPtr
        put_frameBorder  : IntPtr
        get_frameBorder  : IntPtr
        put_frameSpacing : IntPtr
        get_frameSpacing : IntPtr
        put_marginWidth  : IntPtr
        get_marginWidth  : IntPtr
        put_marginHeight : IntPtr
        get_marginHeight : IntPtr
        put_noResize     : IntPtr
        get_noResize     : IntPtr
        put_scrolling    : IntPtr
        get_scrolling    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLFrameBase.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    src {
        get => this.get_src()
        set => this.put_src(value)
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
        set => this.put_name(value)
    }

    /**
     * @type {VARIANT} 
     */
    border {
        get => this.get_border()
        set => this.put_border(value)
    }

    /**
     * @type {BSTR} 
     */
    frameBorder {
        get => this.get_frameBorder()
        set => this.put_frameBorder(value)
    }

    /**
     * @type {VARIANT} 
     */
    frameSpacing {
        get => this.get_frameSpacing()
        set => this.put_frameSpacing(value)
    }

    /**
     * @type {VARIANT} 
     */
    marginWidth {
        get => this.get_marginWidth()
        set => this.put_marginWidth(value)
    }

    /**
     * @type {VARIANT} 
     */
    marginHeight {
        get => this.get_marginHeight()
        set => this.put_marginHeight(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    noResize {
        get => this.get_noResize()
        set => this.put_noResize(value)
    }

    /**
     * @type {BSTR} 
     */
    scrolling {
        get => this.get_scrolling()
        set => this.put_scrolling(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_src(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_src() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_border(v) {
        result := ComCall(11, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_border() {
        p := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_frameBorder(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_frameBorder() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_frameSpacing(v) {
        result := ComCall(15, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_frameSpacing() {
        p := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginWidth(v) {
        result := ComCall(17, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginWidth() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginHeight(v) {
        result := ComCall(19, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginHeight() {
        p := VARIANT()
        result := ComCall(20, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_noResize(v) {
        result := ComCall(21, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_noResize() {
        result := ComCall(22, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_scrolling(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_scrolling() {
        p := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLFrameBase.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_src := CallbackCreate(GetMethod(implObj, "put_src"), flags, 2)
        this.vtbl.get_src := CallbackCreate(GetMethod(implObj, "get_src"), flags, 2)
        this.vtbl.put_name := CallbackCreate(GetMethod(implObj, "put_name"), flags, 2)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.put_border := CallbackCreate(GetMethod(implObj, "put_border"), flags, 2)
        this.vtbl.get_border := CallbackCreate(GetMethod(implObj, "get_border"), flags, 2)
        this.vtbl.put_frameBorder := CallbackCreate(GetMethod(implObj, "put_frameBorder"), flags, 2)
        this.vtbl.get_frameBorder := CallbackCreate(GetMethod(implObj, "get_frameBorder"), flags, 2)
        this.vtbl.put_frameSpacing := CallbackCreate(GetMethod(implObj, "put_frameSpacing"), flags, 2)
        this.vtbl.get_frameSpacing := CallbackCreate(GetMethod(implObj, "get_frameSpacing"), flags, 2)
        this.vtbl.put_marginWidth := CallbackCreate(GetMethod(implObj, "put_marginWidth"), flags, 2)
        this.vtbl.get_marginWidth := CallbackCreate(GetMethod(implObj, "get_marginWidth"), flags, 2)
        this.vtbl.put_marginHeight := CallbackCreate(GetMethod(implObj, "put_marginHeight"), flags, 2)
        this.vtbl.get_marginHeight := CallbackCreate(GetMethod(implObj, "get_marginHeight"), flags, 2)
        this.vtbl.put_noResize := CallbackCreate(GetMethod(implObj, "put_noResize"), flags, 2)
        this.vtbl.get_noResize := CallbackCreate(GetMethod(implObj, "get_noResize"), flags, 2)
        this.vtbl.put_scrolling := CallbackCreate(GetMethod(implObj, "put_scrolling"), flags, 2)
        this.vtbl.get_scrolling := CallbackCreate(GetMethod(implObj, "get_scrolling"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_src)
        CallbackFree(this.vtbl.get_src)
        CallbackFree(this.vtbl.put_name)
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.put_border)
        CallbackFree(this.vtbl.get_border)
        CallbackFree(this.vtbl.put_frameBorder)
        CallbackFree(this.vtbl.get_frameBorder)
        CallbackFree(this.vtbl.put_frameSpacing)
        CallbackFree(this.vtbl.get_frameSpacing)
        CallbackFree(this.vtbl.put_marginWidth)
        CallbackFree(this.vtbl.get_marginWidth)
        CallbackFree(this.vtbl.put_marginHeight)
        CallbackFree(this.vtbl.get_marginHeight)
        CallbackFree(this.vtbl.put_noResize)
        CallbackFree(this.vtbl.get_noResize)
        CallbackFree(this.vtbl.put_scrolling)
        CallbackFree(this.vtbl.get_scrolling)
    }
}
