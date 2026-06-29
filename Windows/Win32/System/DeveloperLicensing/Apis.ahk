#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.System.DeveloperLicensing
 */

;@region Functions
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
export CheckDeveloperLicense(pExpiration) {
    result := DllCall("WSClient.dll\CheckDeveloperLicense", FILETIME.Ptr, pExpiration, "HRESULT")
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
export AcquireDeveloperLicense(hwndParent, pExpiration) {
    result := DllCall("WSClient.dll\AcquireDeveloperLicense", HWND, hwndParent, FILETIME.Ptr, pExpiration, "HRESULT")
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
export RemoveDeveloperLicense(hwndParent) {
    result := DllCall("WSClient.dll\RemoveDeveloperLicense", HWND, hwndParent, "HRESULT")
    return result
}

;@endregion Functions
