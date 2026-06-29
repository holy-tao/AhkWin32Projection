#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLLocation extends IDispatch {
    /**
     * The interface identifier for IHTMLLocation
     * @type {Guid}
     */
    static IID := Guid("{163bb1e0-6e00-11cf-837a-48dc04c10000}")

    /**
     * The class identifier for HTMLLocation
     * @type {Guid}
     */
    static CLSID := Guid("{163bb1e1-6e00-11cf-837a-48dc04c10000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLLocation interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_href     : IntPtr
        get_href     : IntPtr
        put_protocol : IntPtr
        get_protocol : IntPtr
        put_host     : IntPtr
        get_host     : IntPtr
        put_hostname : IntPtr
        get_hostname : IntPtr
        put_port     : IntPtr
        get_port     : IntPtr
        put_pathname : IntPtr
        get_pathname : IntPtr
        put_search   : IntPtr
        get_search   : IntPtr
        put_hash     : IntPtr
        get_hash     : IntPtr
        reload       : IntPtr
        replace      : IntPtr
        assign       : IntPtr
        toString     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLLocation.Vtbl()
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
    protocol {
        get => this.get_protocol()
        set => this.put_protocol(value)
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
    port {
        get => this.get_port()
        set => this.put_port(value)
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
    put_protocol(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_protocol() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_host(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_host() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_hostname(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_hostname() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_port(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_port() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_pathname(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pathname() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_search(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_search() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_hash(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_hash() {
        p := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} flag 
     * @returns {HRESULT} 
     */
    reload(flag) {
        result := ComCall(23, this, VARIANT_BOOL, flag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _bstr 
     * @returns {HRESULT} 
     */
    replace(_bstr) {
        _bstr := _bstr is String ? BSTR.Alloc(_bstr).Value : _bstr

        result := ComCall(24, this, BSTR, _bstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _bstr 
     * @returns {HRESULT} 
     */
    assign(_bstr) {
        _bstr := _bstr is String ? BSTR.Alloc(_bstr).Value : _bstr

        result := ComCall(25, this, BSTR, _bstr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        _string := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, _string, "HRESULT")
        return _string
    }

    Query(iid) {
        if (IHTMLLocation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_href := CallbackCreate(GetMethod(implObj, "put_href"), flags, 2)
        this.vtbl.get_href := CallbackCreate(GetMethod(implObj, "get_href"), flags, 2)
        this.vtbl.put_protocol := CallbackCreate(GetMethod(implObj, "put_protocol"), flags, 2)
        this.vtbl.get_protocol := CallbackCreate(GetMethod(implObj, "get_protocol"), flags, 2)
        this.vtbl.put_host := CallbackCreate(GetMethod(implObj, "put_host"), flags, 2)
        this.vtbl.get_host := CallbackCreate(GetMethod(implObj, "get_host"), flags, 2)
        this.vtbl.put_hostname := CallbackCreate(GetMethod(implObj, "put_hostname"), flags, 2)
        this.vtbl.get_hostname := CallbackCreate(GetMethod(implObj, "get_hostname"), flags, 2)
        this.vtbl.put_port := CallbackCreate(GetMethod(implObj, "put_port"), flags, 2)
        this.vtbl.get_port := CallbackCreate(GetMethod(implObj, "get_port"), flags, 2)
        this.vtbl.put_pathname := CallbackCreate(GetMethod(implObj, "put_pathname"), flags, 2)
        this.vtbl.get_pathname := CallbackCreate(GetMethod(implObj, "get_pathname"), flags, 2)
        this.vtbl.put_search := CallbackCreate(GetMethod(implObj, "put_search"), flags, 2)
        this.vtbl.get_search := CallbackCreate(GetMethod(implObj, "get_search"), flags, 2)
        this.vtbl.put_hash := CallbackCreate(GetMethod(implObj, "put_hash"), flags, 2)
        this.vtbl.get_hash := CallbackCreate(GetMethod(implObj, "get_hash"), flags, 2)
        this.vtbl.reload := CallbackCreate(GetMethod(implObj, "reload"), flags, 2)
        this.vtbl.replace := CallbackCreate(GetMethod(implObj, "replace"), flags, 2)
        this.vtbl.assign := CallbackCreate(GetMethod(implObj, "assign"), flags, 2)
        this.vtbl.toString := CallbackCreate(GetMethod(implObj, "toString"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_href)
        CallbackFree(this.vtbl.get_href)
        CallbackFree(this.vtbl.put_protocol)
        CallbackFree(this.vtbl.get_protocol)
        CallbackFree(this.vtbl.put_host)
        CallbackFree(this.vtbl.get_host)
        CallbackFree(this.vtbl.put_hostname)
        CallbackFree(this.vtbl.get_hostname)
        CallbackFree(this.vtbl.put_port)
        CallbackFree(this.vtbl.get_port)
        CallbackFree(this.vtbl.put_pathname)
        CallbackFree(this.vtbl.get_pathname)
        CallbackFree(this.vtbl.put_search)
        CallbackFree(this.vtbl.get_search)
        CallbackFree(this.vtbl.put_hash)
        CallbackFree(this.vtbl.get_hash)
        CallbackFree(this.vtbl.reload)
        CallbackFree(this.vtbl.replace)
        CallbackFree(this.vtbl.assign)
        CallbackFree(this.vtbl.toString)
    }
}
