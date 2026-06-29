#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IHostSemaphore.ahk" { IHostSemaphore }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICLRSyncManager.ahk" { ICLRSyncManager }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IHostAutoEvent.ahk" { IHostAutoEvent }
#Import ".\IHostManualEvent.ahk" { IHostManualEvent }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IHostCrst.ahk" { IHostCrst }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IHostSyncManager extends IUnknown {
    /**
     * The interface identifier for IHostSyncManager
     * @type {Guid}
     */
    static IID := Guid("{234330c7-5f10-4f20-9615-5122dab7a0ac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHostSyncManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetCLRSyncManager       : IntPtr
        CreateCrst              : IntPtr
        CreateCrstWithSpinCount : IntPtr
        CreateAutoEvent         : IntPtr
        CreateManualEvent       : IntPtr
        CreateMonitorEvent      : IntPtr
        CreateRWLockWriterEvent : IntPtr
        CreateRWLockReaderEvent : IntPtr
        CreateSemaphoreA        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHostSyncManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ICLRSyncManager} pManager 
     * @returns {HRESULT} 
     */
    SetCLRSyncManager(pManager) {
        result := ComCall(3, this, "ptr", pManager, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHostCrst} 
     */
    CreateCrst() {
        result := ComCall(4, this, "ptr*", &ppCrst := 0, "HRESULT")
        return IHostCrst(ppCrst)
    }

    /**
     * 
     * @param {Integer} dwSpinCount 
     * @returns {IHostCrst} 
     */
    CreateCrstWithSpinCount(dwSpinCount) {
        result := ComCall(5, this, "uint", dwSpinCount, "ptr*", &ppCrst := 0, "HRESULT")
        return IHostCrst(ppCrst)
    }

    /**
     * 
     * @returns {IHostAutoEvent} 
     */
    CreateAutoEvent() {
        result := ComCall(6, this, "ptr*", &ppEvent := 0, "HRESULT")
        return IHostAutoEvent(ppEvent)
    }

    /**
     * 
     * @param {BOOL} bInitialState 
     * @returns {IHostManualEvent} 
     */
    CreateManualEvent(bInitialState) {
        result := ComCall(7, this, BOOL, bInitialState, "ptr*", &ppEvent := 0, "HRESULT")
        return IHostManualEvent(ppEvent)
    }

    /**
     * 
     * @param {Pointer} Cookie 
     * @returns {IHostAutoEvent} 
     */
    CreateMonitorEvent(Cookie) {
        result := ComCall(8, this, "ptr", Cookie, "ptr*", &ppEvent := 0, "HRESULT")
        return IHostAutoEvent(ppEvent)
    }

    /**
     * 
     * @param {Pointer} Cookie 
     * @returns {IHostAutoEvent} 
     */
    CreateRWLockWriterEvent(Cookie) {
        result := ComCall(9, this, "ptr", Cookie, "ptr*", &ppEvent := 0, "HRESULT")
        return IHostAutoEvent(ppEvent)
    }

    /**
     * 
     * @param {BOOL} bInitialState 
     * @param {Pointer} Cookie 
     * @returns {IHostManualEvent} 
     */
    CreateRWLockReaderEvent(bInitialState, Cookie) {
        result := ComCall(10, this, BOOL, bInitialState, "ptr", Cookie, "ptr*", &ppEvent := 0, "HRESULT")
        return IHostManualEvent(ppEvent)
    }

    /**
     * Creates or opens a named or unnamed semaphore object. (CreateSemaphoreA)
     * @remarks
     * The handle returned by CreateSemaphore has the <b>SEMAPHORE_ALL_ACCESS</b> access right; it can be used in any function that requires a handle to a semaphore object, provided that the caller has been granted access. If a semaphore is created from a service or a thread that is impersonating a different user, you can either apply a security descriptor to the semaphore when you create it, or change the default security descriptor for the creating process by changing its default DACL. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * 
     * The state of a semaphore object is signaled when its count is greater than zero, and nonsignaled when its count is equal to zero. The <i>lInitialCount</i> parameter specifies the initial count. The count can never be less than zero or greater than the value specified in the <i>lMaximumCount</i> parameter.
     * 
     * Any thread of the calling process can specify the semaphore-object handle in a call to one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/wait-functions">wait functions</a>. The single-object wait functions return when the state of the specified object is signaled. The multiple-object wait functions can be instructed to return either when any one or when all of the specified objects are signaled. When a wait function returns, the waiting thread is released to continue its execution. Each time a thread completes a wait for a semaphore object, the count of the semaphore object is decremented by one. When the thread has finished, it calls the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-releasesemaphore">ReleaseSemaphore</a> function, which increments the count of the semaphore object.
     * 
     * Multiple processes can have handles of the same semaphore object, enabling use of the object for interprocess synchronization. The following object-sharing mechanisms are available:
     * 
     * <ul>
     * <li>A child process created by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function can inherit a handle to a semaphore object if the <i>lpSemaphoreAttributes</i> parameter of 
     * CreateSemaphore enabled inheritance.</li>
     * <li>A process can specify the semaphore-object handle in a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-duplicatehandle">DuplicateHandle</a> function to create a duplicate handle that can be used by another process.</li>
     * <li>A process can specify the name of a semaphore object in a call to the 
     * [OpenSemaphore](/windows/win32/api/synchapi/nf-synchapi-opensemaphorew) or CreateSemaphore function.</li>
     * </ul>
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function to close the handle. The system closes the handle automatically when the process terminates. The semaphore object is destroyed when its last handle has been closed.
     * @param {Integer} dwInitial 
     * @param {Integer} dwMax 
     * @returns {IHostSemaphore} 
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createsemaphorea
     */
    CreateSemaphoreA(dwInitial, dwMax) {
        result := ComCall(11, this, "uint", dwInitial, "uint", dwMax, "ptr*", &ppSemaphore := 0, "HRESULT")
        return IHostSemaphore(ppSemaphore)
    }

    Query(iid) {
        if (IHostSyncManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetCLRSyncManager := CallbackCreate(GetMethod(implObj, "SetCLRSyncManager"), flags, 2)
        this.vtbl.CreateCrst := CallbackCreate(GetMethod(implObj, "CreateCrst"), flags, 2)
        this.vtbl.CreateCrstWithSpinCount := CallbackCreate(GetMethod(implObj, "CreateCrstWithSpinCount"), flags, 3)
        this.vtbl.CreateAutoEvent := CallbackCreate(GetMethod(implObj, "CreateAutoEvent"), flags, 2)
        this.vtbl.CreateManualEvent := CallbackCreate(GetMethod(implObj, "CreateManualEvent"), flags, 3)
        this.vtbl.CreateMonitorEvent := CallbackCreate(GetMethod(implObj, "CreateMonitorEvent"), flags, 3)
        this.vtbl.CreateRWLockWriterEvent := CallbackCreate(GetMethod(implObj, "CreateRWLockWriterEvent"), flags, 3)
        this.vtbl.CreateRWLockReaderEvent := CallbackCreate(GetMethod(implObj, "CreateRWLockReaderEvent"), flags, 4)
        this.vtbl.CreateSemaphoreA := CallbackCreate(GetMethod(implObj, "CreateSemaphoreA"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetCLRSyncManager)
        CallbackFree(this.vtbl.CreateCrst)
        CallbackFree(this.vtbl.CreateCrstWithSpinCount)
        CallbackFree(this.vtbl.CreateAutoEvent)
        CallbackFree(this.vtbl.CreateManualEvent)
        CallbackFree(this.vtbl.CreateMonitorEvent)
        CallbackFree(this.vtbl.CreateRWLockWriterEvent)
        CallbackFree(this.vtbl.CreateRWLockReaderEvent)
        CallbackFree(this.vtbl.CreateSemaphoreA)
    }
}
