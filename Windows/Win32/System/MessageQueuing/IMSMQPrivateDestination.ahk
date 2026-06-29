#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQPrivateDestination extends IDispatch {
    /**
     * The interface identifier for IMSMQPrivateDestination
     * @type {Guid}
     */
    static IID := Guid("{eba96b17-2168-11d3-898c-00e02c074f6b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQPrivateDestination interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Handle : IntPtr
        put_Handle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQPrivateDestination.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    Handle {
        get => this.get_Handle()
        set => this.put_Handle(value)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Handle() {
        pvarHandle := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, pvarHandle, "HRESULT")
        return pvarHandle
    }

    /**
     * 
     * @param {VARIANT} varHandle 
     * @returns {HRESULT} 
     */
    put_Handle(varHandle) {
        result := ComCall(8, this, VARIANT, varHandle, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSMQPrivateDestination.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Handle := CallbackCreate(GetMethod(implObj, "get_Handle"), flags, 2)
        this.vtbl.put_Handle := CallbackCreate(GetMethod(implObj, "put_Handle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Handle)
        CallbackFree(this.vtbl.put_Handle)
    }
}
