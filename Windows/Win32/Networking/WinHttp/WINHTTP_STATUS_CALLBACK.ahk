#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an application-defined status callback function.
 * @remarks
 * The callback function must be threadsafe and reentrant because it can be called on another thread for a separate request, and reentered on the same thread for the current request. It must therefore be coded to handle reentrance safely while processing. When the <i>dwInternetStatus</i> parameter is equal to <b>WINHTTP_CALLBACK_STATUS_HANDLE_CLOSING</b>, the callback does not need to be able to handle reentrance for the same request, because this callback is guaranteed to be the last, and does not occur when other messages for this request are handled.
 * 
 * The status callback function receives updates on the status of asynchronous operations through notification flags.  Notifications that indicate a particular operation is complete are called completion notifications, or just completions.  The following table lists the six completion flags and the corresponding function that is complete when this flag is received.
 * 
 * <table class="clsStd">
 * <tr>
 * <th>Completion flag</th>
 * <th>Function</th>
 * </tr>
 * <tr>
 * <td>WINHTTP_CALLBACK_STATUS_DATA_AVAILABLE</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpquerydataavailable">WinHttpQueryDataAvailable</a>
 * </td>
 * </tr>
 * <tr>
 * <td>WINHTTP_CALLBACK_STATUS_HEADERS_AVAILABLE</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a>
 * </td>
 * </tr>
 * <tr>
 * <td>WINHTTP_CALLBACK_STATUS_READ_COMPLETE</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreaddata">WinHttpReadData</a>
 * </td>
 * </tr>
 * <tr>
 * <td>WINHTTP_CALLBACK_STATUS_SENDREQUEST_COMPLETE</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsendrequest">WinHttpSendRequest</a>
 * </td>
 * </tr>
 * <tr>
 * <td>WINHTTP_CALLBACK_STATUS_WRITE_COMPLETE</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwritedata">WinHttpWriteData</a>
 * </td>
 * </tr>
 * <tr>
 * <td>WINHTTP_CALLBACK_STATUS_REQUEST_ERROR</td>
 * <td>Any of the above functions when an error occurs.</td>
 * </tr>
 * </table>
 *  
 * 
 * Because callbacks are made during the processing of the request, the application should spend as little time as possible in the callback function to avoid degrading data throughput on the network. For example, displaying a dialog box in a callback function can be such a lengthy operation that the server terminates the request.
 * 
 * The callback function can be called in a thread context different from the thread that initiated the request.
 * 
 * Similarly, there is no callback thread affinity when you call WinHttp asynchronously: a call might start from one thread, but any other thread can receive the callback.
 * 
 * 
 * <div class="alert"><b>Note</b>  For more information about implementation in Windows XP and Windows 2000, see <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nc-winhttp-winhttp_status_callback
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_STATUS_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WINHTTP_STATUS_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} hInternet The handle for which the callback function is called.
     * @param {Pointer} dwContext A pointer to a <b>DWORD</b> that specifies the application-defined context value associated with the handle in the 
     * <i>hInternet</i> parameter.
     * 
     * A context value can be assigned to a Session, Connect, or Request handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetoption">WinHttpSetOption</a>  with the  <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">WINHTTP_OPTION_CONTEXT_VALUE</a> option. Alternatively, <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsendrequest">WinHttpSendRequest</a> can be used to associate a context value with a Request handle.
     * @param {Integer} dwInternetStatus 
     * @param {Pointer<Void>} lpvStatusInformation A pointer to a buffer that specifies information pertinent to this call to the callback function. The format of these data depends on the value of the <i>dwInternetStatus</i> argument. For more information, see <i>dwInternetStatus</i>.
     * @param {Integer} dwStatusInformationLength <b>WINHTTP_CALLBACK_STATUS_REDIRECT</b> status callbacks provide a <i>dwStatusInformationLength</i> value that corresponds to the character count of the <b>LPWSTR</b> pointed to by <i>lpvStatusInformation</i>.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hInternet, dwContext, dwInternetStatus, lpvStatusInformation, dwStatusInformationLength) {
        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
        lpvStatusInformationMarshal := lpvStatusInformation is VarRef ? "ptr" : "ptr"

        DllCall(this.value, hInternetMarshal, hInternet, IntPtr, dwContext, UInt32, dwInternetStatus, lpvStatusInformationMarshal, lpvStatusInformation, UInt32, dwStatusInformationLength)
    }

    /**
     * A WINHTTP_STATUS_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WINHTTP_STATUS_CALLBACK {
        /**
         * Creates a WINHTTP_STATUS_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, UInt32, "ptr", UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, UInt32, "ptr", UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
