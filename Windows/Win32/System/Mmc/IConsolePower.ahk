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
     * 
     * @param {Integer} dwAdd 
     * @param {Integer} dwRemove 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolepower-setexecutionstate
     */
    SetExecutionState(dwAdd, dwRemove) {
        result := ComCall(3, this, "uint", dwAdd, "uint", dwRemove, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolepower-resetidletimer
     */
    ResetIdleTimer(dwFlags) {
        result := ComCall(4, this, "uint", dwFlags, "HRESULT")
        return result
    }
}
