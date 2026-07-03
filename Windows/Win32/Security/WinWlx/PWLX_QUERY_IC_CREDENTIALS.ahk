#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WLX_CLIENT_CREDENTIALS_INFO_V1_0.ahk" { WLX_CLIENT_CREDENTIALS_INFO_V1_0 }

/**
 * Called by a replacement GINA DLL if Terminal Services is enabled. GINA calls this function to determine whether the terminal server is using Internet connector licensing and to retrieve credentials information.
 * @remarks
 * The GINA DLL is responsible for calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> to free the resources used by this structure when the structure is no longer needed.
 * 
 * In order to access this function, the GINA DLL must use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/ns-winwlx-wlx_dispatch_version_1_3">WLX_DISPATCH_VERSION_1_3</a> structure, and set the Winlogon version to at least WLX_VERSION_1_3 in its 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxnegotiate">WlxNegotiate</a> call.
 * 
 * If Terminal Services is not using an Internet connector license, the GINA DLL must call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_query_client_credentials">WlxQueryClientCredentials</a>.
 * 
 * Other Winlogon support functions that may be called when Terminal Services is enabled are <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_disconnect">WlxDisconnect</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_query_client_credentials">WlxQueryClientCredentials</a>,
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_query_terminal_services_data">WlxQueryTerminalServicesData</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_win31_migrate">WlxWin31Migrate</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_query_ic_credentials
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_QUERY_IC_CREDENTIALS {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_QUERY_IC_CREDENTIALS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WLX_CLIENT_CREDENTIALS_INFO_V1_0>} pCred When the return value is <b>TRUE</b>, <i>pCred</i> specifies a pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/winwlx/ns-winwlx-wlx_client_credentials_info_v1_0">WLX_CLIENT_CREDENTIALS_INFO_V1_0</a> structure that contains the credentials to use for auto logon.
     * @returns {BOOL} The <b>WlxQueryInetConnectorCredentials</b> function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internet connector licensing is enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internet connector licensing is not available.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(pCred) {
        result := DllCall(this.value, WLX_CLIENT_CREDENTIALS_INFO_V1_0.Ptr, pCred, BOOL)
        return result
    }

    /**
     * A PWLX_QUERY_IC_CREDENTIALS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_QUERY_IC_CREDENTIALS {
        /**
         * Creates a PWLX_QUERY_IC_CREDENTIALS pointer that invokes the given AHK function when called.
         * @param {Func(WLX_CLIENT_CREDENTIALS_INFO_V1_0) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WLX_CLIENT_CREDENTIALS_INFO_V1_0.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
