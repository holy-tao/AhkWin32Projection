#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostSemaphore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostSemaphore
     * @type {Guid}
     */
    static IID => Guid("{855efd47-cc09-463a-a97d-16acab882661}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Wait", "ReleaseSemaphore"]

    /**
     * Waits for an event to occur for a specified communications device. The set of events that are monitored by this function is contained in the event mask associated with the device handle.
     * @remarks
     * The 
     * <b>WaitCommEvent</b> function monitors a set of events for a specified communications resource. To set and query the current event mask of a communications resource, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommmask">SetCommMask</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getcommmask">GetCommMask</a> functions.
     * 
     * If the overlapped operation cannot be completed immediately, the function returns <b>FALSE</b> and the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_IO_PENDING</b>, indicating that the operation is executing in the background. When this happens, the system sets the <b>hEvent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure to the not-signaled state before 
     * <b>WaitCommEvent</b> returns, and then it sets it to the signaled state when one of the specified events or an error occurs. The calling process can use one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/wait-functions">wait functions</a> to determine the event object's state and then use the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> function to determine the results of the 
     * <b>WaitCommEvent</b> operation. 
     * <b>GetOverlappedResult</b> reports the success or failure of the operation, and the variable pointed to by the <i>lpEvtMask</i> parameter is set to indicate the event that occurred.
     * 
     * If a process attempts to change the device handle's event mask by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommmask">SetCommMask</a> function while an overlapped 
     * <b>WaitCommEvent</b> operation is in progress, 
     * <b>WaitCommEvent</b> returns immediately. The variable pointed to by the <i>lpEvtMask</i> parameter is set to zero.
     * @param {Integer} dwMilliseconds 
     * @param {Integer} option 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-waitcommevent
     */
    Wait(dwMilliseconds, option) {
        result := ComCall(3, this, "uint", dwMilliseconds, "uint", option, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Increases the count of the specified semaphore object by a specified amount.
     * @remarks
     * The state of a semaphore object is signaled when its count is greater than zero and nonsignaled when its count is equal to zero. The process that calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createsemaphorea">CreateSemaphore</a> function specifies the semaphore's initial count. Each time a waiting thread is released because of the semaphore's signaled state, the count of the semaphore is decreased by one.
     * 
     * Typically, an application uses a semaphore to limit the number of threads using a resource. Before a thread uses the resource, it specifies the semaphore handle in a call to one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/wait-functions">wait functions</a>. When the wait function returns, it decreases the semaphore's count by one. When the thread has finished using the resource, it calls 
     * <b>ReleaseSemaphore</b> to increase the semaphore's count by one.
     * 
     * Another use of 
     * <b>ReleaseSemaphore</b> is during an application's initialization. The application can create a semaphore with an initial count of zero. This sets the semaphore's state to nonsignaled and blocks all threads from accessing the protected resource. When the application finishes its initialization, it uses 
     * <b>ReleaseSemaphore</b> to increase the count to its maximum value, to permit normal access to the protected resource.
     * 
     * It is not possible to reduce the semaphore object count using 
     * <b>ReleaseSemaphore</b>, because <i>lReleaseCount</i> cannot be a negative number. To temporarily restrict or reduce access, create a loop in which you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-waitforsingleobject">WaitForSingleObject</a> function with a time-out interval of zero until the semaphore count has been reduced sufficiently. (Note that other threads can reduce the count while this loop is being executed.) To restore access, call 
     * <b>ReleaseSemaphore</b> with the release count equal to the number of times 
     * <b>WaitForSingleObject</b> was called in the loop.
     * @param {Integer} lReleaseCount The amount by which the semaphore object's current count is to be increased. The value must be greater than zero. If the specified amount would cause the semaphore's count to exceed the maximum count that was specified when the semaphore was created, the count is not changed and the function returns <b>FALSE</b>.
     * @returns {Integer} A pointer to a variable to receive the previous count for the semaphore. This parameter can be <b>NULL</b> if the previous count is not required.
     * @see https://learn.microsoft.com/windows/win32/api//content/synchapi/nf-synchapi-releasesemaphore
     */
    ReleaseSemaphore(lReleaseCount) {
        result := ComCall(4, this, "int", lReleaseCount, "int*", &lpPreviousCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpPreviousCount
    }
}
