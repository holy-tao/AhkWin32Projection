#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLTableCell2 extends IDispatch {
    /**
     * The interface identifier for IHTMLTableCell2
     * @type {Guid}
     */
    static IID := Guid("{3050f82d-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLTableCell2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_abbr    : IntPtr
        get_abbr    : IntPtr
        put_axis    : IntPtr
        get_axis    : IntPtr
        put_ch      : IntPtr
        get_ch      : IntPtr
        put_chOff   : IntPtr
        get_chOff   : IntPtr
        put_headers : IntPtr
        get_headers : IntPtr
        put_scope   : IntPtr
        get_scope   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLTableCell2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    abbr {
        get => this.get_abbr()
        set => this.put_abbr(value)
    }

    /**
     * @type {BSTR} 
     */
    axis {
        get => this.get_axis()
        set => this.put_axis(value)
    }

    /**
     * @type {BSTR} 
     */
    ch {
        get => this.get_ch()
        set => this.put_ch(value)
    }

    /**
     * @type {BSTR} 
     */
    chOff {
        get => this.get_chOff()
        set => this.put_chOff(value)
    }

    /**
     * @type {BSTR} 
     */
    headers {
        get => this.get_headers()
        set => this.put_headers(value)
    }

    /**
     * @type {BSTR} 
     */
    scope {
        get => this.get_scope()
        set => this.put_scope(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_abbr(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_abbr() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_axis(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_axis() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ch(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ch() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_chOff(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_chOff() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_headers(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_headers() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_scope(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_scope() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLTableCell2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_abbr := CallbackCreate(GetMethod(implObj, "put_abbr"), flags, 2)
        this.vtbl.get_abbr := CallbackCreate(GetMethod(implObj, "get_abbr"), flags, 2)
        this.vtbl.put_axis := CallbackCreate(GetMethod(implObj, "put_axis"), flags, 2)
        this.vtbl.get_axis := CallbackCreate(GetMethod(implObj, "get_axis"), flags, 2)
        this.vtbl.put_ch := CallbackCreate(GetMethod(implObj, "put_ch"), flags, 2)
        this.vtbl.get_ch := CallbackCreate(GetMethod(implObj, "get_ch"), flags, 2)
        this.vtbl.put_chOff := CallbackCreate(GetMethod(implObj, "put_chOff"), flags, 2)
        this.vtbl.get_chOff := CallbackCreate(GetMethod(implObj, "get_chOff"), flags, 2)
        this.vtbl.put_headers := CallbackCreate(GetMethod(implObj, "put_headers"), flags, 2)
        this.vtbl.get_headers := CallbackCreate(GetMethod(implObj, "get_headers"), flags, 2)
        this.vtbl.put_scope := CallbackCreate(GetMethod(implObj, "put_scope"), flags, 2)
        this.vtbl.get_scope := CallbackCreate(GetMethod(implObj, "get_scope"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_abbr)
        CallbackFree(this.vtbl.get_abbr)
        CallbackFree(this.vtbl.put_axis)
        CallbackFree(this.vtbl.get_axis)
        CallbackFree(this.vtbl.put_ch)
        CallbackFree(this.vtbl.get_ch)
        CallbackFree(this.vtbl.put_chOff)
        CallbackFree(this.vtbl.get_chOff)
        CallbackFree(this.vtbl.put_headers)
        CallbackFree(this.vtbl.get_headers)
        CallbackFree(this.vtbl.put_scope)
        CallbackFree(this.vtbl.get_scope)
    }
}
