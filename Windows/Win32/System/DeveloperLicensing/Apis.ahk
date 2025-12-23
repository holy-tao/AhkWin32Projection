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
     * @remarks
     * The following is a list of common error codes that this function returns:
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The function succeeded.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>One or more arguments are invalid.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Insufficient memory.</td>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</td>
     * <td>The license was not found.</td>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_NOT_AUTHENTICATED)</td>
     * <td>The call requires authentication.</td>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_NETWORK_UNREACHABLE)</td>
     * <td>The network can’t be reached.</td>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_ACCESS_DENIED)</td>
     * <td>The caller doesn’t have access to the resource (license).</td>
     * </tr>
     * <tr>
     * <td>SEC_E_CONTEXT_EXPIRED
     * </td>
     * <td>License is expired.</td>
     * </tr>
     * </table>
     * @param {Pointer<FILETIME>} pExpiration Indicates when the developer license expires.
     * @returns {HRESULT} Returns an <a href="https://docs.microsoft.com/uwp/api/windows.foundation.hresult">HResult structure</a> with any error codes that occurred.
     * @see https://learn.microsoft.com/windows/win32/api/wsdevlicensing/nf-wsdevlicensing-checkdeveloperlicense
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
     * @remarks
     * The following is a list of common error codes that this function returns:
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The function succeeded.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>One or more arguments are invalid.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Insufficient memory.</td>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</td>
     * <td>The license was not found.</td>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_NOT_AUTHENTICATED)</td>
     * <td>The call requires authentication.</td>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_NETWORK_UNREACHABLE)</td>
     * <td>The network can’t be reached.</td>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_ACCESS_DENIED)</td>
     * <td>The caller doesn’t have access to the resource (license).</td>
     * </tr>
     * </table>
     * @param {HWND} hwndParent The handler to the parent window.
     * @param {Pointer<FILETIME>} pExpiration Indicates when the developer license expires.
     * @returns {HRESULT} Returns an <a href="https://docs.microsoft.com/uwp/api/windows.foundation.hresult">HResult structure</a> with any error codes that occurred.
     * @see https://learn.microsoft.com/windows/win32/api/wsdevlicensing/nf-wsdevlicensing-acquiredeveloperlicense
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
     * @remarks
     * The following is a list of common error codes that this function returns:
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The function succeeded.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>One or more arguments are invalid.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Insufficient memory.</td>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</td>
     * <td>The license was not found.</td>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_NOT_AUTHENTICATED)</td>
     * <td>The call requires authentication.</td>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_NETWORK_UNREACHABLE)</td>
     * <td>The network can’t be reached.</td>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_ACCESS_DENIED)</td>
     * <td>The caller doesn’t have access to the resource (license).</td>
     * </tr>
     * </table>
     * @param {HWND} hwndParent The handler to the parent window.
     * @returns {HRESULT} Returns an <a href="https://docs.microsoft.com/uwp/api/windows.foundation.hresult">HResult structure</a> with any error codes that occurred.
     * @see https://learn.microsoft.com/windows/win32/api/wsdevlicensing/nf-wsdevlicensing-removedeveloperlicense
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
