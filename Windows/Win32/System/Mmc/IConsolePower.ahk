#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IConsolePower interface controls the execution state and idle timers on operating systems that support power management.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iconsolepower
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IConsolePower extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConsolePower
     * @type {Guid}
     */
    static IID => Guid("{1cfbdd0e-62ca-49ce-a3af-dbb2de61b068}")

    /**
     * The class identifier for ConsolePower
     * @type {Guid}
     */
    static CLSID => Guid("{f0285374-dff1-11d3-b433-00c04f8ecd78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetExecutionState", "ResetIdleTimer"]

    /**
     * The SetExecutionState method sets the execution state for the current thread.
     * @param {Integer} dwAdd Flags to add to the snap-in execution state. This can be a combination of 0 or more of the following flags.
     * @param {Integer} dwRemove Flags to remove from the snap-in's execution-state. This can be a combination of 0 or more of the preceding flags. Specifying one or more of the flags enables a snap-in to turn off a power management requirement established by an earlier call to 
     * <b>SetExecutionState</b>.
     * 
     * <div class="alert"><b>Note</b>  A power management requirement must be turned off before it can be turned on. An attempt to turn on a power management requirement without first turning it off returns an error <b>E_INVALIDARG</b>.</div>
     * <div> </div>
     * @returns {HRESULT} If successful, the return value is <b>S_OK</b>. This method will return <b>S_FALSE</b> when invoked on a system that does not support power management. Other return values indicate an error code.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsolepower-setexecutionstate
     */
    SetExecutionState(dwAdd, dwRemove) {
        result := ComCall(3, this, "uint", dwAdd, "uint", dwRemove, "HRESULT")
        return result
    }

    /**
     * The ResetIdleTimer method resets the specified power management idle timers.
     * @param {Integer} dwFlags The flags used to reset idle timers. One or more of the following flags can be used. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setthreadexecutionstate">SetThreadExecutionState</a>.
     * @returns {HRESULT} If successful, the return value is S_OK. This method will return S_FALSE when invoked on a system that does not support power management. Other return values indicate an error code.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsolepower-resetidletimer
     */
    ResetIdleTimer(dwFlags) {
        result := ComCall(4, this, "uint", dwFlags, "HRESULT")
        return result
    }
}
