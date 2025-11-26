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
     * Retrieves the web restrictions settings.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nf-wpcapi-iwpcwebsettings-getsettings
     */
    GetSettings() {
        result := ComCall(6, this, "int*", &pdwSettings := 0, "HRESULT")
        return pdwSettings
    }

    /**
     * Requests that the Parental Controls web restrictions subsystem set the specified primary and sub URLs to the allowed state.
     * @param {HWND} hWnd A handle to the parent window. This is  needed for proper User Account Control (UAC) dialog box behavior.
     * @param {PWSTR} pcszURL A pointer to primary URL for override.
     * @param {Integer} cURLs The number of entries in <i>ppcszSubURLs</i>.
     * @param {Pointer<PWSTR>} ppcszSubURLs Pointers to URLs that include pages with the primary URL.
     * @returns {BOOL} Pointer to flag notifying completion of override changed status. This parameter is 1 if the status is changed, and 0 otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nf-wpcapi-iwpcwebsettings-requesturloverride
     */
    RequestURLOverride(hWnd, pcszURL, cURLs, ppcszSubURLs) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        pcszURL := pcszURL is String ? StrPtr(pcszURL) : pcszURL

        ppcszSubURLsMarshal := ppcszSubURLs is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", hWnd, "ptr", pcszURL, "uint", cURLs, ppcszSubURLsMarshal, ppcszSubURLs, "int*", &pfChanged := 0, "HRESULT")
        return pfChanged
    }
}
