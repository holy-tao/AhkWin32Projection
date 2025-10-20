#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class IWindowsLockModeHelper extends IUnknown{
    /**
     * The interface identifier for IWindowsLockModeHelper
     * @type {Guid}
     */
    static IID => Guid("{f342d19e-cc22-4648-bb5d-03ccf75b47c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} isSmode 
     * @returns {HRESULT} 
     */
    GetSMode(isSmode) {
        result := ComCall(3, this, "ptr", isSmode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
