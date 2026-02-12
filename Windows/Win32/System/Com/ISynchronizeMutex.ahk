#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISynchronize.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISynchronizeMutex extends ISynchronize{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISynchronizeMutex
     * @type {Guid}
     */
    static IID => Guid("{00000025-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReleaseMutex"]

    /**
     * Releases ownership of the specified mutex object.
     * @remarks
     * The 
     * <b>ReleaseMutex</b> function fails if the calling thread does not own the mutex object.
     * 
     * A thread obtains ownership of a mutex either by creating it with the <i>bInitialOwner</i> parameter set to <b>TRUE</b> or by specifying its handle in a call to one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/wait-functions">wait functions</a>. When the thread no longer needs to own the mutex object, it calls the 
     * <b>ReleaseMutex</b> function so that another thread can acquire ownership.
     * 
     * A thread  can specify a  mutex that it already owns in a call to one of the wait functions without blocking its execution. This prevents a thread from deadlocking itself while waiting for a mutex that it already owns. However, to release its ownership, the thread must call 
     * <b>ReleaseMutex</b> one time for each time that it obtained ownership (either through <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createmutexa">CreateMutex</a> or a wait function).
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/synchapi/nf-synchapi-releasemutex
     */
    ReleaseMutex() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
