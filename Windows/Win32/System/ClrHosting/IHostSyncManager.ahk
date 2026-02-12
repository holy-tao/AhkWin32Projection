#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHostCrst.ahk
#Include .\IHostAutoEvent.ahk
#Include .\IHostManualEvent.ahk
#Include .\IHostSemaphore.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostSyncManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostSyncManager
     * @type {Guid}
     */
    static IID => Guid("{234330c7-5f10-4f20-9615-5122dab7a0ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCLRSyncManager", "CreateCrst", "CreateCrstWithSpinCount", "CreateAutoEvent", "CreateManualEvent", "CreateMonitorEvent", "CreateRWLockWriterEvent", "CreateRWLockReaderEvent", "CreateSemaphoreA"]

    /**
     * 
     * @param {ICLRSyncManager} pManager 
     * @returns {HRESULT} 
     */
    SetCLRSyncManager(pManager) {
        result := ComCall(3, this, "ptr", pManager, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IHostCrst} 
     */
    CreateCrst() {
        result := ComCall(4, this, "ptr*", &ppCrst := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHostCrst(ppCrst)
    }

    /**
     * 
     * @param {Integer} dwSpinCount 
     * @returns {IHostCrst} 
     */
    CreateCrstWithSpinCount(dwSpinCount) {
        result := ComCall(5, this, "uint", dwSpinCount, "ptr*", &ppCrst := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHostCrst(ppCrst)
    }

    /**
     * 
     * @returns {IHostAutoEvent} 
     */
    CreateAutoEvent() {
        result := ComCall(6, this, "ptr*", &ppEvent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHostAutoEvent(ppEvent)
    }

    /**
     * 
     * @param {BOOL} bInitialState 
     * @returns {IHostManualEvent} 
     */
    CreateManualEvent(bInitialState) {
        result := ComCall(7, this, "int", bInitialState, "ptr*", &ppEvent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHostManualEvent(ppEvent)
    }

    /**
     * 
     * @param {Pointer} Cookie 
     * @returns {IHostAutoEvent} 
     */
    CreateMonitorEvent(Cookie) {
        result := ComCall(8, this, "ptr", Cookie, "ptr*", &ppEvent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHostAutoEvent(ppEvent)
    }

    /**
     * 
     * @param {Pointer} Cookie 
     * @returns {IHostAutoEvent} 
     */
    CreateRWLockWriterEvent(Cookie) {
        result := ComCall(9, this, "ptr", Cookie, "ptr*", &ppEvent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHostAutoEvent(ppEvent)
    }

    /**
     * 
     * @param {BOOL} bInitialState 
     * @param {Pointer} Cookie 
     * @returns {IHostManualEvent} 
     */
    CreateRWLockReaderEvent(bInitialState, Cookie) {
        result := ComCall(10, this, "int", bInitialState, "ptr", Cookie, "ptr*", &ppEvent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-createsemaphorea
     */
    CreateSemaphoreA(dwInitial, dwMax) {
        result := ComCall(11, this, "uint", dwInitial, "uint", dwMax, "ptr*", &ppSemaphore := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHostSemaphore(ppSemaphore)
    }
}
