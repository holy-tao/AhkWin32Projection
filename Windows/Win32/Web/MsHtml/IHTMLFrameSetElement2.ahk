#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLFrameSetElement2 extends IDispatch {
    /**
     * The interface identifier for IHTMLFrameSetElement2
     * @type {Guid}
     */
    static IID := Guid("{3050f5c6-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLFrameSetElement2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_onbeforeprint : IntPtr
        get_onbeforeprint : IntPtr
        put_onafterprint  : IntPtr
        get_onafterprint  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLFrameSetElement2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    onbeforeprint {
        get => this.get_onbeforeprint()
        set => this.put_onbeforeprint(value)
    }

    /**
     * @type {VARIANT} 
     */
    onafterprint {
        get => this.get_onafterprint()
        set => this.put_onafterprint(value)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeprint(v) {
        result := ComCall(7, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeprint() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onafterprint(v) {
        result := ComCall(9, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onafterprint() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLFrameSetElement2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_onbeforeprint := CallbackCreate(GetMethod(implObj, "put_onbeforeprint"), flags, 2)
        this.vtbl.get_onbeforeprint := CallbackCreate(GetMethod(implObj, "get_onbeforeprint"), flags, 2)
        this.vtbl.put_onafterprint := CallbackCreate(GetMethod(implObj, "put_onafterprint"), flags, 2)
        this.vtbl.get_onafterprint := CallbackCreate(GetMethod(implObj, "get_onafterprint"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_onbeforeprint)
        CallbackFree(this.vtbl.get_onbeforeprint)
        CallbackFree(this.vtbl.put_onafterprint)
        CallbackFree(this.vtbl.get_onafterprint)
    }
}
