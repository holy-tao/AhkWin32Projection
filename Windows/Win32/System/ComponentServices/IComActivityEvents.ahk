#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber if an activity is created, destroyed, or timed out.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomactivityevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComActivityEvents extends IUnknown {
    /**
     * The interface identifier for IComActivityEvents
     * @type {Guid}
     */
    static IID := Guid("{683130b0-2e50-11d2-98a5-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComActivityEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnActivityCreate    : IntPtr
        OnActivityDestroy   : IntPtr
        OnActivityEnter     : IntPtr
        OnActivityTimeout   : IntPtr
        OnActivityReenter   : IntPtr
        OnActivityLeave     : IntPtr
        OnActivityLeaveSame : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComActivityEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when an activity starts.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidActivity The GUID associated with the current activity.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomactivityevents-onactivitycreate
     */
    OnActivityCreate(pInfo, guidActivity) {
        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidActivity, "HRESULT")
        return result
    }

    /**
     * Generated when an activity is finished.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidActivity The GUID associated with the current activity.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomactivityevents-onactivitydestroy
     */
    OnActivityDestroy(pInfo, guidActivity) {
        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidActivity, "HRESULT")
        return result
    }

    /**
     * Generated when an activity thread is entered.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidCurrent The GUID associated with the caller.
     * @param {Pointer<Guid>} guidEntered The GUID associated with the activity thread entered.
     * @param {Integer} dwThread The identifier of the activity thread.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomactivityevents-onactivityenter
     */
    OnActivityEnter(pInfo, guidCurrent, guidEntered, dwThread) {
        result := ComCall(5, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidCurrent, Guid.Ptr, guidEntered, "uint", dwThread, "HRESULT")
        return result
    }

    /**
     * Generated when a call into an activity times out.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidCurrent The GUID associated with the current activity.
     * @param {Pointer<Guid>} guidEntered The causality identifier for the caller.
     * @param {Integer} dwThread The identifier of the  thread executing the call.
     * @param {Integer} dwTimeout The time-out period.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomactivityevents-onactivitytimeout
     */
    OnActivityTimeout(pInfo, guidCurrent, guidEntered, dwThread, dwTimeout) {
        result := ComCall(6, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidCurrent, Guid.Ptr, guidEntered, "uint", dwThread, "uint", dwTimeout, "HRESULT")
        return result
    }

    /**
     * Generated when an activity thread is reentered recursively.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidCurrent The GUID associated with the caller.
     * @param {Integer} dwThread The identifier of the activity thread.
     * @param {Integer} dwCallDepth The recursion depth.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomactivityevents-onactivityreenter
     */
    OnActivityReenter(pInfo, guidCurrent, dwThread, dwCallDepth) {
        result := ComCall(7, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidCurrent, "uint", dwThread, "uint", dwCallDepth, "HRESULT")
        return result
    }

    /**
     * Generated when an activity thread is left.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidCurrent The GUID associated with the caller.
     * @param {Pointer<Guid>} guidLeft The GUID associated with the activity thread left.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomactivityevents-onactivityleave
     */
    OnActivityLeave(pInfo, guidCurrent, guidLeft) {
        result := ComCall(8, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidCurrent, Guid.Ptr, guidLeft, "HRESULT")
        return result
    }

    /**
     * Generated when an activity thread is left after being entered recursively.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidCurrent The GUID associated with the caller.
     * @param {Integer} dwCallDepth The recursion depth.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomactivityevents-onactivityleavesame
     */
    OnActivityLeaveSame(pInfo, guidCurrent, dwCallDepth) {
        result := ComCall(9, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidCurrent, "uint", dwCallDepth, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComActivityEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnActivityCreate := CallbackCreate(GetMethod(implObj, "OnActivityCreate"), flags, 3)
        this.vtbl.OnActivityDestroy := CallbackCreate(GetMethod(implObj, "OnActivityDestroy"), flags, 3)
        this.vtbl.OnActivityEnter := CallbackCreate(GetMethod(implObj, "OnActivityEnter"), flags, 5)
        this.vtbl.OnActivityTimeout := CallbackCreate(GetMethod(implObj, "OnActivityTimeout"), flags, 6)
        this.vtbl.OnActivityReenter := CallbackCreate(GetMethod(implObj, "OnActivityReenter"), flags, 5)
        this.vtbl.OnActivityLeave := CallbackCreate(GetMethod(implObj, "OnActivityLeave"), flags, 4)
        this.vtbl.OnActivityLeaveSame := CallbackCreate(GetMethod(implObj, "OnActivityLeaveSame"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnActivityCreate)
        CallbackFree(this.vtbl.OnActivityDestroy)
        CallbackFree(this.vtbl.OnActivityEnter)
        CallbackFree(this.vtbl.OnActivityTimeout)
        CallbackFree(this.vtbl.OnActivityReenter)
        CallbackFree(this.vtbl.OnActivityLeave)
        CallbackFree(this.vtbl.OnActivityLeaveSame)
    }
}
