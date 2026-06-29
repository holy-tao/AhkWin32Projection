#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLBodyElement4 extends IDispatch {
    /**
     * The interface identifier for IHTMLBodyElement4
     * @type {Guid}
     */
    static IID := Guid("{30510795-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLBodyElement4 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_onmessage : IntPtr
        get_onmessage : IntPtr
        put_onstorage : IntPtr
        get_onstorage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLBodyElement4.Vtbl()
        }
        super.__New(implObj, flags)
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
    onstorage {
        get => this.get_onstorage()
        set => this.put_onstorage(value)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmessage(v) {
        result := ComCall(7, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmessage() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onstorage(v) {
        result := ComCall(9, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onstorage() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLBodyElement4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_onmessage := CallbackCreate(GetMethod(implObj, "put_onmessage"), flags, 2)
        this.vtbl.get_onmessage := CallbackCreate(GetMethod(implObj, "get_onmessage"), flags, 2)
        this.vtbl.put_onstorage := CallbackCreate(GetMethod(implObj, "put_onstorage"), flags, 2)
        this.vtbl.get_onstorage := CallbackCreate(GetMethod(implObj, "get_onstorage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_onmessage)
        CallbackFree(this.vtbl.get_onmessage)
        CallbackFree(this.vtbl.put_onstorage)
        CallbackFree(this.vtbl.get_onstorage)
    }
}
