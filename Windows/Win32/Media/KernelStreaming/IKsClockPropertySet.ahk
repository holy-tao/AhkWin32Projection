#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\KSRESOLUTION.ahk" { KSRESOLUTION }
#Import ".\KSSTATE.ahk" { KSSTATE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\KSCORRELATED_TIME.ahk" { KSCORRELATED_TIME }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsClockPropertySet extends IUnknown {
    /**
     * The interface identifier for IKsClockPropertySet
     * @type {Guid}
     */
    static IID := Guid("{5c5cbd84-e755-11d0-ac18-00a0c9223196}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsClockPropertySet interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        KsGetTime                   : IntPtr
        KsSetTime                   : IntPtr
        KsGetPhysicalTime           : IntPtr
        KsSetPhysicalTime           : IntPtr
        KsGetCorrelatedTime         : IntPtr
        KsSetCorrelatedTime         : IntPtr
        KsGetCorrelatedPhysicalTime : IntPtr
        KsSetCorrelatedPhysicalTime : IntPtr
        KsGetResolution             : IntPtr
        KsGetState                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsClockPropertySet.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    KsGetTime() {
        result := ComCall(3, this, "int64*", &Time := 0, "HRESULT")
        return Time
    }

    /**
     * 
     * @param {Integer} Time 
     * @returns {HRESULT} 
     */
    KsSetTime(Time) {
        result := ComCall(4, this, "int64", Time, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    KsGetPhysicalTime() {
        result := ComCall(5, this, "int64*", &Time := 0, "HRESULT")
        return Time
    }

    /**
     * 
     * @param {Integer} Time 
     * @returns {HRESULT} 
     */
    KsSetPhysicalTime(Time) {
        result := ComCall(6, this, "int64", Time, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {KSCORRELATED_TIME} 
     */
    KsGetCorrelatedTime() {
        CorrelatedTime := KSCORRELATED_TIME()
        result := ComCall(7, this, KSCORRELATED_TIME.Ptr, CorrelatedTime, "HRESULT")
        return CorrelatedTime
    }

    /**
     * 
     * @param {Pointer<KSCORRELATED_TIME>} CorrelatedTime 
     * @returns {HRESULT} 
     */
    KsSetCorrelatedTime(CorrelatedTime) {
        result := ComCall(8, this, KSCORRELATED_TIME.Ptr, CorrelatedTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {KSCORRELATED_TIME} 
     */
    KsGetCorrelatedPhysicalTime() {
        CorrelatedTime := KSCORRELATED_TIME()
        result := ComCall(9, this, KSCORRELATED_TIME.Ptr, CorrelatedTime, "HRESULT")
        return CorrelatedTime
    }

    /**
     * 
     * @param {Pointer<KSCORRELATED_TIME>} CorrelatedTime 
     * @returns {HRESULT} 
     */
    KsSetCorrelatedPhysicalTime(CorrelatedTime) {
        result := ComCall(10, this, KSCORRELATED_TIME.Ptr, CorrelatedTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {KSRESOLUTION} 
     */
    KsGetResolution() {
        Resolution := KSRESOLUTION()
        result := ComCall(11, this, KSRESOLUTION.Ptr, Resolution, "HRESULT")
        return Resolution
    }

    /**
     * 
     * @returns {KSSTATE} 
     */
    KsGetState() {
        result := ComCall(12, this, "int*", &State := 0, "HRESULT")
        return State
    }

    Query(iid) {
        if (IKsClockPropertySet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.KsGetTime := CallbackCreate(GetMethod(implObj, "KsGetTime"), flags, 2)
        this.vtbl.KsSetTime := CallbackCreate(GetMethod(implObj, "KsSetTime"), flags, 2)
        this.vtbl.KsGetPhysicalTime := CallbackCreate(GetMethod(implObj, "KsGetPhysicalTime"), flags, 2)
        this.vtbl.KsSetPhysicalTime := CallbackCreate(GetMethod(implObj, "KsSetPhysicalTime"), flags, 2)
        this.vtbl.KsGetCorrelatedTime := CallbackCreate(GetMethod(implObj, "KsGetCorrelatedTime"), flags, 2)
        this.vtbl.KsSetCorrelatedTime := CallbackCreate(GetMethod(implObj, "KsSetCorrelatedTime"), flags, 2)
        this.vtbl.KsGetCorrelatedPhysicalTime := CallbackCreate(GetMethod(implObj, "KsGetCorrelatedPhysicalTime"), flags, 2)
        this.vtbl.KsSetCorrelatedPhysicalTime := CallbackCreate(GetMethod(implObj, "KsSetCorrelatedPhysicalTime"), flags, 2)
        this.vtbl.KsGetResolution := CallbackCreate(GetMethod(implObj, "KsGetResolution"), flags, 2)
        this.vtbl.KsGetState := CallbackCreate(GetMethod(implObj, "KsGetState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.KsGetTime)
        CallbackFree(this.vtbl.KsSetTime)
        CallbackFree(this.vtbl.KsGetPhysicalTime)
        CallbackFree(this.vtbl.KsSetPhysicalTime)
        CallbackFree(this.vtbl.KsGetCorrelatedTime)
        CallbackFree(this.vtbl.KsSetCorrelatedTime)
        CallbackFree(this.vtbl.KsGetCorrelatedPhysicalTime)
        CallbackFree(this.vtbl.KsSetCorrelatedPhysicalTime)
        CallbackFree(this.vtbl.KsGetResolution)
        CallbackFree(this.vtbl.KsGetState)
    }
}
