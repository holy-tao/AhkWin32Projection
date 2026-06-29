#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLFrameSetElement3 extends IDispatch {
    /**
     * The interface identifier for IHTMLFrameSetElement3
     * @type {Guid}
     */
    static IID := Guid("{30510796-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLFrameSetElement3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_onhashchange : IntPtr
        get_onhashchange : IntPtr
        put_onmessage    : IntPtr
        get_onmessage    : IntPtr
        put_onoffline    : IntPtr
        get_onoffline    : IntPtr
        put_ononline     : IntPtr
        get_ononline     : IntPtr
        put_onstorage    : IntPtr
        get_onstorage    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLFrameSetElement3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    onhashchange {
        get => this.get_onhashchange()
        set => this.put_onhashchange(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmessage {
        get => this.get_onmessage()
        set => this.put_onmessage(value)
    }

    /**
     * @type {VARIANT} 
     */
    onoffline {
        get => this.get_onoffline()
        set => this.put_onoffline(value)
    }

    /**
     * @type {VARIANT} 
     */
    ononline {
        get => this.get_ononline()
        set => this.put_ononline(value)
    }

    /**
     * @type {VARIANT} 
     */
    onstorage {
        get => this.get_onstorage()
        set => this.put_onstorage(value)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onhashchange(v) {
        result := ComCall(7, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onhashchange() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmessage(v) {
        result := ComCall(9, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmessage() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onoffline(v) {
        result := ComCall(11, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onoffline() {
        p := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ononline(v) {
        result := ComCall(13, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ononline() {
        p := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onstorage(v) {
        result := ComCall(15, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onstorage() {
        p := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLFrameSetElement3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_onhashchange := CallbackCreate(GetMethod(implObj, "put_onhashchange"), flags, 2)
        this.vtbl.get_onhashchange := CallbackCreate(GetMethod(implObj, "get_onhashchange"), flags, 2)
        this.vtbl.put_onmessage := CallbackCreate(GetMethod(implObj, "put_onmessage"), flags, 2)
        this.vtbl.get_onmessage := CallbackCreate(GetMethod(implObj, "get_onmessage"), flags, 2)
        this.vtbl.put_onoffline := CallbackCreate(GetMethod(implObj, "put_onoffline"), flags, 2)
        this.vtbl.get_onoffline := CallbackCreate(GetMethod(implObj, "get_onoffline"), flags, 2)
        this.vtbl.put_ononline := CallbackCreate(GetMethod(implObj, "put_ononline"), flags, 2)
        this.vtbl.get_ononline := CallbackCreate(GetMethod(implObj, "get_ononline"), flags, 2)
        this.vtbl.put_onstorage := CallbackCreate(GetMethod(implObj, "put_onstorage"), flags, 2)
        this.vtbl.get_onstorage := CallbackCreate(GetMethod(implObj, "get_onstorage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_onhashchange)
        CallbackFree(this.vtbl.get_onhashchange)
        CallbackFree(this.vtbl.put_onmessage)
        CallbackFree(this.vtbl.get_onmessage)
        CallbackFree(this.vtbl.put_onoffline)
        CallbackFree(this.vtbl.get_onoffline)
        CallbackFree(this.vtbl.put_ononline)
        CallbackFree(this.vtbl.get_ononline)
        CallbackFree(this.vtbl.put_onstorage)
        CallbackFree(this.vtbl.get_onstorage)
    }
}
