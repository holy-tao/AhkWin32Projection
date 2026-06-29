#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMBeforeUnloadEvent extends IDispatch {
    /**
     * The interface identifier for IDOMBeforeUnloadEvent
     * @type {Guid}
     */
    static IID := Guid("{30510763-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMBeforeUnloadEvent
     * @type {Guid}
     */
    static CLSID := Guid("{30510764-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMBeforeUnloadEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_returnValue : IntPtr
        get_returnValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMBeforeUnloadEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    returnValue {
        get => this.get_returnValue()
        set => this.put_returnValue(value)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_returnValue(v) {
        result := ComCall(7, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_returnValue() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IDOMBeforeUnloadEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_returnValue := CallbackCreate(GetMethod(implObj, "put_returnValue"), flags, 2)
        this.vtbl.get_returnValue := CallbackCreate(GetMethod(implObj, "get_returnValue"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_returnValue)
        CallbackFree(this.vtbl.get_returnValue)
    }
}
