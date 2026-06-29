#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IConsolePower interface controls the execution state and idle timers on operating systems that support power management.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iconsolepower
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IConsolePower extends IUnknown {
    /**
     * The interface identifier for IConsolePower
     * @type {Guid}
     */
    static IID := Guid("{1cfbdd0e-62ca-49ce-a3af-dbb2de61b068}")

    /**
     * The class identifier for ConsolePower
     * @type {Guid}
     */
    static CLSID := Guid("{f0285374-dff1-11d3-b433-00c04f8ecd78}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IConsolePower interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetExecutionState : IntPtr
        ResetIdleTimer    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IConsolePower.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetExecutionState method sets the execution state for the current thread.
     * @remarks
     * Call <b>IConsolePower::SetExecutionState</b> instead of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setthreadexecutionstate">SetThreadExecutionState</a>. Snap-ins must not call the <b>SetThreadExecutionState</b> function directly, doing so causes conflicts if multiple snap-ins are running on the same thread.
     * 
     * A snap-in defines its power requirements and sends them to MMC by calling 
     * <b>SetExecutionState</b>. After the snap-in calls 
     * <b>SetExecutionState</b>, its execution state remains in effect until the snap-in makes another call to 
     * <b>SetExecutionState</b>. Be aware that after <b>SetExecutionState</b> is called, the same instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iconsolepower">IConsolePower</a> interface must be used for subsequent calls to <b>SetExecutionState</b>. If a snap-in does not use the same instance of <b>IConsolePower</b>, then MMC cannot effectively call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setthreadexecutionstate">SetThreadExecutionState</a>. MMC maintains an array to track each snap-in's execution state, and calls <b>SetThreadExecutionState</b> for all snap-ins running on the thread.
     * @param {Integer} dwAdd Flags to add to the snap-in execution state. This can be a combination of 0 or more of the following flags.
     * @param {Integer} dwRemove Flags to remove from the snap-in's execution-state. This can be a combination of 0 or more of the preceding flags. Specifying one or more of the flags enables a snap-in to turn off a power management requirement established by an earlier call to 
     * <b>SetExecutionState</b>.
     * 
     * <div class="alert"><b>Note</b>  A power management requirement must be turned off before it can be turned on. An attempt to turn on a power management requirement without first turning it off returns an error <b>E_INVALIDARG</b>.</div>
     * <div> </div>
     * @returns {HRESULT} If successful, the return value is <b>S_OK</b>. This method will return <b>S_FALSE</b> when invoked on a system that does not support power management. Other return values indicate an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolepower-setexecutionstate
     */
    SetExecutionState(dwAdd, dwRemove) {
        result := ComCall(3, this, "uint", dwAdd, "uint", dwRemove, "HRESULT")
        return result
    }

    /**
     * The ResetIdleTimer method resets the specified power management idle timers.
     * @remarks
     * Call <b>IConsolePower::ResetIdleTimer</b> instead of calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setthreadexecutionstate">SetThreadExecutionState</a>. Snap-ins must not call the <b>SetThreadExecutionState</b> function directly, doing so causes conflicts if multiple snap-ins are running on the same thread. Instead, snap-ins should call 
     * SetExecutionState. Resetting an idle timer causes it to start over in tracking the idle period. If a snap-in does not specify a continuous execution state by calling <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsolepower-setexecutionstate">IConsolePower::SetExecutionState</a>, it can periodically call 
     * ResetIdleTimer to prolong the time before the system or display power-management routines are invoked.
     * @param {Integer} dwFlags The flags used to reset idle timers. One or more of the following flags can be used. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setthreadexecutionstate">SetThreadExecutionState</a>.
     * @returns {HRESULT} If successful, the return value is S_OK. This method will return S_FALSE when invoked on a system that does not support power management. Other return values indicate an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolepower-resetidletimer
     */
    ResetIdleTimer(dwFlags) {
        result := ComCall(4, this, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IConsolePower.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetExecutionState := CallbackCreate(GetMethod(implObj, "SetExecutionState"), flags, 3)
        this.vtbl.ResetIdleTimer := CallbackCreate(GetMethod(implObj, "ResetIdleTimer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetExecutionState)
        CallbackFree(this.vtbl.ResetIdleTimer)
    }
}
