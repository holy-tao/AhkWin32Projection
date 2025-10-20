#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Accesses general settings for the user.
 * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nn-wpcapi-iwpcsettings
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class IWPCSettings extends IUnknown{
    /**
     * The interface identifier for IWPCSettings
     * @type {Guid}
     */
    static IID => Guid("{8fdf6ca1-0189-47e4-b670-1a8a4636e340}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pfRequired 
     * @returns {HRESULT} 
     */
    IsLoggingRequired(pfRequired) {
        result := ComCall(3, this, "ptr", pfRequired, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pTime 
     * @returns {HRESULT} 
     */
    GetLastSettingsChangeTime(pTime) {
        result := ComCall(4, this, "ptr", pTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pdwRestrictions 
     * @returns {HRESULT} 
     */
    GetRestrictions(pdwRestrictions) {
        result := ComCall(5, this, "int*", pdwRestrictions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
