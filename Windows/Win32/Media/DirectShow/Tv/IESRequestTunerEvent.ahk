#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IESEvent.ahk" { IESEvent }

/**
 * Contains methods that enable a Protected Broadcast Driver Architecture (PBDA)-supported device to get exclusive access to a tuner and its Conditional Access Services (CAS).
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESRequestTunerEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-iesrequesttunerevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IESRequestTunerEvent extends IESEvent {
    /**
     * The interface identifier for IESRequestTunerEvent
     * @type {Guid}
     */
    static IID := Guid("{54c7a5e8-c3bb-4f51-af14-e0e2c0e34c6d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IESRequestTunerEvent interfaces
    */
    struct Vtbl extends IESEvent.Vtbl {
        GetPriority      : IntPtr
        GetReason        : IntPtr
        GetConsequences  : IntPtr
        GetEstimatedTime : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IESRequestTunerEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a code that indicates the priority of a device request for exclusive access to a tuner and its Conditional Access Services (CAS).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesrequesttunerevent-getpriority
     */
    GetPriority() {
        result := ComCall(8, this, "char*", &pbyPriority := 0, "HRESULT")
        return pbyPriority
    }

    /**
     * Gets a code that indicates the reason a device is requesting exclusive access to a tuner and its Conditional Access Services (CAS).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesrequesttunerevent-getreason
     */
    GetReason() {
        result := ComCall(9, this, "char*", &pbyReason := 0, "HRESULT")
        return pbyReason
    }

    /**
     * Gets a code that indicates the consequences of a device request for exclusive access to a tuner and its Conditional Access Services (CAS).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesrequesttunerevent-getconsequences
     */
    GetConsequences() {
        result := ComCall(10, this, "char*", &pbyConsequences := 0, "HRESULT")
        return pbyConsequences
    }

    /**
     * Gets a value indicating the amount of time that a device estimates it needs exclusive access to a tuner and its Conditional Access Services (CAS).
     * @returns {Integer} Gets the estimated time that exclusive access is needed, in seconds.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesrequesttunerevent-getestimatedtime
     */
    GetEstimatedTime() {
        result := ComCall(11, this, "uint*", &pdwEstimatedTime := 0, "HRESULT")
        return pdwEstimatedTime
    }

    Query(iid) {
        if (IESRequestTunerEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPriority := CallbackCreate(GetMethod(implObj, "GetPriority"), flags, 2)
        this.vtbl.GetReason := CallbackCreate(GetMethod(implObj, "GetReason"), flags, 2)
        this.vtbl.GetConsequences := CallbackCreate(GetMethod(implObj, "GetConsequences"), flags, 2)
        this.vtbl.GetEstimatedTime := CallbackCreate(GetMethod(implObj, "GetEstimatedTime"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPriority)
        CallbackFree(this.vtbl.GetReason)
        CallbackFree(this.vtbl.GetConsequences)
        CallbackFree(this.vtbl.GetEstimatedTime)
    }
}
