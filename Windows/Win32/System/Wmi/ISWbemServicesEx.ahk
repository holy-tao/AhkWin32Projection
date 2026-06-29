#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISWbemObjectPath.ahk" { ISWbemObjectPath }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISWbemObjectEx.ahk" { ISWbemObjectEx }
#Import ".\ISWbemServices.ahk" { ISWbemServices }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISWbemSink.ahk" { ISWbemSink }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemServicesEx extends ISWbemServices {
    /**
     * The interface identifier for ISWbemServicesEx
     * @type {Guid}
     */
    static IID := Guid("{d2f68443-85dc-427e-91d8-366554cc754c}")

    /**
     * The class identifier for SWbemServicesEx
     * @type {Guid}
     */
    static CLSID := Guid("{62e522dc-8cf3-40a8-8b2e-37d595651e40}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemServicesEx interfaces
    */
    struct Vtbl extends ISWbemServices.Vtbl {
        Put      : IntPtr
        PutAsync : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemServicesEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ISWbemObjectEx} objWbemObject 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObjectPath} 
     */
    Put(objWbemObject, iFlags, objWbemNamedValueSet) {
        result := ComCall(26, this, "ptr", objWbemObject, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectPath := 0, "HRESULT")
        return ISWbemObjectPath(objWbemObjectPath)
    }

    /**
     * 
     * @param {ISWbemSink} objWbemSink 
     * @param {ISWbemObjectEx} objWbemObject 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    PutAsync(objWbemSink, objWbemObject, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        result := ComCall(27, this, "ptr", objWbemSink, "ptr", objWbemObject, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISWbemServicesEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Put := CallbackCreate(GetMethod(implObj, "Put"), flags, 5)
        this.vtbl.PutAsync := CallbackCreate(GetMethod(implObj, "PutAsync"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Put)
        CallbackFree(this.vtbl.PutAsync)
    }
}
