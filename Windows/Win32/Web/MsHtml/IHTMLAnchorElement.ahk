#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLAnchorElement extends IDispatch {
    /**
     * The interface identifier for IHTMLAnchorElement
     * @type {Guid}
     */
    static IID := Guid("{3050f1da-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLAnchorElement
     * @type {Guid}
     */
    static CLSID := Guid("{3050f248-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLAnchorElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_href         : IntPtr
        get_href         : IntPtr
        put_target       : IntPtr
        get_target       : IntPtr
        put_rel          : IntPtr
        get_rel          : IntPtr
        put_rev          : IntPtr
        get_rev          : IntPtr
        put_urn          : IntPtr
        get_urn          : IntPtr
        put_Methods      : IntPtr
        get_Methods      : IntPtr
        put_name         : IntPtr
        get_name         : IntPtr
        put_host         : IntPtr
        get_host         : IntPtr
        put_hostname     : IntPtr
        get_hostname     : IntPtr
        put_pathname     : IntPtr
        get_pathname     : IntPtr
        put_port         : IntPtr
        get_port         : IntPtr
        put_protocol     : IntPtr
        get_protocol     : IntPtr
        put_search       : IntPtr
        get_search       : IntPtr
        put_hash         : IntPtr
        get_hash         : IntPtr
        put_onblur       : IntPtr
        get_onblur       : IntPtr
        put_onfocus      : IntPtr
        get_onfocus      : IntPtr
        put_accessKey    : IntPtr
        get_accessKey    : IntPtr
        get_protocolLong : IntPtr
        get_mimeType     : IntPtr
        get_nameProp     : IntPtr
        put_tabIndex     : IntPtr
        get_tabIndex     : IntPtr
        focus            : IntPtr
        blur             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLAnchorElement.Vtbl()
        }
        super.__New(implObj, flags)
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
    rel {
        get => this.get_rel()
        set => this.put_rel(value)
    }

    /**
     * @type {BSTR} 
     */
    rev {
        get => this.get_rev()
        set => this.put_rev(value)
    }

    /**
     * @type {BSTR} 
     */
    urn {
        get => this.get_urn()
        set => this.put_urn(value)
    }

    /**
     * @type {BSTR} 
     */
    Methods {
        get => this.get_Methods()
        set => this.put_Methods(value)
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
        set => this.put_name(value)
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
     * @type {BSTR} 
     */
    accessKey {
        get => this.get_accessKey()
        set => this.put_accessKey(value)
    }

    /**
     * @type {BSTR} 
     */
    protocolLong {
        get => this.get_protocolLong()
    }

    /**
     * @type {BSTR} 
     */
    mimeType {
        get => this.get_mimeType()
    }

    /**
     * @type {BSTR} 
     */
    nameProp {
        get => this.get_nameProp()
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
    put_href(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_href() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_target(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_target() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_rel(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rel() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_rev(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rev() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_urn(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_urn() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_Methods(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Methods() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_host(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_host() {
        p := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_hostname(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_hostname() {
        p := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_pathname(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pathname() {
        p := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_port(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(27, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_port() {
        p := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_protocol(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(29, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_protocol() {
        p := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_search(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(31, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_search() {
        p := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_hash(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(33, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_hash() {
        p := BSTR.Owned()
        result := ComCall(34, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onblur(v) {
        result := ComCall(35, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onblur() {
        p := VARIANT()
        result := ComCall(36, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocus(v) {
        result := ComCall(37, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocus() {
        p := VARIANT()
        result := ComCall(38, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_accessKey(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(39, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_accessKey() {
        p := BSTR.Owned()
        result := ComCall(40, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_protocolLong() {
        p := BSTR.Owned()
        result := ComCall(41, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_mimeType() {
        p := BSTR.Owned()
        result := ComCall(42, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_nameProp() {
        p := BSTR.Owned()
        result := ComCall(43, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_tabIndex(v) {
        result := ComCall(44, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_tabIndex() {
        result := ComCall(45, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    focus() {
        result := ComCall(46, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    blur() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLAnchorElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_href := CallbackCreate(GetMethod(implObj, "put_href"), flags, 2)
        this.vtbl.get_href := CallbackCreate(GetMethod(implObj, "get_href"), flags, 2)
        this.vtbl.put_target := CallbackCreate(GetMethod(implObj, "put_target"), flags, 2)
        this.vtbl.get_target := CallbackCreate(GetMethod(implObj, "get_target"), flags, 2)
        this.vtbl.put_rel := CallbackCreate(GetMethod(implObj, "put_rel"), flags, 2)
        this.vtbl.get_rel := CallbackCreate(GetMethod(implObj, "get_rel"), flags, 2)
        this.vtbl.put_rev := CallbackCreate(GetMethod(implObj, "put_rev"), flags, 2)
        this.vtbl.get_rev := CallbackCreate(GetMethod(implObj, "get_rev"), flags, 2)
        this.vtbl.put_urn := CallbackCreate(GetMethod(implObj, "put_urn"), flags, 2)
        this.vtbl.get_urn := CallbackCreate(GetMethod(implObj, "get_urn"), flags, 2)
        this.vtbl.put_Methods := CallbackCreate(GetMethod(implObj, "put_Methods"), flags, 2)
        this.vtbl.get_Methods := CallbackCreate(GetMethod(implObj, "get_Methods"), flags, 2)
        this.vtbl.put_name := CallbackCreate(GetMethod(implObj, "put_name"), flags, 2)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
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
        this.vtbl.put_accessKey := CallbackCreate(GetMethod(implObj, "put_accessKey"), flags, 2)
        this.vtbl.get_accessKey := CallbackCreate(GetMethod(implObj, "get_accessKey"), flags, 2)
        this.vtbl.get_protocolLong := CallbackCreate(GetMethod(implObj, "get_protocolLong"), flags, 2)
        this.vtbl.get_mimeType := CallbackCreate(GetMethod(implObj, "get_mimeType"), flags, 2)
        this.vtbl.get_nameProp := CallbackCreate(GetMethod(implObj, "get_nameProp"), flags, 2)
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
        CallbackFree(this.vtbl.put_href)
        CallbackFree(this.vtbl.get_href)
        CallbackFree(this.vtbl.put_target)
        CallbackFree(this.vtbl.get_target)
        CallbackFree(this.vtbl.put_rel)
        CallbackFree(this.vtbl.get_rel)
        CallbackFree(this.vtbl.put_rev)
        CallbackFree(this.vtbl.get_rev)
        CallbackFree(this.vtbl.put_urn)
        CallbackFree(this.vtbl.get_urn)
        CallbackFree(this.vtbl.put_Methods)
        CallbackFree(this.vtbl.get_Methods)
        CallbackFree(this.vtbl.put_name)
        CallbackFree(this.vtbl.get_name)
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
        CallbackFree(this.vtbl.put_accessKey)
        CallbackFree(this.vtbl.get_accessKey)
        CallbackFree(this.vtbl.get_protocolLong)
        CallbackFree(this.vtbl.get_mimeType)
        CallbackFree(this.vtbl.get_nameProp)
        CallbackFree(this.vtbl.put_tabIndex)
        CallbackFree(this.vtbl.get_tabIndex)
        CallbackFree(this.vtbl.focus)
        CallbackFree(this.vtbl.blur)
    }
}
