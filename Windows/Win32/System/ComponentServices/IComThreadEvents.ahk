#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber if a single-threaded apartment (STA) is created or terminated, and when an apartment thread is allocated.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomthreadevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComThreadEvents extends IUnknown {
    /**
     * The interface identifier for IComThreadEvents
     * @type {Guid}
     */
    static IID := Guid("{683130a5-2e50-11d2-98a5-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComThreadEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnThreadStart             : IntPtr
        OnThreadTerminate         : IntPtr
        OnThreadBindToApartment   : IntPtr
        OnThreadUnBind            : IntPtr
        OnThreadWorkEnque         : IntPtr
        OnThreadWorkPrivate       : IntPtr
        OnThreadWorkPublic        : IntPtr
        OnThreadWorkRedirect      : IntPtr
        OnThreadWorkReject        : IntPtr
        OnThreadAssignApartment   : IntPtr
        OnThreadUnassignApartment : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComThreadEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when a single-threaded apartment (STA) thread is started.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} ThreadID The unique thread identifier.
     * @param {Integer} dwThread The Windows thread identifier.
     * @param {Integer} dwTheadCnt The number of threads in the STA thread pool.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomthreadevents-onthreadstart
     */
    OnThreadStart(pInfo, ThreadID, dwThread, dwTheadCnt) {
        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", ThreadID, "uint", dwThread, "uint", dwTheadCnt, "HRESULT")
        return result
    }

    /**
     * Generated when a single-threaded apartment (STA) thread is terminated.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} ThreadID The unique thread identifier.
     * @param {Integer} dwThread The Windows thread identifier.
     * @param {Integer} dwTheadCnt The number of threads in the STA thread pool.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomthreadevents-onthreadterminate
     */
    OnThreadTerminate(pInfo, ThreadID, dwThread, dwTheadCnt) {
        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", ThreadID, "uint", dwThread, "uint", dwTheadCnt, "HRESULT")
        return result
    }

    /**
     * Generated when an apartment thread is allocated for a single-thread apartment (STA) thread that does not have an apartment thread to run in.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} ThreadID The unique thread identifier.
     * @param {Integer} AptID The apartment identifier.
     * @param {Integer} dwActCnt The number of activities bound to this apartment.
     * @param {Integer} dwLowCnt This parameter is reserved.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomthreadevents-onthreadbindtoapartment
     */
    OnThreadBindToApartment(pInfo, ThreadID, AptID, dwActCnt, dwLowCnt) {
        result := ComCall(5, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", ThreadID, "uint", AptID, "uint", dwActCnt, "uint", dwLowCnt, "HRESULT")
        return result
    }

    /**
     * Generated when the lifetime of the configured component is over and the activity count on the apartment thread can be decremented.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} ThreadID The unique thread identifier.
     * @param {Integer} AptID The apartment identifier.
     * @param {Integer} dwActCnt The number of current activities on the apartment thread.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomthreadevents-onthreadunbind
     */
    OnThreadUnBind(pInfo, ThreadID, AptID, dwActCnt) {
        result := ComCall(6, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", ThreadID, "uint", AptID, "uint", dwActCnt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ThreadID 
     * @param {Integer} MsgWorkID 
     * @param {Integer} QueueLen 
     * @returns {HRESULT} 
     */
    OnThreadWorkEnque(pInfo, ThreadID, MsgWorkID, QueueLen) {
        result := ComCall(7, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", ThreadID, "uint", MsgWorkID, "uint", QueueLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ThreadID 
     * @param {Integer} MsgWorkID 
     * @returns {HRESULT} 
     */
    OnThreadWorkPrivate(pInfo, ThreadID, MsgWorkID) {
        result := ComCall(8, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", ThreadID, "uint", MsgWorkID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ThreadID 
     * @param {Integer} MsgWorkID 
     * @param {Integer} QueueLen 
     * @returns {HRESULT} 
     */
    OnThreadWorkPublic(pInfo, ThreadID, MsgWorkID, QueueLen) {
        result := ComCall(9, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", ThreadID, "uint", MsgWorkID, "uint", QueueLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ThreadID 
     * @param {Integer} MsgWorkID 
     * @param {Integer} QueueLen 
     * @param {Integer} ThreadNum 
     * @returns {HRESULT} 
     */
    OnThreadWorkRedirect(pInfo, ThreadID, MsgWorkID, QueueLen, ThreadNum) {
        result := ComCall(10, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", ThreadID, "uint", MsgWorkID, "uint", QueueLen, "uint", ThreadNum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ThreadID 
     * @param {Integer} MsgWorkID 
     * @param {Integer} QueueLen 
     * @returns {HRESULT} 
     */
    OnThreadWorkReject(pInfo, ThreadID, MsgWorkID, QueueLen) {
        result := ComCall(11, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", ThreadID, "uint", MsgWorkID, "uint", QueueLen, "HRESULT")
        return result
    }

    /**
     * Generated when an activity is assigned to an apartment thread.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidActivity The activity identifier for which the object is created.
     * @param {Integer} AptID The apartment identifier.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomthreadevents-onthreadassignapartment
     */
    OnThreadAssignApartment(pInfo, guidActivity, AptID) {
        result := ComCall(12, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidActivity, "uint", AptID, "HRESULT")
        return result
    }

    /**
     * Generated when an activity is unassigned from an apartment thread.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} AptID The apartment identifier.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomthreadevents-onthreadunassignapartment
     */
    OnThreadUnassignApartment(pInfo, AptID) {
        result := ComCall(13, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", AptID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComThreadEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnThreadStart := CallbackCreate(GetMethod(implObj, "OnThreadStart"), flags, 5)
        this.vtbl.OnThreadTerminate := CallbackCreate(GetMethod(implObj, "OnThreadTerminate"), flags, 5)
        this.vtbl.OnThreadBindToApartment := CallbackCreate(GetMethod(implObj, "OnThreadBindToApartment"), flags, 6)
        this.vtbl.OnThreadUnBind := CallbackCreate(GetMethod(implObj, "OnThreadUnBind"), flags, 5)
        this.vtbl.OnThreadWorkEnque := CallbackCreate(GetMethod(implObj, "OnThreadWorkEnque"), flags, 5)
        this.vtbl.OnThreadWorkPrivate := CallbackCreate(GetMethod(implObj, "OnThreadWorkPrivate"), flags, 4)
        this.vtbl.OnThreadWorkPublic := CallbackCreate(GetMethod(implObj, "OnThreadWorkPublic"), flags, 5)
        this.vtbl.OnThreadWorkRedirect := CallbackCreate(GetMethod(implObj, "OnThreadWorkRedirect"), flags, 6)
        this.vtbl.OnThreadWorkReject := CallbackCreate(GetMethod(implObj, "OnThreadWorkReject"), flags, 5)
        this.vtbl.OnThreadAssignApartment := CallbackCreate(GetMethod(implObj, "OnThreadAssignApartment"), flags, 4)
        this.vtbl.OnThreadUnassignApartment := CallbackCreate(GetMethod(implObj, "OnThreadUnassignApartment"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnThreadStart)
        CallbackFree(this.vtbl.OnThreadTerminate)
        CallbackFree(this.vtbl.OnThreadBindToApartment)
        CallbackFree(this.vtbl.OnThreadUnBind)
        CallbackFree(this.vtbl.OnThreadWorkEnque)
        CallbackFree(this.vtbl.OnThreadWorkPrivate)
        CallbackFree(this.vtbl.OnThreadWorkPublic)
        CallbackFree(this.vtbl.OnThreadWorkRedirect)
        CallbackFree(this.vtbl.OnThreadWorkReject)
        CallbackFree(this.vtbl.OnThreadAssignApartment)
        CallbackFree(this.vtbl.OnThreadUnassignApartment)
    }
}
