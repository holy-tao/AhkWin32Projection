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
export default struct IHTMLAreaElement extends IDispatch {
    /**
     * The interface identifier for IHTMLAreaElement
     * @type {Guid}
     */
    static IID := Guid("{3050f265-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLAreaElement
     * @type {Guid}
     */
    static CLSID := Guid("{3050f283-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLAreaElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_shape    : IntPtr
        get_shape    : IntPtr
        put_coords   : IntPtr
        get_coords   : IntPtr
        put_href     : IntPtr
        get_href     : IntPtr
        put_target   : IntPtr
        get_target   : IntPtr
        put_alt      : IntPtr
        get_alt      : IntPtr
        put_noHref   : IntPtr
        get_noHref   : IntPtr
        put_host     : IntPtr
        get_host     : IntPtr
        put_hostname : IntPtr
        get_hostname : IntPtr
        put_pathname : IntPtr
        get_pathname : IntPtr
        put_port     : IntPtr
        get_port     : IntPtr
        put_protocol : IntPtr
        get_protocol : IntPtr
        put_search   : IntPtr
        get_search   : IntPtr
        put_hash     : IntPtr
        get_hash     : IntPtr
        put_onblur   : IntPtr
        get_onblur   : IntPtr
        put_onfocus  : IntPtr
        get_onfocus  : IntPtr
        put_tabIndex : IntPtr
        get_tabIndex : IntPtr
        focus        : IntPtr
        blur         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLAreaElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    shape {
        get => this.get_shape()
        set => this.put_shape(value)
    }

    /**
     * @type {BSTR} 
     */
    coords {
        get => this.get_coords()
        set => this.put_coords(value)
    }

    /**
     * @type {BSTR} 
     */
    href {
        get => this.get_href()
        set => this.put_href(value)
    }

    /**
     * @type {BSTR} 
     */
    target {
        get => this.get_target()
        set => this.put_target(value)
    }

    /**
     * @type {BSTR} 
     */
    alt {
        get => this.get_alt()
        set => this.put_alt(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    noHref {
        get => this.get_noHref()
        set => this.put_noHref(value)
    }

    /**
     * @type {BSTR} 
     */
    host {
        get => this.get_host()
        set => this.put_host(value)
    }

    /**
     * @type {BSTR} 
     */
    hostname {
        get => this.get_hostname()
        set => this.put_hostname(value)
    }

    /**
     * @type {BSTR} 
     */
    pathname {
        get => this.get_pathname()
        set => this.put_pathname(value)
    }

    /**
     * @type {BSTR} 
     */
    port {
        get => this.get_port()
        set => this.put_port(value)
    }

    /**
     * @type {BSTR} 
     */
    protocol {
        get => this.get_protocol()
        set => this.put_protocol(value)
    }

    /**
     * @type {BSTR} 
     */
    search {
        get => this.get_search()
        set => this.put_search(value)
    }

    /**
     * @type {BSTR} 
     */
    hash {
        get => this.get_hash()
        set => this.put_hash(value)
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
     * @type {Integer} 
     */
    tabIndex {
        get => this.get_tabIndex()
        set => this.put_tabIndex(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_shape(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_shape() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_coords(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_coords() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_href(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_href() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_target(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_target() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_alt(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_alt() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_noHref(v) {
        result := ComCall(17, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_noHref() {
        result := ComCall(18, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_host(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_host() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_hostname(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_hostname() {
        p := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_pathname(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pathname() {
        p := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_port(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_port() {
        p := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_protocol(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(27, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_protocol() {
        p := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_search(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(29, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_search() {
        p := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_hash(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(31, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_hash() {
        p := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onblur(v) {
        result := ComCall(33, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onblur() {
        p := VARIANT()
        result := ComCall(34, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocus(v) {
        result := ComCall(35, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocus() {
        p := VARIANT()
        result := ComCall(36, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_tabIndex(v) {
        result := ComCall(37, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_tabIndex() {
        result := ComCall(38, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    focus() {
        result := ComCall(39, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    blur() {
        result := ComCall(40, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLAreaElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_shape := CallbackCreate(GetMethod(implObj, "put_shape"), flags, 2)
        this.vtbl.get_shape := CallbackCreate(GetMethod(implObj, "get_shape"), flags, 2)
        this.vtbl.put_coords := CallbackCreate(GetMethod(implObj, "put_coords"), flags, 2)
        this.vtbl.get_coords := CallbackCreate(GetMethod(implObj, "get_coords"), flags, 2)
        this.vtbl.put_href := CallbackCreate(GetMethod(implObj, "put_href"), flags, 2)
        this.vtbl.get_href := CallbackCreate(GetMethod(implObj, "get_href"), flags, 2)
        this.vtbl.put_target := CallbackCreate(GetMethod(implObj, "put_target"), flags, 2)
        this.vtbl.get_target := CallbackCreate(GetMethod(implObj, "get_target"), flags, 2)
        this.vtbl.put_alt := CallbackCreate(GetMethod(implObj, "put_alt"), flags, 2)
        this.vtbl.get_alt := CallbackCreate(GetMethod(implObj, "get_alt"), flags, 2)
        this.vtbl.put_noHref := CallbackCreate(GetMethod(implObj, "put_noHref"), flags, 2)
        this.vtbl.get_noHref := CallbackCreate(GetMethod(implObj, "get_noHref"), flags, 2)
        this.vtbl.put_host := CallbackCreate(GetMethod(implObj, "put_host"), flags, 2)
        this.vtbl.get_host := CallbackCreate(GetMethod(implObj, "get_host"), flags, 2)
        this.vtbl.put_hostname := CallbackCreate(GetMethod(implObj, "put_hostname"), flags, 2)
        this.vtbl.get_hostname := CallbackCreate(GetMethod(implObj, "get_hostname"), flags, 2)
        this.vtbl.put_pathname := CallbackCreate(GetMethod(implObj, "put_pathname"), flags, 2)
        this.vtbl.get_pathname := CallbackCreate(GetMethod(implObj, "get_pathname"), flags, 2)
        this.vtbl.put_port := CallbackCreate(GetMethod(implObj, "put_port"), flags, 2)
        this.vtbl.get_port := CallbackCreate(GetMethod(implObj, "get_port"), flags, 2)
        this.vtbl.put_protocol := CallbackCreate(GetMethod(implObj, "put_protocol"), flags, 2)
        this.vtbl.get_protocol := CallbackCreate(GetMethod(implObj, "get_protocol"), flags, 2)
        this.vtbl.put_search := CallbackCreate(GetMethod(implObj, "put_search"), flags, 2)
        this.vtbl.get_search := CallbackCreate(GetMethod(implObj, "get_search"), flags, 2)
        this.vtbl.put_hash := CallbackCreate(GetMethod(implObj, "put_hash"), flags, 2)
        this.vtbl.get_hash := CallbackCreate(GetMethod(implObj, "get_hash"), flags, 2)
        this.vtbl.put_onblur := CallbackCreate(GetMethod(implObj, "put_onblur"), flags, 2)
        this.vtbl.get_onblur := CallbackCreate(GetMethod(implObj, "get_onblur"), flags, 2)
        this.vtbl.put_onfocus := CallbackCreate(GetMethod(implObj, "put_onfocus"), flags, 2)
        this.vtbl.get_onfocus := CallbackCreate(GetMethod(implObj, "get_onfocus"), flags, 2)
        this.vtbl.put_tabIndex := CallbackCreate(GetMethod(implObj, "put_tabIndex"), flags, 2)
        this.vtbl.get_tabIndex := CallbackCreate(GetMethod(implObj, "get_tabIndex"), flags, 2)
        this.vtbl.focus := CallbackCreate(GetMethod(implObj, "focus"), flags, 1)
        this.vtbl.blur := CallbackCreate(GetMethod(implObj, "blur"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_shape)
        CallbackFree(this.vtbl.get_shape)
        CallbackFree(this.vtbl.put_coords)
        CallbackFree(this.vtbl.get_coords)
        CallbackFree(this.vtbl.put_href)
        CallbackFree(this.vtbl.get_href)
        CallbackFree(this.vtbl.put_target)
        CallbackFree(this.vtbl.get_target)
        CallbackFree(this.vtbl.put_alt)
        CallbackFree(this.vtbl.get_alt)
        CallbackFree(this.vtbl.put_noHref)
        CallbackFree(this.vtbl.get_noHref)
        CallbackFree(this.vtbl.put_host)
        CallbackFree(this.vtbl.get_host)
        CallbackFree(this.vtbl.put_hostname)
        CallbackFree(this.vtbl.get_hostname)
        CallbackFree(this.vtbl.put_pathname)
        CallbackFree(this.vtbl.get_pathname)
        CallbackFree(this.vtbl.put_port)
        CallbackFree(this.vtbl.get_port)
        CallbackFree(this.vtbl.put_protocol)
        CallbackFree(this.vtbl.get_protocol)
        CallbackFree(this.vtbl.put_search)
        CallbackFree(this.vtbl.get_search)
        CallbackFree(this.vtbl.put_hash)
        CallbackFree(this.vtbl.get_hash)
        CallbackFree(this.vtbl.put_onblur)
        CallbackFree(this.vtbl.get_onblur)
        CallbackFree(this.vtbl.put_onfocus)
        CallbackFree(this.vtbl.get_onfocus)
        CallbackFree(this.vtbl.put_tabIndex)
        CallbackFree(this.vtbl.get_tabIndex)
        CallbackFree(this.vtbl.focus)
        CallbackFree(this.vtbl.blur)
    }
}
