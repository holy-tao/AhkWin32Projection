#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IStateTriggerBaseProtected extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStateTriggerBaseProtected
     * @type {Guid}
     */
    static IID => Guid("{3c41e253-8d14-4216-994c-f9930429f6e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetActive"]

    /**
     * Sets the active power scheme.
     * @remarks
     * Use this function to make long-term changes to the system configuration. To temporarily keep the system running while an application is performing a task, use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setthreadexecutionstate">SetThreadExecutionState</a> function.
     * 
     * If the power scheme specified by <i>uiID</i> does not exist, the function returns zero.
     * 
     * If <i>lpGlobalPowerPolicy</i> is <b>NULL</b>, the function uses the current global power policy settings set by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-writeglobalpwrpolicy">WriteGlobalPwrPolicy</a>. Otherwise, the settings in the specified structure replace the current global power policy settings.
     * 
     * If <i>lpPowerPolicy</i> is <b>NULL</b>, the function uses the current power policy settings for the power scheme. Otherwise, the settings in the specified structure replace the current power policy settings.
     * 
     * For more information on using PowrProf.h, see <a href="https://docs.microsoft.com/windows/desktop/Power/power-schemes">Power Schemes</a>.
     * @param {Boolean} IsActive 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/powrprof/nf-powrprof-setactivepwrscheme
     */
    SetActive(IsActive) {
        result := ComCall(6, this, "int", IsActive, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
