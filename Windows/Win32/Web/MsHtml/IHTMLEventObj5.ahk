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
export default struct IHTMLEventObj5 extends IDispatch {
    /**
     * The interface identifier for IHTMLEventObj5
     * @type {Guid}
     */
    static IID := Guid("{30510478-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLEventObj5 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_url       : IntPtr
        get_url       : IntPtr
        put_data      : IntPtr
        get_data      : IntPtr
        get_source    : IntPtr
        put_origin    : IntPtr
        get_origin    : IntPtr
        put_issession : IntPtr
        get_issession : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLEventObj5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    url {
        get => this.get_url()
        set => this.put_url(value)
    }

    /**
     * @type {BSTR} 
     */
    data {
        get => this.get_data()
        set => this.put_data(value)
    }

    /**
     * @type {IDispatch} 
     */
    source {
        get => this.get_source()
    }

    /**
     * @type {BSTR} 
     */
    origin {
        get => this.get_origin()
        set => this.put_origin(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    issession {
        get => this.get_issession()
        set => this.put_issession(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_url(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_url() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_data(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_data() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_source() {
        result := ComCall(11, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_origin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(12, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_origin() {
        p := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_issession(v) {
        result := ComCall(14, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_issession() {
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLEventObj5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_url := CallbackCreate(GetMethod(implObj, "put_url"), flags, 2)
        this.vtbl.get_url := CallbackCreate(GetMethod(implObj, "get_url"), flags, 2)
        this.vtbl.put_data := CallbackCreate(GetMethod(implObj, "put_data"), flags, 2)
        this.vtbl.get_data := CallbackCreate(GetMethod(implObj, "get_data"), flags, 2)
        this.vtbl.get_source := CallbackCreate(GetMethod(implObj, "get_source"), flags, 2)
        this.vtbl.put_origin := CallbackCreate(GetMethod(implObj, "put_origin"), flags, 2)
        this.vtbl.get_origin := CallbackCreate(GetMethod(implObj, "get_origin"), flags, 2)
        this.vtbl.put_issession := CallbackCreate(GetMethod(implObj, "put_issession"), flags, 2)
        this.vtbl.get_issession := CallbackCreate(GetMethod(implObj, "get_issession"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_url)
        CallbackFree(this.vtbl.get_url)
        CallbackFree(this.vtbl.put_data)
        CallbackFree(this.vtbl.get_data)
        CallbackFree(this.vtbl.get_source)
        CallbackFree(this.vtbl.put_origin)
        CallbackFree(this.vtbl.get_origin)
        CallbackFree(this.vtbl.put_issession)
        CallbackFree(this.vtbl.get_issession)
    }
}
