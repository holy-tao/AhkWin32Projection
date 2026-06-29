#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComMtaThreadPoolKnobs extends IUnknown {
    /**
     * The interface identifier for IComMtaThreadPoolKnobs
     * @type {Guid}
     */
    static IID := Guid("{f9a76d2e-76a5-43eb-a0c4-49bec8e48480}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComMtaThreadPoolKnobs interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MTASetMaxThreadCount : IntPtr
        MTAGetMaxThreadCount : IntPtr
        MTASetThrottleValue  : IntPtr
        MTAGetThrottleValue  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComMtaThreadPoolKnobs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwMaxThreads 
     * @returns {HRESULT} 
     */
    MTASetMaxThreadCount(dwMaxThreads) {
        result := ComCall(3, this, "uint", dwMaxThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    MTAGetMaxThreadCount() {
        result := ComCall(4, this, "uint*", &pdwMaxThreads := 0, "HRESULT")
        return pdwMaxThreads
    }

    /**
     * 
     * @param {Integer} dwThrottle 
     * @returns {HRESULT} 
     */
    MTASetThrottleValue(dwThrottle) {
        result := ComCall(5, this, "uint", dwThrottle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    MTAGetThrottleValue() {
        result := ComCall(6, this, "uint*", &pdwThrottle := 0, "HRESULT")
        return pdwThrottle
    }

    Query(iid) {
        if (IComMtaThreadPoolKnobs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MTASetMaxThreadCount := CallbackCreate(GetMethod(implObj, "MTASetMaxThreadCount"), flags, 2)
        this.vtbl.MTAGetMaxThreadCount := CallbackCreate(GetMethod(implObj, "MTAGetMaxThreadCount"), flags, 2)
        this.vtbl.MTASetThrottleValue := CallbackCreate(GetMethod(implObj, "MTASetThrottleValue"), flags, 2)
        this.vtbl.MTAGetThrottleValue := CallbackCreate(GetMethod(implObj, "MTAGetThrottleValue"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MTASetMaxThreadCount)
        CallbackFree(this.vtbl.MTAGetMaxThreadCount)
        CallbackFree(this.vtbl.MTASetThrottleValue)
        CallbackFree(this.vtbl.MTAGetThrottleValue)
    }
}
