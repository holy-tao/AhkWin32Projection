#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nn-wpcapi-iwindowsparentalcontrolscore
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class IWindowsParentalControlsCore extends IUnknown{
    /**
     * The interface identifier for IWindowsParentalControlsCore
     * @type {Guid}
     */
    static IID => Guid("{4ff40a0f-3f3b-4d7c-a41b-4f39d7b44d05}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} peVisibility 
     * @returns {HRESULT} 
     */
    GetVisibility(peVisibility) {
        result := ComCall(3, this, "int*", peVisibility, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pcszSID 
     * @param {Pointer<IWPCSettings>} ppSettings 
     * @returns {HRESULT} 
     */
    GetUserSettings(pcszSID, ppSettings) {
        pcszSID := pcszSID is String ? StrPtr(pcszSID) : pcszSID

        result := ComCall(4, this, "ptr", pcszSID, "ptr", ppSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pcszSID 
     * @param {Pointer<IWPCWebSettings>} ppSettings 
     * @returns {HRESULT} 
     */
    GetWebSettings(pcszSID, ppSettings) {
        pcszSID := pcszSID is String ? StrPtr(pcszSID) : pcszSID

        result := ComCall(5, this, "ptr", pcszSID, "ptr", ppSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidID 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     */
    GetWebFilterInfo(pguidID, ppszName) {
        result := ComCall(6, this, "ptr", pguidID, "ptr", ppszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
