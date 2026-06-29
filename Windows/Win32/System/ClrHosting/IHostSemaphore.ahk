#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IHostSemaphore extends IUnknown {
    /**
     * The interface identifier for IHostSemaphore
     * @type {Guid}
     */
    static IID := Guid("{855efd47-cc09-463a-a97d-16acab882661}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHostSemaphore interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Wait             : IntPtr
        ReleaseSemaphore : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHostSemaphore.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwMilliseconds 
     * @param {Integer} option 
     * @returns {HRESULT} 
     */
    Wait(dwMilliseconds, option) {
        result := ComCall(3, this, "uint", dwMilliseconds, "uint", option, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-releasesemaphore
     */
    ReleaseSemaphore(lReleaseCount) {
        result := ComCall(4, this, "int", lReleaseCount, "int*", &lpPreviousCount := 0, "HRESULT")
        return lpPreviousCount
    }

    Query(iid) {
        if (IHostSemaphore.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Wait := CallbackCreate(GetMethod(implObj, "Wait"), flags, 3)
        this.vtbl.ReleaseSemaphore := CallbackCreate(GetMethod(implObj, "ReleaseSemaphore"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Wait)
        CallbackFree(this.vtbl.ReleaseSemaphore)
    }
}
