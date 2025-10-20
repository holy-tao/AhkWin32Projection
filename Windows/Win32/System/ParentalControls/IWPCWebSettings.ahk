#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWPCSettings.ahk

/**
 * Accesses web restrictions settings for the user.
 * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nn-wpcapi-iwpcwebsettings
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class IWPCWebSettings extends IWPCSettings{
    /**
     * The interface identifier for IWPCWebSettings
     * @type {Guid}
     */
    static IID => Guid("{ffccbdb8-0992-4c30-b0f1-1cbb09c240aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Pointer<Int32>} pdwSettings 
     * @returns {HRESULT} 
     */
    GetSettings(pdwSettings) {
        result := ComCall(6, this, "int*", pdwSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {PWSTR} pcszURL 
     * @param {Integer} cURLs 
     * @param {Pointer<PWSTR>} ppcszSubURLs 
     * @param {Pointer<BOOL>} pfChanged 
     * @returns {HRESULT} 
     */
    RequestURLOverride(hWnd, pcszURL, cURLs, ppcszSubURLs, pfChanged) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        pcszURL := pcszURL is String ? StrPtr(pcszURL) : pcszURL

        result := ComCall(7, this, "ptr", hWnd, "ptr", pcszURL, "uint", cURLs, "ptr", ppcszSubURLs, "ptr", pfChanged, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
