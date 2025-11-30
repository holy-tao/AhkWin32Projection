#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.DeveloperLicensing
 * @version v4.0.30319
 */
class DeveloperLicensing {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Checks to see if a developer license exists.
     * @param {Pointer<FILETIME>} pExpiration Indicates when the developer license expires.
     * @returns {HRESULT} Returns an <a href="/uwp/api/windows.foundation.hresult">HResult structure</a> with any error codes that occurred.
     * @see https://docs.microsoft.com/windows/win32/api//wsdevlicensing/nf-wsdevlicensing-checkdeveloperlicense
     */
    static CheckDeveloperLicense(pExpiration) {
        result := DllCall("WSClient.dll\CheckDeveloperLicense", "ptr", pExpiration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Acquires a developer license.
     * @param {HWND} hwndParent The handler to the parent window.
     * @param {Pointer<FILETIME>} pExpiration Indicates when the developer license expires.
     * @returns {HRESULT} Returns an <a href="/uwp/api/windows.foundation.hresult">HResult structure</a> with any error codes that occurred.
     * @see https://docs.microsoft.com/windows/win32/api//wsdevlicensing/nf-wsdevlicensing-acquiredeveloperlicense
     */
    static AcquireDeveloperLicense(hwndParent, pExpiration) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := DllCall("WSClient.dll\AcquireDeveloperLicense", "ptr", hwndParent, "ptr", pExpiration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes a developer license.
     * @param {HWND} hwndParent The handler to the parent window.
     * @returns {HRESULT} Returns an <a href="/uwp/api/windows.foundation.hresult">HResult structure</a> with any error codes that occurred.
     * @see https://docs.microsoft.com/windows/win32/api//wsdevlicensing/nf-wsdevlicensing-removedeveloperlicense
     */
    static RemoveDeveloperLicense(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := DllCall("WSClient.dll\RemoveDeveloperLicense", "ptr", hwndParent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
