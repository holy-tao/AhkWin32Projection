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
export default struct IHTMLBodyElement3 extends IDispatch {
    /**
     * The interface identifier for IHTMLBodyElement3
     * @type {Guid}
     */
    static IID := Guid("{30510422-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLBodyElement3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_background   : IntPtr
        get_background   : IntPtr
        put_ononline     : IntPtr
        get_ononline     : IntPtr
        put_onoffline    : IntPtr
        get_onoffline    : IntPtr
        put_onhashchange : IntPtr
        get_onhashchange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLBodyElement3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    background {
        get => this.get_background()
        set => this.put_background(value)
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
    onoffline {
        get => this.get_onoffline()
        set => this.put_onoffline(value)
    }

    /**
     * @type {VARIANT} 
     */
    onhashchange {
        get => this.get_onhashchange()
        set => this.put_onhashchange(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_background(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_background() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ononline(v) {
        result := ComCall(9, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ononline() {
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
    put_onhashchange(v) {
        result := ComCall(13, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onhashchange() {
        p := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLBodyElement3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_background := CallbackCreate(GetMethod(implObj, "put_background"), flags, 2)
        this.vtbl.get_background := CallbackCreate(GetMethod(implObj, "get_background"), flags, 2)
        this.vtbl.put_ononline := CallbackCreate(GetMethod(implObj, "put_ononline"), flags, 2)
        this.vtbl.get_ononline := CallbackCreate(GetMethod(implObj, "get_ononline"), flags, 2)
        this.vtbl.put_onoffline := CallbackCreate(GetMethod(implObj, "put_onoffline"), flags, 2)
        this.vtbl.get_onoffline := CallbackCreate(GetMethod(implObj, "get_onoffline"), flags, 2)
        this.vtbl.put_onhashchange := CallbackCreate(GetMethod(implObj, "put_onhashchange"), flags, 2)
        this.vtbl.get_onhashchange := CallbackCreate(GetMethod(implObj, "get_onhashchange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_background)
        CallbackFree(this.vtbl.get_background)
        CallbackFree(this.vtbl.put_ononline)
        CallbackFree(this.vtbl.get_ononline)
        CallbackFree(this.vtbl.put_onoffline)
        CallbackFree(this.vtbl.get_onoffline)
        CallbackFree(this.vtbl.put_onhashchange)
        CallbackFree(this.vtbl.get_onhashchange)
    }
}
