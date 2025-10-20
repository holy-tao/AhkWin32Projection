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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSettings", "RequestURLOverride"]

    /**
     * 
     * @param {Pointer<Integer>} pdwSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcwebsettings-getsettings
     */
    GetSettings(pdwSettings) {
        result := ComCall(6, this, "int*", pdwSettings, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcwebsettings-requesturloverride
     */
    RequestURLOverride(hWnd, pcszURL, cURLs, ppcszSubURLs, pfChanged) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        pcszURL := pcszURL is String ? StrPtr(pcszURL) : pcszURL

        result := ComCall(7, this, "ptr", hWnd, "ptr", pcszURL, "uint", cURLs, "ptr", ppcszSubURLs, "ptr", pfChanged, "HRESULT")
        return result
    }
}
