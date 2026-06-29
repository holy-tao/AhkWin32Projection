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
export default struct IHTMLObjectElement3 extends IDispatch {
    /**
     * The interface identifier for IHTMLObjectElement3
     * @type {Guid}
     */
    static IID := Guid("{3050f827-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLObjectElement3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_archive : IntPtr
        get_archive : IntPtr
        put_alt     : IntPtr
        get_alt     : IntPtr
        put_declare : IntPtr
        get_declare : IntPtr
        put_standby : IntPtr
        get_standby : IntPtr
        put_border  : IntPtr
        get_border  : IntPtr
        put_useMap  : IntPtr
        get_useMap  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLObjectElement3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    archive {
        get => this.get_archive()
        set => this.put_archive(value)
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
    declare {
        get => this.get_declare()
        set => this.put_declare(value)
    }

    /**
     * @type {BSTR} 
     */
    standby {
        get => this.get_standby()
        set => this.put_standby(value)
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
    useMap {
        get => this.get_useMap()
        set => this.put_useMap(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_archive(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_archive() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_alt(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_alt() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_declare(v) {
        result := ComCall(11, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_declare() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_standby(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_standby() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_border(v) {
        result := ComCall(15, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_border() {
        p := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_useMap(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_useMap() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLObjectElement3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_archive := CallbackCreate(GetMethod(implObj, "put_archive"), flags, 2)
        this.vtbl.get_archive := CallbackCreate(GetMethod(implObj, "get_archive"), flags, 2)
        this.vtbl.put_alt := CallbackCreate(GetMethod(implObj, "put_alt"), flags, 2)
        this.vtbl.get_alt := CallbackCreate(GetMethod(implObj, "get_alt"), flags, 2)
        this.vtbl.put_declare := CallbackCreate(GetMethod(implObj, "put_declare"), flags, 2)
        this.vtbl.get_declare := CallbackCreate(GetMethod(implObj, "get_declare"), flags, 2)
        this.vtbl.put_standby := CallbackCreate(GetMethod(implObj, "put_standby"), flags, 2)
        this.vtbl.get_standby := CallbackCreate(GetMethod(implObj, "get_standby"), flags, 2)
        this.vtbl.put_border := CallbackCreate(GetMethod(implObj, "put_border"), flags, 2)
        this.vtbl.get_border := CallbackCreate(GetMethod(implObj, "get_border"), flags, 2)
        this.vtbl.put_useMap := CallbackCreate(GetMethod(implObj, "put_useMap"), flags, 2)
        this.vtbl.get_useMap := CallbackCreate(GetMethod(implObj, "get_useMap"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_archive)
        CallbackFree(this.vtbl.get_archive)
        CallbackFree(this.vtbl.put_alt)
        CallbackFree(this.vtbl.get_alt)
        CallbackFree(this.vtbl.put_declare)
        CallbackFree(this.vtbl.get_declare)
        CallbackFree(this.vtbl.put_standby)
        CallbackFree(this.vtbl.get_standby)
        CallbackFree(this.vtbl.put_border)
        CallbackFree(this.vtbl.get_border)
        CallbackFree(this.vtbl.put_useMap)
        CallbackFree(this.vtbl.get_useMap)
    }
}
