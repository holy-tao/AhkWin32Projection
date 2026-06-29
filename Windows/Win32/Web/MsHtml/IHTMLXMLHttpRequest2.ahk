#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLXMLHttpRequest2 extends IDispatch {
    /**
     * The interface identifier for IHTMLXMLHttpRequest2
     * @type {Guid}
     */
    static IID := Guid("{30510482-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLXMLHttpRequest2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_timeout   : IntPtr
        get_timeout   : IntPtr
        put_ontimeout : IntPtr
        get_ontimeout : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLXMLHttpRequest2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    timeout {
        get => this.get_timeout()
        set => this.put_timeout(value)
    }

    /**
     * @type {VARIANT} 
     */
    ontimeout {
        get => this.get_ontimeout()
        set => this.put_ontimeout(value)
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_timeout(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_timeout() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ontimeout(v) {
        result := ComCall(9, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ontimeout() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLXMLHttpRequest2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_timeout := CallbackCreate(GetMethod(implObj, "put_timeout"), flags, 2)
        this.vtbl.get_timeout := CallbackCreate(GetMethod(implObj, "get_timeout"), flags, 2)
        this.vtbl.put_ontimeout := CallbackCreate(GetMethod(implObj, "put_ontimeout"), flags, 2)
        this.vtbl.get_ontimeout := CallbackCreate(GetMethod(implObj, "get_ontimeout"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_timeout)
        CallbackFree(this.vtbl.get_timeout)
        CallbackFree(this.vtbl.put_ontimeout)
        CallbackFree(this.vtbl.get_ontimeout)
    }
}
