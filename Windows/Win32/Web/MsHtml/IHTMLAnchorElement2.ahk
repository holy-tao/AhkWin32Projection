#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLAnchorElement2 extends IDispatch {
    /**
     * The interface identifier for IHTMLAnchorElement2
     * @type {Guid}
     */
    static IID := Guid("{3050f825-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLAnchorElement2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_charset  : IntPtr
        get_charset  : IntPtr
        put_coords   : IntPtr
        get_coords   : IntPtr
        put_hreflang : IntPtr
        get_hreflang : IntPtr
        put_shape    : IntPtr
        get_shape    : IntPtr
        put_type     : IntPtr
        get_type     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLAnchorElement2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    charset {
        get => this.get_charset()
        set => this.put_charset(value)
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
    hreflang {
        get => this.get_hreflang()
        set => this.put_hreflang(value)
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
    type {
        get => this.get_type()
        set => this.put_type(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_charset(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_charset() {
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
    put_hreflang(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_hreflang() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_shape(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_shape() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_type(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLAnchorElement2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_charset := CallbackCreate(GetMethod(implObj, "put_charset"), flags, 2)
        this.vtbl.get_charset := CallbackCreate(GetMethod(implObj, "get_charset"), flags, 2)
        this.vtbl.put_coords := CallbackCreate(GetMethod(implObj, "put_coords"), flags, 2)
        this.vtbl.get_coords := CallbackCreate(GetMethod(implObj, "get_coords"), flags, 2)
        this.vtbl.put_hreflang := CallbackCreate(GetMethod(implObj, "put_hreflang"), flags, 2)
        this.vtbl.get_hreflang := CallbackCreate(GetMethod(implObj, "get_hreflang"), flags, 2)
        this.vtbl.put_shape := CallbackCreate(GetMethod(implObj, "put_shape"), flags, 2)
        this.vtbl.get_shape := CallbackCreate(GetMethod(implObj, "get_shape"), flags, 2)
        this.vtbl.put_type := CallbackCreate(GetMethod(implObj, "put_type"), flags, 2)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_charset)
        CallbackFree(this.vtbl.get_charset)
        CallbackFree(this.vtbl.put_coords)
        CallbackFree(this.vtbl.get_coords)
        CallbackFree(this.vtbl.put_hreflang)
        CallbackFree(this.vtbl.get_hreflang)
        CallbackFree(this.vtbl.put_shape)
        CallbackFree(this.vtbl.get_shape)
        CallbackFree(this.vtbl.put_type)
        CallbackFree(this.vtbl.get_type)
    }
}
