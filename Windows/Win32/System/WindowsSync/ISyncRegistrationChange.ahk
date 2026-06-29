#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SYNC_REGISTRATION_EVENT.ahk" { SYNC_REGISTRATION_EVENT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a change to the registration of a synchronization provider or a synchronization provider configuration UI. The changes are reported as registration events.
 * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nn-syncregistration-isyncregistrationchange
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncRegistrationChange extends IUnknown {
    /**
     * The interface identifier for ISyncRegistrationChange
     * @type {Guid}
     */
    static IID := Guid("{eea0d9ae-6b29-43b4-9e70-e3ae33bb2c3b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncRegistrationChange interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEvent      : IntPtr
        GetInstanceId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncRegistrationChange.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the next pending registration event.
     * @returns {SYNC_REGISTRATION_EVENT} The registration event.
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncregistrationchange-getevent
     */
    GetEvent() {
        result := ComCall(3, this, "int*", &psreEvent := 0, "HRESULT")
        return psreEvent
    }

    /**
     * Gets the instance ID of the synchronization provider or synchronization provider configuration UI associated with the event.
     * @returns {Guid} The instance ID.
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncregistrationchange-getinstanceid
     */
    GetInstanceId() {
        pguidInstanceId := Guid()
        result := ComCall(4, this, Guid.Ptr, pguidInstanceId, "HRESULT")
        return pguidInstanceId
    }

    Query(iid) {
        if (ISyncRegistrationChange.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEvent := CallbackCreate(GetMethod(implObj, "GetEvent"), flags, 2)
        this.vtbl.GetInstanceId := CallbackCreate(GetMethod(implObj, "GetInstanceId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEvent)
        CallbackFree(this.vtbl.GetInstanceId)
    }
}
