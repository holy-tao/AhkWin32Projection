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
     * 
     * @param {Integer} dwAdd 
     * @param {Integer} dwRemove 
     * @returns {HRESULT} 
     */
    SetExecutionState(dwAdd, dwRemove) {
        result := ComCall(3, this, "uint", dwAdd, "uint", dwRemove, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    ResetIdleTimer(dwFlags) {
        result := ComCall(4, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
