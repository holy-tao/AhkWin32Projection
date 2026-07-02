#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The FaxClose function closes fax handles
 * @remarks
 * A fax client application must call the <b>FaxClose</b> function as the last function before it terminates. The <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function cannot close the handle to a fax server or a fax port.
 * 
 * When the <b>FaxClose</b> function closes a handle allocated by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function, the function disconnects the calling application from the specified fax server.
 * 
 * A fax client application continues to receive fax events from the fax service after the application successfully calls the <b>FaxClose</b> function to close a fax server handle. This permits the fax service to shut down and conserve system resources when the service has been idle for an extended period. If you keep the handle to the fax server open, the fax service does not shut down.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-enabling-an-application-to-receive-notifications-of-fax-events">Enabling an Application to Receive Notifications of Fax Events</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-connecting-to-a-fax-server">Connecting to a Fax Server</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-disconnecting-from-a-fax-server">Disconnecting from a Fax Server</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxinitializeeventqueue">FaxInitializeEventQueue</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winfax/nc-winfax-pfaxclose
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXCLOSE {
    value : IntPtr

    __value {
        set {
            if (value is PFAXCLOSE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies the fax handle to close. This value can be a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function, or a fax port handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxopenport">FaxOpenPort</a> function.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_QUERY</a> access is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FaxHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(FaxHandle) {
        result := DllCall(this.value, HANDLE, FaxHandle, BOOL)
        return result
    }

    /**
     * A PFAXCLOSE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXCLOSE {
        /**
         * Creates a PFAXCLOSE pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
