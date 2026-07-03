#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Defines the callback function that is called by the WFDStartOpenSession function when the WFDStartOpenSession operation completes.
 * @remarks
 * The <b>WFD_OPEN_SESSION_COMPLETE_CALLBACK</b> function is part of Wi-Fi Direct, a new feature in Windows 8 and Windows Server 2012. Wi-Fi Direct is based on the development of the Wi-Fi Peer-to-Peer Technical Specification v1.1 by the Wi-Fi Alliance (see <a href="https://www.wi-fi.org/featured-topics">Wi-Fi Alliance Published Specifications</a>). The goal of the Wi-Fi Peer-to-Peer Technical Specification is to provide a solution for Wi-Fi device-to-device connectivity without the need for either a Wireless Access Point (wireless AP) to setup the connection or the use of the existing Wi-Fi adhoc (IBSS) mechanism. 
 * 
 * 
 * 
 * The  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdstartopensession">WFDStartOpenSession</a> function starts an asynchronous operation to start an on-demand connection to  a specific Wi-Fi Direct device. The target Wi-Fi device must previously have been paired through the Windows Pairing experience. When the asynchronous operation to make the Wi-FI Direct connection completes, the callback function specified in the <i>pfnCallback</i> parameter is called.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/nc-wlanapi-wfd_open_session_complete_callback
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WFD_OPEN_SESSION_COMPLETE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WFD_OPEN_SESSION_COMPLETE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hSessionHandle A session handle to a Wi-Fi Direct session. This is a session handle previously returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdstartopensession">WFDStartOpenSession</a> function.
     * @param {Pointer<Void>} pvContext An context pointer passed to the callback function from the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdstartopensession">WFDStartOpenSession</a> function.
     * @param {Guid} guidSessionInterface The interface GUID of the local network interface on which this Wi-Fi Direct device has an open session.
     * This parameter is useful if higher-layer protocols need to determine which network interface a Wi-Fi Direct session is bound to.
     * This value is only returned if the <i>dwError</i> parameter is ERROR_SUCCESS.
     * @param {Integer} dwError A value that specifies whether there was an error encountered during the call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdstartopensession">WFDStartOpenSession</a> function. If this value is ERROR_SUCCESS, then no error occurred and the operation to open the session completed successfully.
     * 
     * The following other values are possible:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ERROR_INVALID_PARAMETER"></a><a id="error_invalid_parameter"></a><dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is incorrect. This error is returned if the <i>hClientHandle</i> parameter is <b>NULL</b> or not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ERROR_INVALID_STATE"></a><a id="error_invalid_state"></a><dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group or resource is not in the correct state to perform the requested operation. This error is returned if the Wi-Fi Direct service is disabled by group policy on a domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ERROR_SERVICE_NOT_ACTIVE"></a><a id="error_service_not_active"></a><dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started. This error is returned if the WLAN AutoConfig Service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_STATUS"></a><a id="rpc_status"></a><dl>
     * <dt><b>RPC_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Various RPC and other error codes. Use <b>FormatMessage</b> to obtain the message string for the returned error. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwReasonCode A value that specifies the more detail if an error occurred during <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wfdstartopensession">WFDStartOpenSession</a>.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hSessionHandle, pvContext, guidSessionInterface, dwError, dwReasonCode) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, HANDLE, hSessionHandle, pvContextMarshal, pvContext, Guid, guidSessionInterface, UInt32, dwError, UInt32, dwReasonCode)
    }

    /**
     * A WFD_OPEN_SESSION_COMPLETE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WFD_OPEN_SESSION_COMPLETE_CALLBACK {
        /**
         * Creates a WFD_OPEN_SESSION_COMPLETE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr", Guid, UInt32, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr", Guid, UInt32, UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
