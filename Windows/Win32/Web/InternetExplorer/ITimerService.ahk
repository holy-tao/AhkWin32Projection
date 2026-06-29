#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITimer.ahk" { ITimer }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct ITimerService extends IUnknown {
    /**
     * The interface identifier for ITimerService
     * @type {Guid}
     */
    static IID := Guid("{3050f35f-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITimerService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateTimer            : IntPtr
        GetNamedTimer          : IntPtr
        SetNamedTimerReference : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITimerService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ITimer} pReferenceTimer 
     * @returns {ITimer} 
     */
    CreateTimer(pReferenceTimer) {
        result := ComCall(3, this, "ptr", pReferenceTimer, "ptr*", &ppNewTimer := 0, "HRESULT")
        return ITimer(ppNewTimer)
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidName 
     * @returns {ITimer} 
     */
    GetNamedTimer(rguidName) {
        result := ComCall(4, this, Guid.Ptr, rguidName, "ptr*", &ppTimer := 0, "HRESULT")
        return ITimer(ppTimer)
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidName 
     * @param {ITimer} pReferenceTimer 
     * @returns {HRESULT} 
     */
    SetNamedTimerReference(rguidName, pReferenceTimer) {
        result := ComCall(5, this, Guid.Ptr, rguidName, "ptr", pReferenceTimer, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITimerService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateTimer := CallbackCreate(GetMethod(implObj, "CreateTimer"), flags, 3)
        this.vtbl.GetNamedTimer := CallbackCreate(GetMethod(implObj, "GetNamedTimer"), flags, 3)
        this.vtbl.SetNamedTimerReference := CallbackCreate(GetMethod(implObj, "SetNamedTimerReference"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateTimer)
        CallbackFree(this.vtbl.GetNamedTimer)
        CallbackFree(this.vtbl.SetNamedTimerReference)
    }
}
