#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostCrst extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostCrst
     * @type {Guid}
     */
    static IID => Guid("{6df710a6-26a4-4a65-8cd5-7237b8bda8dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Enter", "Leave", "TryEnter", "SetSpinCount"]

    /**
     * The EnterCriticalPolicySection function pauses the application of policy to allow applications to safely read policy settings.
     * @remarks
     * The maximum amount of time an application can hold a critical section is 10 minutes. After 10 minutes, the system releases the critical section and policy can be applied again.
     * 
     * To acquire both the computer and user critical section objects, acquire the user critical section object before acquiring the computer critical section object. This will help prevent a deadlock situation.
     * 
     * To close the handle, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-leavecriticalpolicysection">LeaveCriticalPolicySection</a> function. The policy section handle cannot be used in any other Windows functions.
     * @param {Integer} option 
     * @returns {HRESULT} If the function succeeds, the return value is a handle to a policy section.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/userenv/nf-userenv-entercriticalpolicysection
     */
    Enter(option) {
        result := ComCall(3, this, "uint", option, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The LeaveCriticalPolicySection function resumes the background application of policy. This function closes the handle to the policy section.
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/userenv/nf-userenv-leavecriticalpolicysection
     */
    Leave() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Attempts to enter a critical section without blocking. If the call is successful, the calling thread takes ownership of the critical section.
     * @remarks
     * The threads of a single process can use a critical section object for mutual-exclusion synchronization. The process is responsible for allocating the memory used by a critical section object, which it can do by declaring a variable of type <b>CRITICAL_SECTION</b>. Before using a critical section, some thread of the process must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-initializecriticalsection">InitializeCriticalSection</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-initializecriticalsectionandspincount">InitializeCriticalSectionAndSpinCount</a> function to initialize the object.
     * 
     * To enable mutually exclusive use of a shared resource, each thread calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-entercriticalsection">EnterCriticalSection</a> or 
     * <b>TryEnterCriticalSection</b> function to request ownership of the critical section before executing any section of code that uses the protected resource. The difference is that 
     * <b>TryEnterCriticalSection</b> returns immediately, regardless of whether it obtained ownership of the critical section, while 
     * <b>EnterCriticalSection</b> blocks until the thread can take ownership of the critical section. When it has finished executing the protected code, the thread uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-leavecriticalsection">LeaveCriticalSection</a> function to relinquish ownership, enabling another thread to become the owner and gain access to the protected resource. The thread must call 
     * <b>LeaveCriticalSection</b> once for each time that it entered the critical section.
     * 
     * Any thread of the process can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-deletecriticalsection">DeleteCriticalSection</a> function to release the system resources that were allocated when the critical section object was initialized. After this function has been called, the critical section object can no longer be used for synchronization.
     * 
     * If a thread terminates while it has ownership of a critical section, the state of the critical section is undefined.
     * 
     * To compile an application that uses this function, define <b>_WIN32_WINNT</b> as 0x0400 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Integer} option 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/synchapi/nf-synchapi-tryentercriticalsection
     */
    TryEnter(option) {
        result := ComCall(5, this, "uint", option, "int*", &pbSucceeded := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbSucceeded
    }

    /**
     * 
     * @param {Integer} dwSpinCount 
     * @returns {HRESULT} 
     */
    SetSpinCount(dwSpinCount) {
        result := ComCall(6, this, "uint", dwSpinCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
