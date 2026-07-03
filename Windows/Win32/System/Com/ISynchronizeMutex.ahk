#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISynchronize.ahk" { ISynchronize }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct ISynchronizeMutex extends ISynchronize {
    /**
     * The interface identifier for ISynchronizeMutex
     * @type {Guid}
     */
    static IID := Guid("{00000025-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISynchronizeMutex interfaces
    */
    struct Vtbl extends ISynchronize.Vtbl {
        ReleaseMutex : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISynchronizeMutex.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-releasemutex
     */
    ReleaseMutex() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISynchronizeMutex.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReleaseMutex := CallbackCreate(GetMethod(implObj, "ReleaseMutex"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReleaseMutex)
    }
}
