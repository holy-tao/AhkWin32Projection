#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\WINHTTP_PROXY_RESULT_EX.ahk" { WINHTTP_PROXY_RESULT_EX }
#Import ".\WINHTTP_HEADER_NAME.ahk" { WINHTTP_HEADER_NAME }
#Import ".\WINHTTP_WEB_SOCKET_BUFFER_TYPE.ahk" { WINHTTP_WEB_SOCKET_BUFFER_TYPE }
#Import ".\WINHTTP_CURRENT_USER_IE_PROXY_CONFIG.ahk" { WINHTTP_CURRENT_USER_IE_PROXY_CONFIG }
#Import ".\WINHTTP_EXTENDED_HEADER.ahk" { WINHTTP_EXTENDED_HEADER }
#Import ".\WINHTTP_PROXY_RESULT.ahk" { WINHTTP_PROXY_RESULT }
#Import ".\WINHTTP_PROXY_SETTINGS_TYPE.ahk" { WINHTTP_PROXY_SETTINGS_TYPE }
#Import ".\WINHTTP_PROXY_SETTINGS_PARAM.ahk" { WINHTTP_PROXY_SETTINGS_PARAM }
#Import ".\WINHTTP_PROXY_SETTINGS.ahk" { WINHTTP_PROXY_SETTINGS }
#Import ".\WINHTTP_AUTOPROXY_OPTIONS.ahk" { WINHTTP_AUTOPROXY_OPTIONS }
#Import ".\WINHTTP_OPEN_REQUEST_FLAGS.ahk" { WINHTTP_OPEN_REQUEST_FLAGS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WINHTTP_PROXY_INFO.ahk" { WINHTTP_PROXY_INFO }
#Import ".\URL_COMPONENTS.ahk" { URL_COMPONENTS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WIN_HTTP_CREATE_URL_FLAGS.ahk" { WIN_HTTP_CREATE_URL_FLAGS }
#Import ".\WINHTTP_ACCESS_TYPE.ahk" { WINHTTP_ACCESS_TYPE }
#Import ".\WINHTTP_QUERY_CONNECTION_GROUP_RESULT.ahk" { WINHTTP_QUERY_CONNECTION_GROUP_RESULT }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */

;@region Functions
/**
 * The WinHttpSetStatusCallback function sets up a callback function that WinHTTP can call as progress is made during an operation.
 * @remarks
 * If you set the callback on the session handle before creating the request handle, the request handle inherits the callback function pointer from its parent session.
 * 
 * Even when  WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function operates synchronously. The return value indicates success or failure.  To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * Both synchronous and asynchronous functions use the callback function to indicate the progress of the request, such as resolving a name, connecting to a server, and so on. The callback function is required for an asynchronous operation.
 * 
 * A callback function can be set on any handle and is inherited by derived handles. A callback function can be changed using 
 * <b>WinHttpSetStatusCallback</b>, provided there are no pending requests that need to use the previous callback value. However, changing the callback function on a handle does not change the callbacks on derived handles, such as that returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpconnect">WinHttpConnect</a>. You must change the callback function at each level.
 * 
 * Many WinHTTP functions perform several operations on the network. Each operation can take time to complete and each can fail.
 * 
 * After initiating the 
 * <b>WinHttpSetStatusCallback</b> function, the callback function can be accessed from within WinHTTP for monitoring time-intensive network operations.
 * 
 * At the end of asynchronous processing, the application may set the callback function to <b>NULL</b>. This prevents the client application from receiving additional notifications.
 * 
 * The following code snippet shows the recommended method for setting the callback function to <b>NULL</b>.
 * 
 * 
 * ``` syntax
 * WinHttpSetStatusCallback( hOpen,
 *                           NULL,
 *                           WINHTTP_CALLBACK_FLAG_ALL_NOTIFICATIONS,
 *                           NULL );
 * 
 * ```
 * 
 * Note, however, that WinHTTP does not synchronize <b>WinHttpSetStatusCallback</b> with worker threads. If  a callback originating in another thread is in progress when an application calls <b>WinHttpSetStatusCallback</b>, the application still receives a callback notification even after <b>WinHttpSetStatusCallback</b> successfully sets the callback function to <b>NULL</b> and returns.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @param {Pointer<Void>} hInternet <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle for which the callback is to be set.
 * @param {Pointer<WINHTTP_STATUS_CALLBACK>} lpfnInternetCallback Pointer to the callback function to call when progress is made.  Set this to <b>NULL</b> to remove the existing callback function. For more information about the callback function, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nc-winhttp-winhttp_status_callback">WINHTTP_STATUS_CALLBACK</a>.
 * @param {Integer} dwNotificationFlags Unsigned long integer value that specifies flags to indicate which
 *                 events  activate the callback function.
 * 
 * The possible values are as follows.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_ALL_COMPLETIONS"></a><a id="winhttp_callback_flag_all_completions"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_ALL_COMPLETIONS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates upon any completion notification.  This flag specifies that all notifications required for read or write operations are used. See 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nc-winhttp-winhttp_status_callback">WINHTTP_STATUS_CALLBACK</a> for a list of completions.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_ALL_NOTIFICATIONS"></a><a id="winhttp_callback_flag_all_notifications"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_ALL_NOTIFICATIONS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates upon any status change notification including completions.  See 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nc-winhttp-winhttp_status_callback">WINHTTP_STATUS_CALLBACK</a> for a list of notifications.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_RESOLVE_NAME"></a><a id="winhttp_callback_flag_resolve_name"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_RESOLVE_NAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates upon beginning and completing name resolution.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_CONNECT_TO_SERVER"></a><a id="winhttp_callback_flag_connect_to_server"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_CONNECT_TO_SERVER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates upon beginning and completing connection to the server.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_DETECTING_PROXY"></a><a id="winhttp_callback_flag_detecting_proxy"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_DETECTING_PROXY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates when detecting the proxy server.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_DATA_AVAILABLE"></a><a id="winhttp_callback_flag_data_available"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_DATA_AVAILABLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates when completing a query for data.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_HEADERS_AVAILABLE"></a><a id="winhttp_callback_flag_headers_available"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_HEADERS_AVAILABLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates when the response headers are available for retrieval.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_READ_COMPLETE"></a><a id="winhttp_callback_flag_read_complete"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_READ_COMPLETE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates upon completion of a data-read operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_REQUEST_ERROR"></a><a id="winhttp_callback_flag_request_error"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_REQUEST_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates when an asynchronous error occurs.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_SEND_REQUEST"></a><a id="winhttp_callback_flag_send_request"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_SEND_REQUEST</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates upon beginning and completing the sending of a request
 *                     header with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsendrequest">WinHttpSendRequest</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_SENDREQUEST_COMPLETE"></a><a id="winhttp_callback_flag_sendrequest_complete"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_SENDREQUEST_COMPLETE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates when a request header has been sent with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsendrequest">WinHttpSendRequest</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_WRITE_COMPLETE"></a><a id="winhttp_callback_flag_write_complete"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_WRITE_COMPLETE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates upon completion of a data-post operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_RECEIVE_RESPONSE"></a><a id="winhttp_callback_flag_receive_response"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_RECEIVE_RESPONSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates upon beginning and completing the receipt of a
 *                     resource from the HTTP server.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_CLOSE_CONNECTION"></a><a id="winhttp_callback_flag_close_connection"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_CLOSE_CONNECTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates when beginning and completing the closing of an
 *                     HTTP connection.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_HANDLES"></a><a id="winhttp_callback_flag_handles"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_HANDLES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates when an 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle is 
 *                     created or closed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_REDIRECT"></a><a id="winhttp_callback_flag_redirect"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_REDIRECT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates when the request is redirected.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_INTERMEDIATE_RESPONSE"></a><a id="winhttp_callback_flag_intermediate_response"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_INTERMEDIATE_RESPONSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates when receiving an intermediate (100 level) status 
 *                     code message from the server.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_SECURE_FAILURE"></a><a id="winhttp_callback_flag_secure_failure"></a><dl>
 * <dt><b>WINHTTP_CALLBACK_FLAG_SECURE_FAILURE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Activates upon a secure connection failure.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer} dwReserved This parameter is reserved and must be <b>NULL</b>.
 * @returns {Pointer<WINHTTP_STATUS_CALLBACK>} If successful, returns a pointer to the previously defined status callback function or  <b>NULL</b> if there was no previously defined status callback function. Returns <b>WINHTTP_INVALID_STATUS_CALLBACK</b> if the callback function could not be installed. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpsetstatuscallback
 * @since windows5.1.2600
 */
export WinHttpSetStatusCallback(hInternet, lpfnInternetCallback, dwNotificationFlags, dwReserved) {
    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpSetStatusCallback", hInternetMarshal, hInternet, "ptr", lpfnInternetCallback, "uint", dwNotificationFlags, "ptr", dwReserved, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Formats a date and time according to the HTTP version 1.0 specification. (WinHttpTimeFromSystemTime)
 * @remarks
 * Even when  WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function operates synchronously. The return value indicates success or failure.  To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHTTP Start Page.</div>
 * <div> </div>
 * @param {Pointer<SYSTEMTIME>} pst A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the date and time to format.
 * @param {PWSTR} pwszTime A pointer to a string buffer that receives the formatted date and time. The buffer should equal to the size, in bytes, of WINHTTP_TIME_FORMAT_BUFSIZE.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get  extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttptimefromsystemtime
 * @since windows5.1.2600
 */
export WinHttpTimeFromSystemTime(pst, pwszTime) {
    pwszTime := pwszTime is String ? StrPtr(pwszTime) : pwszTime

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpTimeFromSystemTime", SYSTEMTIME.Ptr, pst, "ptr", pwszTime, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinHttpTimeToSystemTime function takes an HTTP time/date string and converts it to a SYSTEMTIME structure.
 * @remarks
 * Even when  WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function operates synchronously. The return value indicates success or failure.  To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @param {PWSTR} pwszTime Pointer to a null-terminated date/time string to convert. This value must use the format defined in section 3.3 of the <a href="http://www.ietf.org/rfc/rfc2616.txt">RFC2616</a>.
 * @param {Pointer<SYSTEMTIME>} pst Pointer to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the converted time.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned is:
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttptimetosystemtime
 * @since windows5.1.2600
 */
export WinHttpTimeToSystemTime(pwszTime, pst) {
    pwszTime := pwszTime is String ? StrPtr(pwszTime) : pwszTime

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpTimeToSystemTime", "ptr", pwszTime, SYSTEMTIME.Ptr, pst, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinHttpCrackUrl function separates a URL into its component parts such as host name and path.
 * @remarks
 * Even when  WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function operates synchronously. The return value indicates success or failure.  To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * The required components are indicated by members of the 
 * <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-url_components">URL_COMPONENTS</a> structure. Each component has a pointer to the value and has a member that stores the length of the stored value. If both the value and the length for a component are equal to zero, that component is not returned. If the pointer to the value of the component is not <b>NULL</b> and the value of its corresponding length member is nonzero, the address of the first character of the corresponding component in the 
 * <i>pwszUrl</i> string is stored in the pointer, and the length of the component is stored in the length member.
 * 
 * If the pointer contains the address of the user-supplied buffer, the length member must contain the size of the buffer. The 
 * <b>WinHttpCrackUrl</b> function copies the component into the buffer, and the length member is set to the length of the copied component, minus 1 for the trailing string terminator. If a user-supplied buffer is not large enough, <b>WinHttpCrackUrl</b> returns <b>FALSE</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INSUFFICIENT_BUFFER</b>.
 * 
 * For 
 * <b>WinHttpCrackUrl</b> to work properly, the size of the 
 * <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-url_components">URL_COMPONENTS</a> structure must be stored in the 
 * <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-url_components">dwStructSize</a> member of that structure.
 * 
 * If the Internet protocol of the URL passed in for 
 * <i>pwszUrl</i> is not HTTP or HTTPS, then 
 * <b>WinHttpCrackUrl</b>  returns  <b>FALSE</b> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>  indicates  
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/error-messages">ERROR_WINHTTP_UNRECOGNIZED_SCHEME</a>.
 * 
 * <b>WinHttpCrackUrl</b> does not check the validity or format of a URL before attempting to crack it. As a result, if a string such as ""http://server?Bad=URL"" is passed in, the function returns incorrect results.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @param {PWSTR} pwszUrl Pointer to a string that contains the canonical URL to separate. <b>WinHttpCrackUrl</b> does not check this URL for validity or correct format before attempting to crack it.
 * @param {Integer} dwUrlLength The length of the 
 * <i>pwszUrl</i> string, in characters. If 
 * <i>dwUrlLength</i> is set to zero, 
 * <b>WinHttpCrackUrl</b> assumes that the 
 * <i>pwszUrl</i> string is <b>null</b> terminated and  determines the length of the 
 * <i>pwszUrl</i> string based on that assumption.
 * @param {Integer} dwFlags The flags that control the operation. This parameter can be a combination of one or more of the following flags (values can be bitwise OR'd together). Or, the parameter can be 0, which performs no special operations.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ICU_DECODE"></a><a id="icu_decode"></a><dl>
 * <dt><b>ICU_DECODE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Converts characters that are "escape encoded" (%xx) to their non-escaped form.  This does not decode other encodings, such as UTF-8. This feature can be used only if the user provides buffers in the <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-url_components">URL_COMPONENTS</a> structure to copy the components into.
 * 
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ICU_ESCAPE"></a><a id="icu_escape"></a><dl>
 * <dt><b>ICU_ESCAPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Escapes certain characters to their escape sequences (%xx). Characters to be escaped are non-ASCII characters or those ASCII characters that must be escaped to be represented in an HTTP request.  This feature can be used only if the user provides buffers in the 
 * <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-url_components">URL_COMPONENTS</a> structure to copy the components into. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ICU_REJECT_USERPWD"></a><a id="icu_reject_userpwd"></a><dl>
 * <dt><b>ICU_REJECT_USERPWD</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Rejects URLs as input that contain embedded credentials (either a username, a password, or both). If the function fails because of an invalid URL, then subsequent calls to GetLastError return <b>ERROR_WINHTTP_INVALID_URL</b>.
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<URL_COMPONENTS>} lpUrlComponents Pointer to a 
 * <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-url_components">URL_COMPONENTS</a> structure that receives the URL components.
 * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Codes</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INVALID_URL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_UNRECOGNIZED_SCHEME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL scheme could not be recognized, or is not supported.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpcrackurl
 * @since windows5.1.2600
 */
export WinHttpCrackUrl(pwszUrl, dwUrlLength, dwFlags, lpUrlComponents) {
    pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpCrackUrl", "ptr", pwszUrl, "uint", dwUrlLength, "uint", dwFlags, URL_COMPONENTS.Ptr, lpUrlComponents, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Creates a URL from component parts such as the host name and path.
 * @remarks
 * Even when  WinHTTP is used in asynchronous mode, that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>, this function operates synchronously. The return value indicates success or failure.  To get extended error data, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @param {Pointer<URL_COMPONENTS>} lpUrlComponents Pointer to a 
 * <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-url_components">URL_COMPONENTS</a> structure that contains the components from which to create the URL.
 * @param {WIN_HTTP_CREATE_URL_FLAGS} dwFlags 
 * @param {PWSTR} pwszUrl Pointer to a character buffer that receives the URL as a wide character (Unicode) string.
 * @param {Pointer<Integer>} pdwUrlLength Pointer to a variable of type unsigned long integer that receives the length of the 
 * <i>pwszUrl</i> buffer in wide (Unicode) characters. When the function returns, this parameter receives the length of the URL string wide in characters, minus 1 for the terminating character. If 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INSUFFICIENT_BUFFER, this parameter receives the number of wide characters required to hold the created URL.
 * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error data, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpcreateurl
 * @since windows5.1.2600
 */
export WinHttpCreateUrl(lpUrlComponents, dwFlags, pwszUrl, pdwUrlLength) {
    pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

    pdwUrlLengthMarshal := pdwUrlLength is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpCreateUrl", URL_COMPONENTS.Ptr, lpUrlComponents, WIN_HTTP_CREATE_URL_FLAGS, dwFlags, "ptr", pwszUrl, pdwUrlLengthMarshal, pdwUrlLength, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinHttpCheckPlatform function determines whether the current platform is supported by this version of Microsoft Windows HTTP Services (WinHTTP).
 * @remarks
 * This function is useful if your application uses Microsoft Windows HTTP Services (WinHTTP), but also supports platforms that WinHTTP does not.
 * 
 * Even when  WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function operates synchronously. The return value indicates success or failure.  To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 *  WinHTTP version 5.1 is  an operating-system component of Windows 2000 with Service Pack 3 (SP3) and later (except Datacenter Server), Windows XP with Service Pack 1 (SP1) and later, and Windows Server 2003. In Windows Server 2003, WinHTTP is a system side-by-side assembly.
 * 
 * For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a>.
 * @returns {BOOL} The return value is <b>TRUE</b> if the platform is supported by Microsoft Windows HTTP Services (WinHTTP), or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpcheckplatform
 * @since windows5.1.2600
 */
export WinHttpCheckPlatform() {
    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpCheckPlatform", BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the default WinHTTP proxy configuration from the registry.
 * @remarks
 * <b>WinHttpGetDefaultProxyConfiguration</b> retrieves the proxy configuration set by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetdefaultproxyconfiguration">WinHttpSetDefaultProxyConfiguration</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/proxycfg-exe--a-proxy-configuration-tool">ProxyCfg.exe</a>.
 * 
 * The default proxy configuration can be overridden for a WinHTTP session by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetoption">WinHttpSetOption</a> and specifying the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">WINHTTP_OPTION_PROXY</a> flag.  
 * <b>WinHttpGetDefaultProxyConfiguration</b> does not retrieve the configuration for the current session.  It retrieves the configuration specified in the registry.
 * 
 * If the registry contains a list of proxy servers, the 
 * <b>dwAccessType</b> member of 
 * <i>pProxyInfo</i> is set to 
 * <b>WINHTTP_ACCESS_TYPE_NAMED_PROXY</b>.  Otherwise, it is set to 
 * <b>WINHTTP_ACCESS_TYPE_NO_PROXY</b>.
 * 
 * <b>WinHttpGetDefaultProxyConfiguration</b> allocates memory for the string members of 
 * <i>pProxyInfo</i>.  To free this memory, call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalfree">GlobalFree</a>.
 * 
 * Even when  WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function operates synchronously. The return value indicates success or failure.  To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHTTP Start Page.</div>
 * <div> </div>
 * @param {Pointer<WINHTTP_PROXY_INFO>} pProxyInfo A pointer to a variable of type 
 * <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_proxy_info">WINHTTP_PROXY_INFO</a> that receives the default proxy configuration.
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise. To retrieve a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Error codes returned include the following.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpgetdefaultproxyconfiguration
 * @since windows5.1.2600
 */
export WinHttpGetDefaultProxyConfiguration(pProxyInfo) {
    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpGetDefaultProxyConfiguration", WINHTTP_PROXY_INFO.Ptr, pProxyInfo, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets the default WinHTTP proxy configuration in the registry.
 * @remarks
 * The default proxy configuration set by **WinHttpSetDefaultProxyConfiguration** can be overridden for an existing WinHTTP session by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetoption">WinHttpSetOption</a> and specifying the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">WINHTTP_OPTION_PROXY</a> flag.  The default proxy configuration can be overridden for a new session by specifying the configuration with the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a> function.
 * 
 * The *dwAccessType* member of 
 * the <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_proxy_info">WINHTTP_PROXY_INFO</a> structure pointed to by <i>pProxyInfo</i> should be set to 
 * <b>WINHTTP_ACCESS_TYPE_NAMED_PROXY</b> if a proxy is specified.  Otherwise, it should be set to 
 * <b>WINHTTP_ACCESS_TYPE_DEFAULT_PROXY</b>.
 * 
 * Any new sessions created after calling this function use the new default proxy configuration.
 * 
 * Even when  WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function operates synchronously. The return value indicates success or failure.  To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHTTP start page.</div>
 * <div> </div>
 * @param {Pointer<WINHTTP_PROXY_INFO>} pProxyInfo A pointer to a variable of type 
 * <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_proxy_info">WINHTTP_PROXY_INFO</a> that specifies the default proxy configuration.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpsetdefaultproxyconfiguration
 * @since windows5.1.2600
 */
export WinHttpSetDefaultProxyConfiguration(pProxyInfo) {
    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpSetDefaultProxyConfiguration", WINHTTP_PROXY_INFO.Ptr, pProxyInfo, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Initializes, for an application, the use of WinHTTP functions and returns a WinHTTP-session handle.
 * @remarks
 * We strongly recommend that you use WinHTTP in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <b>WinHttpOpen</b>, so that usage of the returned <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> become asynchronous). The return value indicates success or failure. To retrieve extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * The 
 * <b>WinHttpOpen</b> function is the first of the WinHTTP functions called by an application. It initializes internal WinHTTP data structures and prepares for future calls from the application. When the application finishes using the WinHTTP functions, it must call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a> to free the session handle and any associated resources.
 * 
 * The application can make any number of calls to 
 * <b>WinHttpOpen</b>, though a single call is normally sufficient. Each call to 
 * <b>WinHttpOpen</b> opens a new session context. Because user data is not shared between multiple session contexts, an application that makes requests on behalf of multiple users should create a separate session for each user, so as not to share user-specific cookies and authentication state. The application should define separate behaviors for each 
 * <b>WinHttpOpen</b> instance, such as different proxy servers configured for each.
 * 
 * After the calling application has finished using the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by 
 * <b>WinHttpOpen</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a> function.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a>.</div>
 * <div> </div>
 * @param {PWSTR} pszAgentW A pointer to a string variable that contains the name of the application or entity calling the WinHTTP functions. This name is used as the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/glossary">user agent</a> in the HTTP protocol.
 * @param {WINHTTP_ACCESS_TYPE} dwAccessType 
 * @param {PWSTR} pszProxyW A pointer to a string variable that contains the name of the proxy server to use when proxy access is specified by setting 
 * <i>dwAccessType</i> to 
 * <b>WINHTTP_ACCESS_TYPE_NAMED_PROXY</b>. The WinHTTP functions recognize only CERN type proxies for HTTP. If 
 * <i>dwAccessType</i> is not set to 
 * <b>WINHTTP_ACCESS_TYPE_NAMED_PROXY</b>, this parameter must be set to <b>WINHTTP_NO_PROXY_NAME</b>.
 * @param {PWSTR} pszProxyBypassW A pointer to a string variable that contains an optional semicolon delimited list of host names or IP addresses, or both, that should not be routed through the proxy when 
 * <i>dwAccessType</i> is set to 
 * <b>WINHTTP_ACCESS_TYPE_NAMED_PROXY</b>. The list can contain wildcard characters. Do not use an empty string, because the 
 * <b>WinHttpOpen</b> function uses it as the proxy bypass list. If this parameter specifies the "&lt;local&gt;" macro in the list as the only entry, this function bypasses any host name that does not contain a period. If 
 * <i>dwAccessType</i> is not set to 
 * <b>WINHTTP_ACCESS_TYPE_NAMED_PROXY</b>, this parameter must be set to <b>WINHTTP_NO_PROXY_BYPASS</b>.
 * @param {Integer} dwFlags Unsigned long integer value that contains the flags that indicate various options affecting the behavior of this function. This parameter can have the following value.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_FLAG_ASYNC"></a><a id="winhttp_flag_async"></a><dl>
 * <dt><b>WINHTTP_FLAG_ASYNC</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Use the WinHTTP functions asynchronously. By default, all WinHTTP functions that use the returned 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle are performed synchronously. When this flag is set, the caller needs to specify a callback function through <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetstatuscallback">WinHttpSetStatusCallback</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_FLAG_SECURE_DEFAULTS"></a><a id="winhttp_flag_secure_defaults"></a><dl>
 * <dt><b>WINHTTP_FLAG_SECURE_DEFAULTS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * When this flag is set, WinHttp will require use of TLS 1.2 or newer. If the caller attempts to enable older TLS versions by setting <b>WINHTTP_OPTION_SECURE_PROTOCOLS</b>, it will fail with <b>ERROR_ACCESS_DENIED</b>. Additionally, TLS fallback will be disabled. Note that setting this flag also sets flag <b>WINHTTP_FLAG_ASYNC</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Pointer<Void>} Returns a valid session handle if successful, or <b>NULL</b> otherwise. To retrieve extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpopen
 * @since windows5.1.2600
 */
export WinHttpOpen(pszAgentW, dwAccessType, pszProxyW, pszProxyBypassW, dwFlags) {
    pszAgentW := pszAgentW is String ? StrPtr(pszAgentW) : pszAgentW
    pszProxyW := pszProxyW is String ? StrPtr(pszProxyW) : pszProxyW
    pszProxyBypassW := pszProxyBypassW is String ? StrPtr(pszProxyBypassW) : pszProxyBypassW

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpOpen", "ptr", pszAgentW, WINHTTP_ACCESS_TYPE, dwAccessType, "ptr", pszProxyW, "ptr", pszProxyBypassW, "uint", dwFlags, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinHttpCloseHandle function closes a single **HINTERNET** handle.
 * @remarks
 * Even when WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function operates synchronously. The return value indicates success or failure. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * If there is a status callback registered for the handle being closed and the handle was created with a non-<b>NULL</b> context value, a <b>WINHTTP_CALLBACK_STATUS_HANDLE_CLOSING</b> callback is made. This  is the last callback made from the handle and indicates that the handle is being destroyed.
 * 
 * An application can terminate an in-progress asynchronous request by closing the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> request handle using <b>WinHttpCloseHandle</b>. Keep the following points in mind:
 * 
 * <ul>
 * <li>
 * After an application calls <b>WinHttpCloseHandle</b> on a WinHTTP handle, it cannot call any other WinHTTP API functions using that handle from any thread.
 * 
 * </li>
 * <li>
 * Even after a call to <b>WinHttpCloseHandle</b> returns, the application must still be prepared to receive callbacks for the closed handle, because WinHTTP can tear down the handle asynchronously. If the asynchronous request was not able to complete successfully, the callback  receives a WINHTTP_CALLBACK_STATUS_REQUEST_ERROR notification.
 * 
 * </li>
 * <li>
 * If an application associates a context data structure or object with the handle, it should maintain that binding until the callback function receives a <b>WINHTTP_CALLBACK_STATUS_HANDLE_CLOSING</b> notification. This is the last callback notification WinHTTP sends prior to deleting a handle object from memory. In order to receive the <b>WINHTTP_CALLBACK_STATUS_HANDLE_CLOSING</b> callback notification, the application must enable the <b>WINHTTP_CALLBACK_FLAG_HANDLES</b> flag in the <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetstatuscallback">WinHttpSetStatusCallback</a> call.
 * 
 * </li>
 * <li>
 * Before calling <b>WinHttpCloseHandle</b>, an application can call <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetstatuscallback">WinHttpSetStatusCallback</a> to indicate that no more callbacks should be made:
 * 
 * <c>WinHttpSetStatusCallback( hRequest, NULL, 0, 0 );</c>
 * 
 * It might seem that the context data structure could then be freed immediately rather than having to wait for a <b>WINHTTP_CALLBACK_STATUS_HANDLE_CLOSING</b> notification, but this is not the case: WinHTTP does not synchronize <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetstatuscallback">WinHttpSetStatusCallback</a> with callbacks originating in worker threads. As a result, a callback could already be in progress from another thread, and the application could receive a callback notification even after having <b>NULL</b> ed-out the callback function pointer and deleted the handle's context data structure. Because of this potential race condition, be conservative in freeing the context structure until after having received the <b>WINHTTP_CALLBACK_STATUS_HANDLE_CLOSING</b> notification.
 * 
 * </li>
 * </ul>
 * An application should never call <b>WinHttpCloseHandle</b> on a synchronous request. This can create a race condition. See <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET Handles in WinHTTP</a> for more information.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @param {Pointer<Void>} hInternet A valid **HINTERNET** handle (see [HINTERNET Handles in WinHTTP](/windows/win32/winhttp/hinternet-handles-in-winhttp)) to be closed.
 * @returns {BOOL} **TRUE** if the handle is successfully closed, otherwise **FALSE**. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Codes</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_SHUTDOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The WinHTTP function support is being shut down or unloaded.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpclosehandle
 * @since windows5.1.2600
 */
export WinHttpCloseHandle(hInternet) {
    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpCloseHandle", hInternetMarshal, hInternet, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinHttpConnect function specifies the initial target server of an HTTP request and returns an HINTERNET connection handle to an HTTP session for that initial target.
 * @remarks
 * Even when  WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function operates synchronously. The return value indicates success or failure.  To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * After the calling application has finished using the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by 
 * <b>WinHttpConnect</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a> function.
 * 
 * <b>WinHttpConnect</b> specifies the target HTTP server, however a response can come from another server if the request was redirected.  You can determine the URL of the server sending the response by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption">WinHttpQueryOption</a> with the WINHTTP_OPTION_URL flag.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @param {Pointer<Void>} hSession Valid 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> WinHTTP session handle returned by a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>.
 * @param {PWSTR} pswzServerName Pointer to a <b>null</b>-terminated string that contains the host name of an HTTP server. Alternately, the string can contain the IP address of the site in ASCII, for example, 10.0.1.45.
 * Note that WinHttp does not accept international host names without converting them first to <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/">Punycode</a>. For more information, see <a href="https://docs.microsoft.com/windows/win32/intl/handling-internationalized-domain-names--idns">Handling Internationalized Domain Names (IDNs)</a>.
 * @param {Integer} nServerPort 
 * @param {Integer} dwReserved This parameter is reserved and must be 0.
 * @returns {Pointer<Void>} Returns a valid connection handle to the HTTP session if the connection is successful, or <b>NULL</b> otherwise. To retrieve extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Codes</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INVALID_URL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_UNRECOGNIZED_SCHEME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL scheme could not be recognized, or is not supported.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_SHUTDOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The WinHTTP function support is being shut down or unloaded.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpconnect
 * @since windows5.1.2600
 */
export WinHttpConnect(hSession, pswzServerName, nServerPort, dwReserved) {
    pswzServerName := pswzServerName is String ? StrPtr(pswzServerName) : pswzServerName

    hSessionMarshal := hSession is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpConnect", hSessionMarshal, hSession, "ptr", pswzServerName, "ushort", nServerPort, "uint", dwReserved, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinHttpReadData function reads data from a handle opened by the WinHttpOpenRequest function.
 * @remarks
 * Starting in Windows Vista and Windows Server 2008, WinHttp enables applications to perform chunked transfer encoding on data sent to the server. When the Transfer-Encoding header is present on the WinHttp  response, <b>WinHttpReadData</b> strips the chunking information before giving the data to the application.
 * 
 * Even when  WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function can operate either synchronously or asynchronously.  If this function returns <b>FALSE</b>, this function failed and you can call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information. If this function returns <b>TRUE</b>, use the WINHTTP_CALLBACK_STATUS_READ_COMPLETE completion to determine whether this function was successful and the value of the parameters.  The WINHTTP_CALLBACK_STATUS_REQUEST_ERROR completion indicates that the operation completed asynchronously, but failed.
 * 
 * <div class="alert"><b>Warning</b>  When  WinHTTP is used in asynchronous mode, always set the <i>lpdwNumberOfBytesRead</i> parameter to <b>NULL</b> and retrieve the bytes read in the callback function; otherwise, a memory fault can occur.</div>
 * <div> </div>
 * When the read buffer is very small, 
 * <b>WinHttpReadData</b> might complete synchronously.  If the WINHTTP_CALLBACK_STATUS_READ_COMPLETE completion triggers another call to 
 * <b>WinHttpReadData</b>, the situation can result in a stack overflow.  In general, it is best to use a read buffer that is comparable in size, or larger than the internal read buffer used by WinHTTP, which is 8 KB.
 * 
 * If you are using <b>WinHttpReadData</b> synchronously, and the return value is <b>TRUE</b> and the number of bytes read is zero, the transfer has been completed and there are no more bytes to read on the handle. This is analogous to reaching end-of-file in a local file. If you are using the function asynchronously, the <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nc-winhttp-winhttp_status_callback">WINHTTP_CALLBACK_STATUS_READ_COMPLETE</a> callback is called with the <i>dwStatusInformationLength</i> parameter set to zero when the end of a response is found. 
 * 
 * <b>WinHttpReadData</b> tries to fill the buffer pointed to by 
 * <i>lpBuffer</i> until there is no more data available from the response.  If sufficient data has not arrived from the server, the buffer is not filled.
 * 
 * For 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handles created by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a> function and sent by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsendrequest">WinHttpSendRequest</a>, a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a> must be made on the handle before 
 * <b>WinHttpReadData</b> can be used.
 * 
 * Single byte characters retrieved with 
 * <b>WinHttpReadData</b> are not converted to multi-byte characters.
 * 
 * When the read buffer is very small, <b>WinHttpReadData</b> may complete synchronously, and if the <b>WINHTTP_CALLBACK_STATUS_READ_COMPLETE</b> completion then triggers another call to <b>WinHttpReadData</b>, a stack overflow can result. It is best to use a read buffer that is 8 Kilobytes or larger in size.
 * 
 * If sufficient data has not arrived from the server, <b>WinHttpReadData</b> does not entirely fill the buffer pointed to by <i>lpBuffer</i>. The buffer must be large enough at least to hold the HTTP headers on the first read, and when reading HTML encoded directory entries, it must be large enough to hold at least one complete entry.
 * 
 * If a status callback function has been installed by using <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetstatuscallback">WinHttpSetStatusCallback</a>, then those of the following notifications  that  have been set in the <i>dwNotificationFlags</i> parameter of <b>WinHttpSetStatusCallback</b> indicate progress in checking for available data:
 * 
 * <ul>
 * <li>WINHTTP_CALLBACK_STATUS_RECEIVING_RESPONSE</li>
 * <li>WINHTTP_CALLBACK_STATUS_RESPONSE_RECEIVED</li>
 * <li>WINHTTP_CALLBACK_STATUS_CONNECTION_CLOSED</li>
 * <li>WINHTTP_CALLBACK_STATUS_READ_COMPLETE</li>
 * </ul>
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/win32/winhttp/winhttp-start-page#run-time-requirements">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @param {Pointer<Void>} hRequest Valid 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned from a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a>. <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpquerydataavailable">WinHttpQueryDataAvailable</a> must have been called for this handle and must have completed before <b>WinHttpReadData</b> is called. Although calling <b>WinHttpReadData</b> immediately after completion of <b>WinHttpReceiveResponse</b> avoids the expense of a buffer copy, doing so requires that the application use a fixed-length buffer for reading.
 * @param {Integer} lpBuffer Pointer to a buffer that receives the data read. Make sure that this buffer remains valid until <b>WinHttpReadData</b> has completed.
 * @param {Integer} dwNumberOfBytesToRead Unsigned long integer value that contains the number of bytes to read.
 * @param {Pointer<Integer>} lpdwNumberOfBytesRead Pointer to an unsigned long integer variable that receives the number of bytes read. 
 * <b>WinHttpReadData</b> sets this value to zero before doing any work or error checking.  When using WinHTTP asynchronously, always set this parameter to <b>NULL</b> and retrieve the information in the callback function; not doing so can cause a memory fault.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following table identifies the error codes that are returned.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_CONNECTION_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The connection with the server has been reset or terminated, or an incompatible SSL protocol was encountered. For example, WinHTTP 5.1 does not support SSL2 unless the client specifically enables it.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested operation cannot be carried out because the handle supplied is not in the correct state.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_RESPONSE_DRAIN_OVERFLOW</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned when an incoming response exceeds an internal WinHTTP size limit.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_TIMEOUT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request has timed out.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpreaddata
 * @since windows5.1.2600
 */
export WinHttpReadData(hRequest, lpBuffer, dwNumberOfBytesToRead, lpdwNumberOfBytesRead) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"
    lpdwNumberOfBytesReadMarshal := lpdwNumberOfBytesRead is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpReadData", hRequestMarshal, hRequest, "ptr", lpBuffer, "uint", dwNumberOfBytesToRead, lpdwNumberOfBytesReadMarshal, lpdwNumberOfBytesRead, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Reads data from a handle opened by the [WinHttpOpenRequest](/windows/win32/api/winhttp/nf-winhttp-winhttpopenrequest) function.
 * @remarks
 * By default, **WinHttpReadDataEx** returns after any amount of data has been written to the buffer that you provide (the function won't always completely fill the buffer that you provide).
 * @param {Pointer<Void>} hRequest Type: IN **[HINTERNET](/windows/win32/winhttp/hinternet-handles-in-winhttp)**
 * 
 * An **HINTERNET** handle returned from a previous call to [WinHttpOpenRequest](/windows/win32/api/winhttp/nf-winhttp-winhttpopenrequest).
 * 
 * <a href="https://docs.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a> or <a href="https://docs.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpquerydataavailable">WinHttpQueryDataAvailable</a> must have been called for this handle and must have completed before <b>WinHttpReadDataEx</b> is called. Although calling <b>WinHttpReadDataEx</b> immediately after completion of <b>WinHttpReceiveResponse</b> avoids the expense of a buffer copy, doing so requires that your application use a fixed-length buffer for reading.
 * @param {Integer} lpBuffer Type: \_Out\_writes\_bytes\_to\_(dwNumberOfBytesToRead, *lpdwNumberOfBytesRead) \_\_out\_data\_source(NETWORK) **[LPVOID](/windows/win32/winprog/windows-data-types)**
 * 
 * Pointer to a buffer that receives the data read. Make sure that this buffer remains valid until <b>WinHttpReadDataEx</b> has completed.
 * @param {Integer} dwNumberOfBytesToRead Type: IN **[DWORD](/windows/win32/winprog/windows-data-types)**
 * 
 * Unsigned long integer value that contains the number of bytes to read.
 * @param {Pointer<Integer>} lpdwNumberOfBytesRead Type: OUT **[LPDWORD](/windows/win32/winprog/windows-data-types)**
 * 
 * Pointer to an unsigned long integer variable that receives the number of bytes read. 
 * <b>WinHttpReadDataEx</b> sets this value to zero before doing any work or error checking. When using WinHTTP asynchronously, always set this parameter to <b>NULL</b> and retrieve the information in the callback function; not doing so can cause a memory fault.
 * @param {Integer} ullFlags Type: IN **[ULONGLONG](/windows/win32/winprog/windows-data-types)**
 * 
 * If you pass **WINHTTP_READ_DATA_EX_FLAG_FILL_BUFFER**, then WinHttp won't complete the call to **WinHttpReadDataEx** until the provided data buffer has been filled, or the response is complete. Passing this flag makes the behavior of this API equivalent to that of [WinHttpReadData](nf-winhttp-winhttpreaddata.md).
 * @param {Integer} cbProperty Type: IN **[DWORD](/windows/win32/winprog/windows-data-types)**
 * 
 * Reserved. Pass 0.
 * @param {Integer} pvProperty Type: \_In\_reads\_bytes\_opt\_(cbProperty) **[PVOID](/windows/win32/winprog/windows-data-types)**
 * 
 * Reserved. Pass NULL.
 * @returns {Integer} A status code indicating the result of the operation. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_CONNECTION_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The connection with the server has been reset or terminated, or an incompatible SSL protocol was encountered. For example, WinHTTP 5.1 does not support SSL2 unless the client specifically enables it.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested operation cannot be carried out because the handle supplied is not in the correct state.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_RESPONSE_DRAIN_OVERFLOW</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned when an incoming response exceeds an internal WinHTTP size limit.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_TIMEOUT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request has timed out.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpreaddataex
 */
export WinHttpReadDataEx(hRequest, lpBuffer, dwNumberOfBytesToRead, lpdwNumberOfBytesRead, ullFlags, cbProperty, pvProperty) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"
    lpdwNumberOfBytesReadMarshal := lpdwNumberOfBytesRead is VarRef ? "uint*" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpReadDataEx", hRequestMarshal, hRequest, "ptr", lpBuffer, "uint", dwNumberOfBytesToRead, lpdwNumberOfBytesReadMarshal, lpdwNumberOfBytesRead, "uint", ullFlags, "uint", cbProperty, "ptr", pvProperty, UInt32)
    return result
}

/**
 * The WinHttpWriteData function writes request data to an HTTP server.
 * @remarks
 * Even when  WinHTTP is  used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function can operate either synchronously or asynchronously.  If this function returns <b>FALSE</b>, you can call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information. If this function returns <b>TRUE</b>, use the WINHTTP_CALLBACK_STATUS_WRITE_COMPLETE completion to determine whether this function was successful and the value of the parameters.  The WINHTTP_CALLBACK_STATUS_REQUEST_ERROR completion indicates that the operation completed asynchronously, but failed.
 * 
 * <div class="alert"><b>Warning</b>  When using WinHTTP asynchronously, always set the <i>lpdwNumberOfBytesWritten</i> parameter to <b>NULL</b> and retrieve the bytes written in the callback function; otherwise, a memory fault can occur.</div>
 * <div> </div>
 * When the application is sending data, it can call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a> to end the data transfer.  If 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a> is called, then the data transfer is aborted.
 * 
 * If a status callback function has been installed with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetstatuscallback">WinHttpSetStatusCallback</a>, then those of the following notifications  that  have been set in the <i>dwNotificationFlags</i> parameter of <b>WinHttpSetStatusCallback</b> indicate progress in sending data to the server:
 * 
 * <ul>
 * <li>WINHTTP_CALLBACK_STATUS_RECEIVING_RESPONSE</li>
 * <li>WINHTTP_CALLBACK_STATUS_RESPONSE_RECEIVED</li>
 * <li>WINHTTP_CALLBACK_STATUS_DATA_WRITTEN </li>
 * <li>WINHTTP_CALLBACK_STATUS_SENDING_REQUEST</li>
 * <li>WINHTTP_CALLBACK_STATUS_REQUEST_SENT</li>
 * <li>WINHTTP_CALLBACK_STATUS_WRITE_COMPLETE</li>
 * </ul>
 * Two issues can arise when attempting to POST (or PUT) data to proxies or servers that challenge using NTLM or Negotiate authentication. 
 *  
 * First, these proxies or servers may send 401/407 challenges and close the connection before all the data can be POST'ed, in which case not only does <b>WinHttpWriteData</b> fail, but also WinHTTP cannot handle the authentication challenges. NTLM and Negotiate require that all authentication handshakes be exchanged on the same socket connection, so authentication fails if the connection is broken prematurely.
 * 
 * Secondly, NTLM and Negotiate may require multiple handshakes to complete authentication, which requires data to be re-POST'ed for each authentication legs. This  can be very inefficient for large data uploads.
 * 
 * To work around these two issues, one solution is to send an idempotent warm-up request such as HEAD to the authenticating v-dir first, handle the authentication challenges associated with this request, and only then POST data. As long as the same socket is re-used to handle the POST'ing,  no further authentication challenges should be encountered and all data can be uploaded at once. Since an authenticated socket can only be reused for subsequent requests within the same session, the POST should  go out in the same socket as long as the socket is not pooled with concurrent requests  competing for it.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHTTP start page.</div>
 * <div> </div>
 * @param {Pointer<Void>} hRequest Valid 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a>. Wait until <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsendrequest">WinHttpSendRequest</a> has completed before calling  this function.
 * @param {Integer} lpBuffer Pointer to a buffer that contains the data to be sent to the server. Be sure that this buffer remains valid until after <b>WinHttpWriteData</b> completes.
 * @param {Integer} dwNumberOfBytesToWrite Unsigned long integer value that contains the number of bytes to be written to the file.
 * @param {Pointer<Integer>} lpdwNumberOfBytesWritten Pointer to an unsigned long integer variable that receives the number of bytes written to the buffer. The 
 * <b>WinHttpWriteData</b> function sets this value to zero before doing any work or error checking.  When using WinHTTP asynchronously, this parameter must be set to <b>NULL</b> and retrieve the information in the callback function. Not doing so can cause a memory fault.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are:
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_CONNECTION_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The connection with the server has been reset or terminated, or an incompatible SSL protocol was encountered. For example, WinHTTP version 5.1 does not support SSL2 unless the client specifically enables it.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested operation cannot be carried out because the handle supplied is not in the correct state.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_TIMEOUT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request has timed out.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpwritedata
 * @since windows5.1.2600
 */
export WinHttpWriteData(hRequest, lpBuffer, dwNumberOfBytesToWrite, lpdwNumberOfBytesWritten) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"
    lpdwNumberOfBytesWrittenMarshal := lpdwNumberOfBytesWritten is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpWriteData", hRequestMarshal, hRequest, "ptr", lpBuffer, "uint", dwNumberOfBytesToWrite, lpdwNumberOfBytesWrittenMarshal, lpdwNumberOfBytesWritten, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Returns the amount of data, in bytes, available to be read with WinHttpReadData.
 * @remarks
 * Even when  WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function can operate either synchronously or asynchronously.  If it returns <b>FALSE</b>, it failed and you can call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information. If it returns <b>TRUE</b>, use the WINHTTP_CALLBACK_STATUS_DATA_AVAILABLE completion to determine whether this function was successful and the value of the parameters.  The WINHTTP_CALLBACK_STATUS_REQUEST_ERROR completion indicates that the operation completed asynchronously, but failed.
 * 
 * <div class="alert"><b>Warning</b>  When WinHTTP is used in asynchronous mode, always set the <i>lpdwNumberOfBytesAvailable</i> parameter to <b>NULL</b> and retrieve the bytes available in the callback function; otherwise, a memory fault can occur.</div>
 * <div> </div>
 * This function returns the number of bytes of data that are available to read immediately by a subsequent call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreaddata">WinHttpReadData</a>. If no data is available and the end of the file has not been reached, one of two things happens.  If the session is synchronous, the request waits until data becomes available. If the session is asynchronous, the function returns <b>TRUE</b>, and when data becomes available, calls the callback function with WINHTTP_STATUS_CALLBACK_DATA_AVAILABLE and indicates the number of bytes immediately available  to read by calling <b>WinHttpReadData</b>.
 * 
 * The amount of data that remains is not recalculated until all available data indicated by the call to 
 * <b>WinHttpQueryDataAvailable</b> is read.
 * 
 * Use the return value of <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreaddata">WinHttpReadData</a> to determine when a response has been completely read. 
 * 
 * <div class="alert"><b>Important</b>  Do not use the return value of <b>WinHttpQueryDataAvailable</b> to determine whether the end of a response has been reached, because not all servers terminate responses properly, and an improperly terminated response causes <b>WinHttpQueryDataAvailable</b> to anticipate more data.</div>
 * <div> </div>
 * For 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handles created by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a> function and sent by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsendrequest">WinHttpSendRequest</a>, a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a> must be made on the handle before 
 * <b>WinHttpQueryDataAvailable</b> can be used.
 * 
 * If a status callback function has been installed with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetstatuscallback">WinHttpSetStatusCallback</a>, then those of the following notifications  that  have been set in the <i>dwNotificationFlags</i> parameter of <b>WinHttpSetStatusCallback</b> indicate progress in checking for available data:
 * 
 * <ul>
 * <li>WINHTTP_CALLBACK_STATUS_RECEIVING_RESPONSE</li>
 * <li>WINHTTP_CALLBACK_STATUS_RESPONSE_RECEIVED</li>
 * <li>WINHTTP_CALLBACK_STATUS_DATA_AVAILABLE</li>
 * </ul>
 * <div class="alert"><b>Note</b>  For more information about Windows XP and Windows 2000, see <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a>.</div>
 * <div> </div>
 * @param {Pointer<Void>} hRequest A valid 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a>. <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a> must have been called for this handle and have completed before <b>WinHttpQueryDataAvailable</b> is called.
 * @param {Pointer<Integer>} lpdwNumberOfBytesAvailable A pointer to an unsigned long integer variable that receives the number of available bytes. When WinHTTP is used in asynchronous mode, always set this parameter to <b>NULL</b> and retrieve data in the callback function; not doing so can cause a memory fault.
 * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error data, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_CONNECTION_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The connection with the server has been reset or terminated, or an incompatible SSL protocol was encountered. For example, WinHTTP version 5.1 does not support SSL2 unless the client specifically enables it.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested operation cannot complete because the handle supplied is not in the correct state.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_TIMEOUT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request has timed out.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpquerydataavailable
 * @since windows5.1.2600
 */
export WinHttpQueryDataAvailable(hRequest, lpdwNumberOfBytesAvailable) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"
    lpdwNumberOfBytesAvailableMarshal := lpdwNumberOfBytesAvailable is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpQueryDataAvailable", hRequestMarshal, hRequest, lpdwNumberOfBytesAvailableMarshal, lpdwNumberOfBytesAvailable, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinHttpQueryOption function queries an Internet option on the specified handle.
 * @remarks
 * Even when  WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function operates synchronously. The return value indicates success or failure.  To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns the ERROR_INVALID_PARAMETER if an option flag that is invalid for the specified handle type is passed to the 
 * <i>dwOption</i> parameter.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @param {Pointer<Void>} hInternet An <b>HINTERNET</b> handle on which to query information. Note that this can be either a Session handle or a Request handle, depending on what option is being queried; see the  <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">Option Flags</a> topic to determine which handle is appropriate to use in querying a particular option.
 * @param {Integer} dwOption An unsigned long integer value that contains the Internet option to query. This can be one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">Option Flags</a> values.
 * @param {Integer} lpBuffer A pointer to a buffer that receives the option setting. Strings returned by the 
 * <b>WinHttpQueryOption</b> function are globally allocated, so the calling application must globally free the string when it finishes using it. Setting this parameter to <b>NULL</b> causes this function to return <b>FALSE</b>.  Calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> then returns ERROR_INSUFFICIENT_BUFFER and 
 * <i>lpdwBufferLength</i>          contains the number of bytes required to hold the requested information.
 * @param {Pointer<Integer>} lpdwBufferLength A pointer to an unsigned long integer variable that contains the length of 
 * <i>lpBuffer</i>, in bytes. When the function returns, the variable receives the length of the data placed into 
 * <i>lpBuffer</i>. If 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INSUFFICIENT_BUFFER, this parameter receives the number of bytes required to hold the requested information.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following:
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested operation cannot be carried out because the handle supplied is not in the correct state.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INVALID_OPTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid option value was specified.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpqueryoption
 * @since windows5.1.2600
 */
export WinHttpQueryOption(hInternet, dwOption, lpBuffer, lpdwBufferLength) {
    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
    lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpQueryOption", hInternetMarshal, hInternet, "uint", dwOption, "ptr", lpBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinHttpSetOption function sets an Internet option.
 * @remarks
 * Credentials passed to <b>WinHttpSetOption</b> could be unexpectedly sent in plaintext. It is  strongly recommended that you  use <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryauthschemes">WinHttpQueryAuthSchemes</a>  and <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetcredentials">WinHttpSetCredentials</a> instead of <b>WinHttpSetOption</b> for setting credentials.
 * 
 * <div class="alert"><b>Note</b>  When using Passport authentication, however, a WinHTTP application responding to a 407 status code must use <b>WinHttpSetOption</b> to provide proxy credentials rather than <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetcredentials">WinHttpSetCredentials</a>. This is only true when using Passport authentication; in all other circumstances,  use <b>WinHttpSetCredentials</b>.</div>
 * <div> </div>
 * Even when  WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function operates synchronously. The return value indicates success or failure.  To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns the error ERROR_INVALID_PARAMETER if an option flag is specified that cannot be set.
 * 
 * For more information and code examples that show the use of <b>WinHttpSetOption</b>, see <a href="https://docs.microsoft.com/windows/desktop/WinHttp/authentication-in-winhttp">Authentication in WinHTTP</a>.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @param {Pointer<Void>} hInternet The <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle on which to set data. Be aware  that this can be either a Session handle or a Request handle, depending on what option is being set. For more information about how to determine which handle is appropriate to use in setting a particular option, see the  <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">Option Flags</a>.
 * @param {Integer} dwOption An unsigned long integer value that contains the Internet option to set. This can be one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">Option Flags</a> values.
 * @param {Pointer<Void>} lpBuffer A pointer to a buffer that contains the option setting.
 * @param {Integer} dwBufferLength Unsigned long integer value that contains the length of the 
 * <i>lpBuffer</i> buffer. The length of the buffer is specified in characters for the following options; for all other options, the length is specified in bytes.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following:
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested operation cannot be carried out because the handle supplied is not in the correct state.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INVALID_OPTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A request to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption">WinHttpQueryOption</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetoption">WinHttpSetOption</a> specified an invalid option value.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A parameter is not valid.
 * 
 * This value will be returned if <b>WINHTTP_OPTION_WEB_SOCKET_KEEPALIVE_INTERVAL</b> is set to a value lower than 15000.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_OPTION_NOT_SETTABLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested option cannot be set, only queried.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A parameter is not valid.
 * 
 * This value will be returned if <b>WINHTTP_OPTION_WEB_SOCKET_KEEPALIVE_INTERVAL</b> is set to a value lower than 15000.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpsetoption
 * @since windows5.1.2600
 */
export WinHttpSetOption(hInternet, dwOption, lpBuffer, dwBufferLength) {
    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
    lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpSetOption", hInternetMarshal, hInternet, "uint", dwOption, lpBufferMarshal, lpBuffer, "uint", dwBufferLength, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets time-outs involved with HTTP transactions.
 * @remarks
 * Even when  WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function operates synchronously. The return value indicates success or failure.  To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * A value of 0 or -1 sets a time-out to wait infinitely.  A value greater than 0 sets the time-out value in milliseconds.  For example, 30,000 would set the time-out to 30 seconds.  All negative values other than -1 cause the function to fail with ERROR_INVALID_PARAMETER.
 * 
 * <div class="alert"><b>Important</b>  If a small timeout is set using <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetoption">WinHttpSetOption</a> and <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">WINHTTP_OPTION_RECEIVE_TIMEOUT</a>, it can override the value set with the <i>dwReceiveTimeout</i> parameter, causing a response to terminate earlier than expected. To avoid this, do not set a timeout with the <b>WINHTTP_OPTION_RECEIVE_TIMEOUT</b> option that is smaller than the value set using <i>dwReceiveTimeout</i>.</div>
 * <div> </div>
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHTTP start page.</div>
 * <div> </div>
 * @param {Pointer<Void>} hInternet The <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a>.
 * @param {Integer} nResolveTimeout A value of type integer that specifies the time-out value, in milliseconds, to use for name resolution. If resolution takes longer than this time-out value, the action is canceled. The initial value is zero, meaning no time-out (infinite). 
 * 
 * <b>Windows Vista and Windows XP:  </b>If DNS timeout is specified using NAME_RESOLUTION_TIMEOUT, there is an overhead of one thread per request.
 * @param {Integer} nConnectTimeout A value of type integer that specifies the time-out value, in milliseconds, to use for server connection requests. If a connection request takes longer than this time-out value, the request is canceled. The initial value is 60,000 (60 seconds).
 * 
 * TCP/IP can time out while setting up the socket during the three leg SYN/ACK exchange, regardless of the value of this parameter.
 * @param {Integer} nSendTimeout A value of type integer that specifies the time-out value, in milliseconds, to use for sending requests. If sending a request takes longer than this time-out value, the send is canceled. The initial value is 30,000 (30 seconds).
 * @param {Integer} nReceiveTimeout A value of type integer that specifies the time-out value, in milliseconds, to receive a response to a request. If a response takes longer than this time-out value, the request is canceled. The initial value is 30,000 (30 seconds).
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested operation cannot be carried out because the handle supplied is not in the correct state.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more of the timeout parameters has a negative value other than -1.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpsettimeouts
 * @since windows5.1.2600
 */
export WinHttpSetTimeouts(hInternet, nResolveTimeout, nConnectTimeout, nSendTimeout, nReceiveTimeout) {
    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpSetTimeouts", hInternetMarshal, hInternet, "int", nResolveTimeout, "int", nConnectTimeout, "int", nSendTimeout, "int", nReceiveTimeout, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinHttpOpenRequest function creates an HTTP request handle.
 * @remarks
 * The return value indicates success or failure.  To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * The 
 * <b>WinHttpOpenRequest</b> function creates a new HTTP request handle and stores the specified parameters in that handle. An HTTP request handle holds a request to send to an HTTP server and contains all <a href="https://www.ietf.org/rfc/rfc0822.txt">RFC822</a>/MIME/HTTP headers to be sent as part of the request.
 * 
 * If 
 * <i>pwszVerb</i> is set to "HEAD", the Content-Length header is ignored.
 * 
 * If a status callback function has been installed with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetstatuscallback">WinHttpSetStatusCallback</a>, then a <b>WINHTTP_CALLBACK_STATUS_HANDLE_CREATED</b> notification indicates that 
 * <b>WinHttpOpenRequest</b> has created a request handle.
 * 
 * After the calling application finishes using the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by 
 * <b>WinHttpOpenRequest</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a> function.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @param {Pointer<Void>} hConnect <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> connection handle to an HTTP session returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpconnect">WinHttpConnect</a>.
 * @param {PWSTR} pwszVerb Pointer to a string that contains the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/glossary">HTTP verb</a> to use in the request. If this parameter is <b>NULL</b>, the function uses GET as the <i>HTTP verb</i>. <b>Note</b>  This string should be all uppercase. Many servers treat HTTP verbs as case-sensitive, and the Internet Engineering Task Force (IETF)  Requests for Comments (RFCs) spell these verbs using uppercase characters only.
 * @param {PWSTR} pwszObjectName Pointer to a string that contains the name of the target resource of the specified HTTP verb. This is generally a file name, an executable module, or a search specifier.
 * @param {PWSTR} pwszVersion Pointer to a string that contains the HTTP version. If this parameter is <b>NULL</b>, the function uses HTTP/1.1.
 * @param {PWSTR} pwszReferrer Pointer to a string that specifies the URL of the document from which the URL in the request 
 * <i>pwszObjectName</i> was obtained. If this parameter is set to <b>WINHTTP_NO_REFERER</b>, no referring document is specified.
 * @param {Pointer<PWSTR>} ppwszAcceptTypes Pointer to a <b>null</b>-terminated array of string pointers that specifies media types accepted by the client. If this parameter is set to <b>WINHTTP_DEFAULT_ACCEPT_TYPES</b>, no types are accepted by the client. Typically, servers handle a lack of accepted types as indication that the client accepts only documents of type "text//"; that is, only text documents—no pictures or other binary files. For a list of valid media types, see Media Types defined by IANA at http://www.iana.org/assignments/media-types/.
 * @param {WINHTTP_OPEN_REQUEST_FLAGS} dwFlags 
 * @returns {Pointer<Void>} Returns a valid HTTP request handle if successful, or <b>NULL</b> if not. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INVALID_URL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_UNRECOGNIZED_SCHEME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL specified a scheme other than "http:" or "https:".
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpopenrequest
 * @since windows5.1.2600
 */
export WinHttpOpenRequest(hConnect, pwszVerb, pwszObjectName, pwszVersion, pwszReferrer, ppwszAcceptTypes, dwFlags) {
    pwszVerb := pwszVerb is String ? StrPtr(pwszVerb) : pwszVerb
    pwszObjectName := pwszObjectName is String ? StrPtr(pwszObjectName) : pwszObjectName
    pwszVersion := pwszVersion is String ? StrPtr(pwszVersion) : pwszVersion
    pwszReferrer := pwszReferrer is String ? StrPtr(pwszReferrer) : pwszReferrer

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"
    ppwszAcceptTypesMarshal := ppwszAcceptTypes is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpOpenRequest", hConnectMarshal, hConnect, "ptr", pwszVerb, "ptr", pwszObjectName, "ptr", pwszVersion, "ptr", pwszReferrer, ppwszAcceptTypesMarshal, ppwszAcceptTypes, WINHTTP_OPEN_REQUEST_FLAGS, dwFlags, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Adds one or more HTTP request headers to the HTTP request handle. (WinHttpAddRequestHeaders)
 * @remarks
 * Headers are transferred across redirects. This can be a security issue. To avoid having headers transferred when a redirect occurs, use the  <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nc-winhttp-winhttp_status_callback">WINHTTP_STATUS_CALLBACK</a> callback to correct the specific headers when a  redirect occurs.
 * 
 * Even when WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function operates synchronously. The return value indicates success or failure.  To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * The 
 * <b>WinHttpAddRequestHeaders</b> function appends additional free-format headers to the HTTP request handle and is intended for use by sophisticated clients that require detailed control over the exact request sent to the HTTP server.
 * 
 * The name and value of request headers added with this function are validated.  Headers must be well formed. For more information about valid HTTP headers, see 
 * <a href="https://www.ietf.org/rfc/rfc2616.txt">RFC 2616</a>.  If an invalid header is used, this function fails and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/error-messages">ERROR_INVALID_PARAMETER</a>.  The invalid header is not added.
 * 
 * If you are sending a Date: request header, you can use the <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttptimefromsystemtime">WinHttpTimeFromSystemTime</a> function to create structure for the header.
 * 
 * For basic 
 * <b>WinHttpAddRequestHeaders</b>, the application can pass in multiple headers in a single buffer. 
 * 
 * An application can also use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsendrequest">WinHttpSendRequest</a> to add additional headers to the HTTP request handle before sending a request.
 * 
 * <div class="alert"><b>Note</b>  For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a>.</div>
 * <div> </div>
 * @param {Pointer<Void>} hRequest A <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a> function.
 * @param {PWSTR} lpszHeaders A pointer to a string variable that contains the headers to append to the request. Each header except the last must be terminated by a carriage return/line feed (CR/LF).
 * @param {Integer} dwHeadersLength An unsigned long integer value that contains the length, in characters, of 
 * <i>pwszHeaders</i>. If this parameter is -1L, the function assumes that 
 * <i>pwszHeaders</i> is zero-terminated (ASCIIZ), and the length is computed.
 * @param {Integer} dwModifiers An unsigned long integer value that contains the flags used to modify the semantics of this function. Can be one or more of the following flags.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_ADD"></a><a id="winhttp_addreq_flag_add"></a><dl>
 * <dt><b>WINHTTP_ADDREQ_FLAG_ADD</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Adds the header if it does not exist. Used with 
 * <b>WINHTTP_ADDREQ_FLAG_REPLACE</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_ADD_IF_NEW"></a><a id="winhttp_addreq_flag_add_if_new"></a><dl>
 * <dt><b>WINHTTP_ADDREQ_FLAG_ADD_IF_NEW</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Adds the header only if it does not already exist; otherwise, an error is returned.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_COALESCE"></a><a id="winhttp_addreq_flag_coalesce"></a><dl>
 * <dt><b>WINHTTP_ADDREQ_FLAG_COALESCE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Merges headers of the same name.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA"></a><a id="winhttp_addreq_flag_coalesce_with_comma"></a><dl>
 * <dt><b>WINHTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Merges headers of the same name using a comma. For example, adding "Accept: text//" followed by "Accept: audio//" with this flag results in a single header "Accept: text//, audio//". This causes the first header found to be merged. The calling application must  to ensure a cohesive scheme with respect to merged and separate headers.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON"></a><a id="winhttp_addreq_flag_coalesce_with_semicolon"></a><dl>
 * <dt><b>WINHTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Merges headers of the same name using a semicolon.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_REPLACE"></a><a id="winhttp_addreq_flag_replace"></a><dl>
 * <dt><b>WINHTTP_ADDREQ_FLAG_REPLACE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Replaces or removes a header. If the header value is empty and the header is found, it is removed. If the value is not empty, it is replaced.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested operation cannot be performed because the handle supplied is not in the correct state.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpaddrequestheaders
 * @since windows5.1.2600
 */
export WinHttpAddRequestHeaders(hRequest, lpszHeaders, dwHeadersLength, dwModifiers) {
    lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpAddRequestHeaders", hRequestMarshal, hRequest, "ptr", lpszHeaders, "uint", dwHeadersLength, "uint", dwModifiers, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Adds one or more HTTP request headers to an HTTP request handle, allowing you to use separate name/value strings.
 * @param {Pointer<Void>} hRequest Type: IN **[HINTERNET](/windows/win32/winhttp/hinternet-handles-in-winhttp)**
 * 
 * An **HINTERNET** handle returned by a call to [WinHttpOpenRequest](/windows/win32/api/winhttp/nf-winhttp-winhttpopenrequest).
 * @param {Integer} dwModifiers Type: IN **[DWORD](/windows/win32/winprog/windows-data-types)**
 * 
 * An unsigned long integer value that contains the flags used to modify the semantics of this function. Can be one or more of the following flags.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_ADD"></a><a id="winhttp_addreq_flag_add"></a><dl>
 * <dt><b>WINHTTP_ADDREQ_FLAG_ADD</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Adds the header if it does not exist. Used with 
 * <b>WINHTTP_ADDREQ_FLAG_REPLACE</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_ADD_IF_NEW"></a><a id="winhttp_addreq_flag_add_if_new"></a><dl>
 * <dt><b>WINHTTP_ADDREQ_FLAG_ADD_IF_NEW</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Adds the header only if it does not already exist; otherwise, an error is returned.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_COALESCE"></a><a id="winhttp_addreq_flag_coalesce"></a><dl>
 * <dt><b>WINHTTP_ADDREQ_FLAG_COALESCE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Merges headers of the same name.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA"></a><a id="winhttp_addreq_flag_coalesce_with_comma"></a><dl>
 * <dt><b>WINHTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Merges headers of the same name using a comma. For example, adding "Accept: text//" followed by "Accept: audio//" with this flag results in a single header "Accept: text//, audio//". This causes the first header found to be merged. The calling application must  to ensure a cohesive scheme with respect to merged and separate headers.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON"></a><a id="winhttp_addreq_flag_coalesce_with_semicolon"></a><dl>
 * <dt><b>WINHTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Merges headers of the same name using a semicolon.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_REPLACE"></a><a id="winhttp_addreq_flag_replace"></a><dl>
 * <dt><b>WINHTTP_ADDREQ_FLAG_REPLACE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Replaces or removes a header. If the header value is empty and the header is found, it is removed. If the value is not empty, it is replaced.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} ullFlags Type: IN **[ULONGLONG](/windows/win32/winprog/windows-data-types)**
 * 
 * Pass **WINHTTP_EXTENDED_HEADER_FLAG_UNICODE** to indicate that the strings passed in are Unicode strings.
 * @param {Integer} ullExtra Type: IN **[ULONGLONG](/windows/win32/winprog/windows-data-types)**
 * 
 * Reserved.
 * @param {Integer} cHeaders Type: IN **[DWORD](/windows/win32/winprog/windows-data-types)**
 * 
 * The number of elements in *pHeaders*.
 * @param {Pointer<WINHTTP_EXTENDED_HEADER>} pHeaders Type: \_In\_reads\_(cHeaders) **[WINHTTP_EXTENDED_HEADER](/windows/win32/api/winhttp/ns-winhttp-winhttp_extended_header)\***
 * 
 * An array of **WINHTTP_EXTENDED_HEADER** structures.
 * @returns {Integer} A status code indicating the result of the operation. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested operation cannot be performed because the handle supplied is not in the correct state.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpaddrequestheadersex
 */
export WinHttpAddRequestHeadersEx(hRequest, dwModifiers, ullFlags, ullExtra, cHeaders, pHeaders) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpAddRequestHeadersEx", hRequestMarshal, hRequest, "uint", dwModifiers, "uint", ullFlags, "uint", ullExtra, "uint", cHeaders, WINHTTP_EXTENDED_HEADER.Ptr, pHeaders, UInt32)
    return result
}

/**
 * Sends the specified request to the HTTP server. (WinHttpSendRequest)
 * @remarks
 * Even when WinHTTP is used in asynchronous mode, that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>, this function can operate either synchronously or asynchronously.  In either case, if the request is sent successfully, the application is called back with the completion status set to <b>WINHTTP_CALLBACK_STATUS_SENDREQUEST_COMPLETE</b>. The <b>WINHTTP_CALLBACK_STATUS_REQUEST_ERROR</b> completion indicates that the operation completed asynchronously, but failed.  Upon receiving the <b>WINHTTP_CALLBACK_STATUS_SENDREQUEST_COMPLETE</b> status callback, the application can start to receive a response from the server with <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a>. Before then, no other asynchronous functions can be called, otherwise, <b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b> is returned. 
 * 
 * An application must not delete or alter the buffer pointed to by <i>lpOptional</i> until the request handle is closed or the call to <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a> has completed, because an authentication challenge or redirect that required the optional data could be encountered in the course of receiving the response. If the operation must be aborted with <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a>, the application must keep the buffer valid until it receives the callback  <b>WINHTTP_CALLBACK_STATUS_REQUEST_ERROR</b> with an <b>ERROR_WINHTTP_OPERATION_CANCELLED</b> error code.
 * 
 * If  WinHTTP  is used synchronously, that is, when <b>WINHTP_FLAG_ASYNC</b> was not set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>, an application is not called with a completion status even if a callback function is registered. While in this mode, the application can call <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a> when <b>WinHttpSendRequest</b> returns.
 * 
 * The 
 * <b>WinHttpSendRequest</b> function sends the specified request to the HTTP server and allows the client to specify additional headers to send along with the request.
 * 
 * This function also lets the client specify optional data to send to the HTTP server immediately following the request headers. This feature is generally used for write operations such as PUT and POST.
 * 
 * An application can use the same HTTP request handle in multiple calls to 
 * <b>WinHttpSendRequest</b> to re-send the same request, but the application must read all data returned from the previous call before calling this function again.
 * 
 * The name and value of request headers added with this function are validated.  Headers must be well formed.  For more information about valid HTTP headers, see 
 * <a href="https://www.ietf.org/rfc/rfc2616.txt">RFC 2616</a>.  If an invalid header is used, this function fails and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/error-messages">ERROR_INVALID_PARAMETER</a>.  The invalid header is not added.
 * 
 * <b>Windows 2000:  </b>When sending requests from multiple threads, there may be a significant decrease in network and CPU performance.  
 * 
 * <b>Windows XP and Windows 2000:  </b>See <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a>.
 * 
 * <h3><a id="WinHttpSetStatusCallback"></a><a id="winhttpsetstatuscallback"></a><a id="WINHTTPSETSTATUSCALLBACK"></a>WinHttpSetStatusCallback</h3>
 * If a status callback function has been installed with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetstatuscallback">WinHttpSetStatusCallback</a>, then those of the following notifications  that  have been set in the <i>dwNotificationFlags</i> parameter of <b>WinHttpSetStatusCallback</b>  indicate the progress in sending the request:
 * 
 * <ul>
 * <li>WINHTTP_CALLBACK_STATUS_DETECTING_PROXY (not implemented)</li>
 * <li>WINHTTP_CALLBACK_STATUS_SENDREQUEST_COMPLETE (only in asynchronous mode)</li>
 * <li>WINHTTP_CALLBACK_STATUS_REDIRECT</li>
 * <li>WINHTTP_CALLBACK_STATUS_SECURE_FAILURE</li>
 * <li>WINHTTP_CALLBACK_STATUS_INTERMEDIATE_RESPONSE</li>
 * </ul>
 * <div class="alert"><b>Note</b>  On Windows 7 and Windows Server 2008 R2, all of the following notifications are deprecated.</div>
 * <div> </div>
 * <ul>
 * <li>WINHTTP_CALLBACK_STATUS_RESOLVING_NAME</li>
 * <li>WINHTTP_CALLBACK_STATUS_NAME_RESOLVED</li>
 * <li>WINHTTP_CALLBACK_STATUS_CONNECTING_TO_SERVER</li>
 * <li>WINHTTP_CALLBACK_STATUS_CONNECTED_TO_SERVER</li>
 * <li>WINHTTP_CALLBACK_STATUS_SENDING_REQUEST</li>
 * <li>WINHTTP_CALLBACK_STATUS_REQUEST_SENT</li>
 * <li>WINHTTP_CALLBACK_STATUS_RECEIVING_RESPONSE</li>
 * <li>WINHTTP_CALLBACK_STATUS_RESPONSE_RECEIVED</li>
 * </ul>
 * If the server closes the connection, the following notifications are also sent, provided that they  have been set in the <i>dwNotificationFlags</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetstatuscallback">WinHttpSetStatusCallback</a>:
 * 
 * <ul>
 * <li>WINHTTP_CALLBACK_STATUS_CLOSING_CONNECTION</li>
 * <li>WINHTTP_CALLBACK_STATUS_CONNECTION_CLOSED</li>
 * </ul>
 * <h3><a id="Support_for_Greater_Than_4-GB_Upload"></a><a id="support_for_greater_than_4-gb_upload"></a><a id="SUPPORT_FOR_GREATER_THAN_4-GB_UPLOAD"></a>Support for Greater Than 4-GB Upload</h3>
 * Starting in Windows Vista and Windows Server 2008, WinHttp supports uploading files up to the size of a LARGE_INTEGER (2^64 bytes) using the Content-Length header. Payload lengths specified in the call to <b>WinHttpSendRequest</b> are limited to the size of a <b>DWORD</b> (2^32 bytes). To upload data to a URL larger than a <b>DWORD</b>, the application must provide the length in the Content-Length header of the request. In this case, the WinHttp client application calls <b>WinHttpSendRequest</b> with the <i>dwTotalLength</i> parameter set to <b>WINHTTP_IGNORE_REQUEST_TOTAL_LENGTH</b>.
 * 
 * If the Content-Length header specifies a length less than a 2^32, the application must also specify the content length in the call to <b>WinHttpSendRequest</b>. If the <i>dwTotalLength</i> parameter does not match the length specified in the Content-Length header, the call fails and returns <b>ERROR_INVALID_PARAMETER</b>.
 * 
 * The Content-Length header can be added in the call to <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpaddrequestheaders">WinHttpAddRequestHeaders</a>, or it can be specified in the <i>lpszHeader</i> parameter of <b>WinHttpSendRequest</b> as shown in the following code example.
 * 
 * 
 * ``` syntax
 * BOOL fRet = WinHttpSendRequest(
 * 			hReq,
 * 			L"Content-Length: 68719476735\r\n",
 * 			-1L,
 * 			WINHTTP_NO_REQUEST_DATA,
 * 			0,
 * 			WINHTTP_IGNORE_REQUEST_TOTAL_LENGTH,
 * 			pMyContent);
 * ```
 * 
 * <h3><a id="Transfer-Encoding_Header"></a><a id="transfer-encoding_header"></a><a id="TRANSFER-ENCODING_HEADER"></a>Transfer-Encoding Header</h3>
 * Starting in Windows Vista and Windows Server 2008, WinHttp enables applications to perform chunked transfer encoding on data sent to the server. When the Transfer-Encoding header is present on the WinHttp request, the <i>dwTotalLength</i> parameter in the call to <b>WinHttpSendRequest</b> is set to <b>WINHTTP_IGNORE_REQUEST_TOTAL_LENGTH</b> and the application sends the entity body in one or more calls to <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwritedata">WinHttpWriteData</a>. The <i>lpOptional</i> parameter of <b>WinHttpSendRequest</b> must be <b>NULL</b> and the <i>dwOptionLength</i> parameter must be zero, otherwise an <b>ERROR_WINHTTP_INVALID_PARAMETER</b> error is returned. To terminate the chunked data transfer, the application generates a zero length chunk and sends it in the last call to <b>WinHttpWriteData</b>.
 * @param {Pointer<Void>} hRequest An <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a>.
 * @param {PWSTR} lpszHeaders A pointer to a string  that contains the additional headers to append to the request. This parameter can be <b>WINHTTP_NO_ADDITIONAL_HEADERS</b> if there are no additional headers to append.
 * @param {Integer} dwHeadersLength An unsigned long integer value that contains the length, in characters, of the additional headers. If this parameter is <b>-1L</b> and 
 * <i>pwszHeaders</i> is not <b>NULL</b>, this function assumes that 
 * <i>pwszHeaders</i> is <b>null</b>-terminated, and the length is calculated.
 * @param {Integer} lpOptional A pointer to a buffer that contains any optional data to send immediately after the request headers. This parameter is generally used for POST and PUT operations. The optional data can be the resource or data posted to the server. This parameter can be <b>WINHTTP_NO_REQUEST_DATA</b> if there is no optional data to send.
 * 
 * If the <i>dwOptionalLength</i> parameter is 0, this parameter is ignored and set to <b>NULL</b>.
 * 
 * This buffer must remain available until the request handle is closed or the call to <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a> has completed.
 * @param {Integer} dwOptionalLength An unsigned long integer value that contains the length, in bytes, of the optional data. This parameter can be zero if there is no optional data to send.
 * 
 * This parameter must contain a valid length when the <i>lpOptional</i> parameter is not <b>NULL</b>. Otherwise, <i>lpOptional</i> is ignored and set to <b>NULL</b>.
 * @param {Integer} dwTotalLength An unsigned long integer value that contains the length, in bytes, of the total data sent.  This parameter specifies the Content-Length header of the request.  If the value of this parameter is greater than the length specified by 
 * <i>dwOptionalLength</i>, then 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwritedata">WinHttpWriteData</a> can be used to send additional data.
 * 
 * <i>dwTotalLength</i> must not change between calls to <b>WinHttpSendRequest</b> for the same request.  If <i>dwTotalLength</i> needs to be changed, the caller should create a new request.
 * @param {Pointer} dwContext A pointer to a pointer-sized variable that contains an application-defined value that is passed, with the request handle, to any callback functions.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Error codes are listed in the following table.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_CANNOT_CONNECT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned if  connection to the server failed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_CLIENT_AUTH_CERT_NEEDED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The secure HTTP server requires a client certificate. The application retrieves the list of certificate issuers by calling <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption">WinHttpQueryOption</a> with the <b>WINHTTP_OPTION_CLIENT_CERT_ISSUER_LIST</b> option.
 * 
 * If the server requests the client certificate, but does not require it, the application can alternately call <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetoption">WinHttpSetOption</a> with the <b>WINHTTP_OPTION_CLIENT_CERT_CONTEXT</b> option. In this case, the application specifies the WINHTTP_NO_CLIENT_CERT_CONTEXT macro in the <i>lpBuffer</i> parameter of <b>WinHttpSetOption</b>. For more information, see the <b>WINHTTP_OPTION_CLIENT_CERT_CONTEXT</b> option.<b>Windows Server 2003 with SP1, Windows XP with SP2 and Windows 2000:  </b>This error is not supported.
 * 
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_CONNECTION_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The connection with the server has been reset or terminated, or an incompatible SSL protocol was encountered. For example, WinHTTP version 5.1 does not support SSL2 unless the client specifically enables it.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested operation cannot be carried out because the handle supplied is not in the correct state.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INVALID_URL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_LOGIN_FAILURE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The login attempt failed.  When this error is encountered, the request handle should be closed with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a>.  A new request handle must be created before retrying the function that originally produced this error.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_NAME_NOT_RESOLVED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The server name cannot be resolved.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_RESPONSE_DRAIN_OVERFLOW</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned when an incoming response exceeds an internal WinHTTP size limit.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_SECURE_FAILURE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more errors were found in the Secure Sockets Layer (SSL) certificate sent by the server.  To determine what type of error was encountered, verify through a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nc-winhttp-winhttp_status_callback">WINHTTP_CALLBACK_STATUS_SECURE_FAILURE</a> notification in a status callback function.  For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nc-winhttp-winhttp_status_callback">WINHTTP_STATUS_CALLBACK</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_SHUTDOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The WinHTTP function support is shut down or unloaded.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_TIMEOUT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request timed out.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_UNRECOGNIZED_SCHEME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL specified a scheme other than "http:" or "https:".
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * <b>Windows Server 2003, Windows XP and Windows 2000:  </b>The TCP reservation range set with the <b>WINHTTP_OPTION_PORT_RESERVATION</b> option is not large enough to send this request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The content length specified in the <i>dwTotalLength</i> parameter does not match the length specified in the Content-Length header.
 * 
 * The <i>lpOptional</i> parameter must be <b>NULL</b> and the <i>dwOptionalLength</i> parameter must be zero when the Transfer-Encoding header is present.
 * 
 * The Content-Length header cannot be present when the Transfer-Encoding header is present. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b> ERROR_WINHTTP_RESEND_REQUEST</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 *  The application must call <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsendrequest">WinHttpSendRequest</a> again due to a redirect or authentication challenge.
 * 
 * <b>Windows Server 2003 with SP1, Windows XP with SP2 and Windows 2000:  </b>This error is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpsendrequest
 * @since windows5.1.2600
 */
export WinHttpSendRequest(hRequest, lpszHeaders, dwHeadersLength, lpOptional, dwOptionalLength, dwTotalLength, dwContext) {
    lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpSendRequest", hRequestMarshal, hRequest, "ptr", lpszHeaders, "uint", dwHeadersLength, "ptr", lpOptional, "uint", dwOptionalLength, "uint", dwTotalLength, "ptr", dwContext, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinHttpSetCredentials function passes the required authorization credentials to the server.
 * @remarks
 * Even when  WinHTTP is  used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function operates synchronously. The return value indicates success or failure.  To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * The credentials set by <b>WinHttpSetCredentials</b> are only used for a single request; WinHTTP does not cache these credentials for use in subsequent requests. As a result, applications must be written so that they can respond to multiple challenges. If an authenticated connection is re-used, subsequent requests cannot be challenged, but your code should be able to respond to a challenge at any point.
 * 
 * For sample code that illustrates the use of <b>WinHttpSetCredentials</b>, see <a href="https://docs.microsoft.com/windows/desktop/WinHttp/authentication-in-winhttp">Authentication in WinHTTP</a>.
 * 
 * <div class="alert"><b>Note</b>  When using Passport authentication and responding to a 407 status code, a WinHTTP application must use <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetoption">WinHttpSetOption</a> to provide proxy credentials rather than <b>WinHttpSetCredentials</b>. This is only true when using Passport authentication; in all other circumstances,  use <b>WinHttpSetCredentials</b>, because <b>WinHttpSetOption</b>  is less secure.</div>
 * <div> </div>
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @param {Pointer<Void>} hRequest Valid 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a>.
 * @param {Integer} AuthTargets An unsigned integer that specifies a flag that contains the authentication target.  Can be one of the  values in the following table.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_TARGET_SERVER"></a><a id="winhttp_auth_target_server"></a><dl>
 * <dt><b>WINHTTP_AUTH_TARGET_SERVER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Credentials are passed to a server.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_TARGET_PROXY"></a><a id="winhttp_auth_target_proxy"></a><dl>
 * <dt><b>WINHTTP_AUTH_TARGET_PROXY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Credentials are passed to a proxy.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} AuthScheme An unsigned integer that specifies a flag that contains the authentication scheme.  Must be one of the supported authentication schemes returned from 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryauthschemes">WinHttpQueryAuthSchemes</a>. The following table identifies the possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_BASIC"></a><a id="winhttp_auth_scheme_basic"></a><dl>
 * <dt><b>WINHTTP_AUTH_SCHEME_BASIC</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Use basic authentication.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_NTLM"></a><a id="winhttp_auth_scheme_ntlm"></a><dl>
 * <dt><b>WINHTTP_AUTH_SCHEME_NTLM</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Use NTLM authentication.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_PASSPORT"></a><a id="winhttp_auth_scheme_passport"></a><dl>
 * <dt><b>WINHTTP_AUTH_SCHEME_PASSPORT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Use passport authentication.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_DIGEST"></a><a id="winhttp_auth_scheme_digest"></a><dl>
 * <dt><b>WINHTTP_AUTH_SCHEME_DIGEST</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Use digest authentication.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_NEGOTIATE"></a><a id="winhttp_auth_scheme_negotiate"></a><dl>
 * <dt><b>WINHTTP_AUTH_SCHEME_NEGOTIATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Selects between NTLM and Kerberos authentication.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {PWSTR} pwszUserName Pointer to a string that contains a valid user name.
 * @param {PWSTR} pwszPassword Pointer to a string that contains a valid password.  The password can be blank.
 * @param {Pointer<Void>} pAuthParams This parameter is reserved and must be <b>NULL</b>.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following table identifies the error codes returned.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested operation cannot be carried out because the handle supplied is not in the correct state.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation (Windows error code).
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpsetcredentials
 * @since windows5.1.2600
 */
export WinHttpSetCredentials(hRequest, AuthTargets, AuthScheme, pwszUserName, pwszPassword, pAuthParams) {
    pwszUserName := pwszUserName is String ? StrPtr(pwszUserName) : pwszUserName
    pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword

    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"
    pAuthParamsMarshal := pAuthParams is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpSetCredentials", hRequestMarshal, hRequest, "uint", AuthTargets, "uint", AuthScheme, "ptr", pwszUserName, "ptr", pwszPassword, pAuthParamsMarshal, pAuthParams, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinHttpQueryAuthSchemes function returns the authorization schemes that are supported by the server.
 * @remarks
 * Even when  WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> is set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function operates synchronously. The return value indicates success or failure.  To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * <b>WinHttpQueryAuthSchemes</b> cannot be used before calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryheaders">WinHttpQueryHeaders</a>.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000 see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @param {Pointer<Void>} hRequest Valid 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a>
 * @param {Pointer<Integer>} lpdwSupportedSchemes An unsigned integer that specifies a flag that contains the supported authentication schemes.  This parameter can return one or more flags that are identified in the following table.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_BASIC"></a><a id="winhttp_auth_scheme_basic"></a><dl>
 * <dt><b>WINHTTP_AUTH_SCHEME_BASIC</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates basic authentication is available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_NTLM"></a><a id="winhttp_auth_scheme_ntlm"></a><dl>
 * <dt><b>WINHTTP_AUTH_SCHEME_NTLM</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates NTLM authentication is available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_PASSPORT"></a><a id="winhttp_auth_scheme_passport"></a><dl>
 * <dt><b>WINHTTP_AUTH_SCHEME_PASSPORT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates passport authentication is available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_DIGEST"></a><a id="winhttp_auth_scheme_digest"></a><dl>
 * <dt><b>WINHTTP_AUTH_SCHEME_DIGEST</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates digest authentication is available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_NEGOTIATE"></a><a id="winhttp_auth_scheme_negotiate"></a><dl>
 * <dt><b>WINHTTP_AUTH_SCHEME_NEGOTIATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Selects between NTLM and Kerberos authentication.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} lpdwFirstScheme An unsigned integer that specifies a flag that contains the  first authentication scheme listed by the server.  This parameter can return one or more flags that are identified in the following table.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_BASIC"></a><a id="winhttp_auth_scheme_basic"></a><dl>
 * <dt><b>WINHTTP_AUTH_SCHEME_BASIC</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates basic authentication is first.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_NTLM"></a><a id="winhttp_auth_scheme_ntlm"></a><dl>
 * <dt><b>WINHTTP_AUTH_SCHEME_NTLM</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates NTLM authentication is first.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_PASSPORT"></a><a id="winhttp_auth_scheme_passport"></a><dl>
 * <dt><b>WINHTTP_AUTH_SCHEME_PASSPORT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates passport authentication is first.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_DIGEST"></a><a id="winhttp_auth_scheme_digest"></a><dl>
 * <dt><b>WINHTTP_AUTH_SCHEME_DIGEST</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates digest authentication is first.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_NEGOTIATE"></a><a id="winhttp_auth_scheme_negotiate"></a><dl>
 * <dt><b>WINHTTP_AUTH_SCHEME_NEGOTIATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Selects between NTLM and Kerberos authentication.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} pdwAuthTarget An unsigned integer that specifies a flag that contains the authentication target.  This parameter can return one or more flags that are identified in the following table.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_TARGET_SERVER"></a><a id="winhttp_auth_target_server"></a><dl>
 * <dt><b>WINHTTP_AUTH_TARGET_SERVER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Authentication target is a server. Indicates that a 401 status code has been received.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTH_TARGET_PROXY"></a><a id="winhttp_auth_target_proxy"></a><dl>
 * <dt><b>WINHTTP_AUTH_TARGET_PROXY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Authentication target is a proxy. Indicates that a 407 status code has been received.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> if unsuccessful. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following table identifies the error codes that are returned.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpqueryauthschemes
 * @since windows5.1.2600
 */
export WinHttpQueryAuthSchemes(hRequest, lpdwSupportedSchemes, lpdwFirstScheme, pdwAuthTarget) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"
    lpdwSupportedSchemesMarshal := lpdwSupportedSchemes is VarRef ? "uint*" : "ptr"
    lpdwFirstSchemeMarshal := lpdwFirstScheme is VarRef ? "uint*" : "ptr"
    pdwAuthTargetMarshal := pdwAuthTarget is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpQueryAuthSchemes", hRequestMarshal, hRequest, lpdwSupportedSchemesMarshal, lpdwSupportedSchemes, lpdwFirstSchemeMarshal, lpdwFirstScheme, pdwAuthTargetMarshal, pdwAuthTarget, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinHttpReceiveResponse function waits to receive the response to an HTTP request initiated by WinHttpSendRequest.
 * @remarks
 * Even when  WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function can operate either synchronously or asynchronously.  If this function returns <b>FALSE</b>, this function failed and you can call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information. If this function returns <b>TRUE</b>, the application should expect either the <b>WINHTTP_CALLBACK_STATUS_HEADERS_AVAILABLE</b> completion callback, indicating success, or the <b>WINHTTP_CALLBACK_STATUS_REQUEST_ERROR</b> completion callback, indicating that the operation completed asynchronously, but failed.
 * 
 * If a status callback function has been installed with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetstatuscallback">WinHttpSetStatusCallback</a>, then those of the following notifications  that  have been set in the <i>dwNotificationFlags</i> parameter of <b>WinHttpSetStatusCallback</b> indicate progress in receiving the response:
 * 
 * <ul>
 * <li>WINHTTP_CALLBACK_STATUS_RECEIVING_RESPONSE </li>
 * <li>WINHTTP_CALLBACK_STATUS_RESPONSE_RECEIVED</li>
 * <li>WINHTTP_CALLBACK_STATUS_HEADERS_AVAILABLE</li>
 * <li>WINHTTP_CALLBACK_STATUS_INTERMEDIATE_RESPONSE </li>
 * <li>WINHTTP_CALLBACK_STATUS_REDIRECT</li>
 * </ul>
 * If the server closes the connection, the following notifications will also be reported, provided that they have been set in the <i>dwNotificationFlags</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetstatuscallback">WinHttpSetStatusCallback</a>:
 * 
 * <ul>
 * <li>WINHTTP_CALLBACK_STATUS_CLOSING_CONNECTION</li>
 * <li>WINHTTP_CALLBACK_STATUS_CONNECTION_CLOSED</li>
 * </ul>
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @param {Pointer<Void>} hRequest <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a> and sent by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsendrequest">WinHttpSendRequest</a>.  Wait until <b>WinHttpSendRequest</b> has completed for this handle before calling  <b>WinHttpReceiveResponse</b>.
 * @param {Pointer<Void>} lpReserved This parameter is reserved and must be <b>NULL</b>.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_CANNOT_CONNECT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned if  connection to the server failed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_CHUNKED_ENCODING_HEADER_SIZE_OVERFLOW</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned when an overflow condition is encountered in the course of parsing chunked encoding.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_CLIENT_AUTH_CERT_NEEDED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned when the server requests client authentication.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_CONNECTION_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The connection with the server has been reset or terminated, or an incompatible SSL protocol was encountered. For example, WinHTTP version 5.1 does not support SSL2 unless the client specifically enables it.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_HEADER_COUNT_EXCEEDED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned when a larger number of headers were present in a response than WinHTTP could receive.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_HEADER_SIZE_OVERFLOW</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned by <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a> when the size of headers received  exceeds the limit for the request handle.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested operation cannot be carried out because the handle supplied is not in the correct state.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INVALID_SERVER_RESPONSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The server response could not be parsed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INVALID_URL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_LOGIN_FAILURE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The login attempt failed.  When this error is encountered, the request handle should be closed with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a>.  A new request handle must be created before retrying the function that originally produced this error.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_NAME_NOT_RESOLVED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The server name could not be resolved.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_REDIRECT_FAILED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The redirection failed because either the scheme changed or all attempts made to redirect failed (default is five attempts).
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_RESEND_REQUEST</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The WinHTTP function failed.  The desired function can be retried on the same request handle.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_RESPONSE_DRAIN_OVERFLOW</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned when an incoming response exceeds an internal WinHTTP size limit.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_SECURE_FAILURE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more errors were found in the Secure Sockets Layer (SSL) certificate sent by the server.  To determine what type of error was encountered, check for a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nc-winhttp-winhttp_status_callback">WINHTTP_CALLBACK_STATUS_SECURE_FAILURE</a> notification in a status callback function.  For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nc-winhttp-winhttp_status_callback">WINHTTP_STATUS_CALLBACK</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_TIMEOUT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request has timed out.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_UNRECOGNIZED_SCHEME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL specified a scheme other than "http:" or "https:".
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpreceiveresponse
 * @since windows5.1.2600
 */
export WinHttpReceiveResponse(hRequest, lpReserved) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"
    lpReservedMarshal := lpReserved is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpReceiveResponse", hRequestMarshal, hRequest, lpReservedMarshal, lpReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinHttpQueryHeaders function retrieves header information associated with an HTTP request.
 * @remarks
 * Even when  WinHTTP is used in asynchronous mode (that is, when <b>WINHTTP_FLAG_ASYNC</b> has been set in <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>), this function operates synchronously. The return value indicates success or failure.  To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * By default 
 * <b>WinHttpQueryHeaders</b> returns a string.  However, you can request data in the form of a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure or <b>DWORD</b> by including the appropriate modifier flag in 
 * <i>dwInfoLevel</i>.  The following table shows the possible data types that 
 * <b>WinHttpQueryHeaders</b> can return along with the modifier flag that you use to select that data type.
 * 
 *                 
 * 
 * 
 * <table class="clsStd">
 * <tr>
 * <th>Data type</th>
 * <th>Modifier flag</th>
 * </tr>
 * <tr>
 * <td><b>LPCWSTR</b></td>
 * <td>Default.  No modifier flag required.</td>
 * </tr>
 * <tr>
 * <td><b>SYSTEMTIME</b></td>
 * <td><b>WINHTTP_QUERY_FLAG_SYSTEMTIME</b></td>
 * </tr>
 * <tr>
 * <td><b>DWORD</b></td>
 * <td><b>WINHTTP_QUERY_FLAG_NUMBER</b></td>
 * </tr>
 * </table>
 *  
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @param {Pointer<Void>} hRequest <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> request handle returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a>. 
 * WinHttpReceiveResponse must have been called for this handle and have completed before <b>WinHttpQueryHeaders</b> is called.
 * @param {Integer} dwInfoLevel Value of type <b>DWORD</b> that specifies a combination of attribute and modifier flags listed on the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/query-info-flags">Query Info Flags</a> page. These attribute and modifier flags indicate that the information is being requested and how it is to be formatted.
 * @param {PWSTR} pwszName Pointer to a string that contains the header name. If the flag in 
 * <i>dwInfoLevel</i> is not 
 * <b>WINHTTP_QUERY_CUSTOM</b>, set this parameter to WINHTTP_HEADER_NAME_BY_INDEX.
 * @param {Integer} lpBuffer Pointer to the buffer that receives the information. Setting this parameter to WINHTTP_NO_OUTPUT_BUFFER causes this function to return <b>FALSE</b>.  Calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> then returns 
 * <b>ERROR_INSUFFICIENT_BUFFER</b> and 
 * <i>lpdwBufferLength</i> contains the number of bytes required to hold the requested information.
 * @param {Pointer<Integer>} lpdwBufferLength Pointer to a value of type <b>DWORD</b> that specifies the length of the data buffer, in bytes. When the function returns, this parameter contains the pointer to a value that specifies the length of the information written to the buffer. When the function returns strings, the following rules apply. 
 * 					
 * 
 * <ul>
 * <li>If the function succeeds, 
 * <i>lpdwBufferLength</i> specifies the length of the string, in bytes, minus 2 for the terminating null. </li>
 * <li>If the function fails and 
 * <b>ERROR_INSUFFICIENT_BUFFER</b> is returned, 
 * <i>lpdwBufferLength</i> specifies the number of bytes that the application must allocate to receive the string. </li>
 * </ul>
 * @param {Pointer<Integer>} lpdwIndex Pointer to a zero-based header index used to enumerate multiple headers with the same name. When calling the function, this parameter is the index of the specified header to return. When the function returns, this parameter is the index of the next header. If the next index cannot be found, 
 * <b>ERROR_WINHTTP_HEADER_NOT_FOUND</b> is returned. Set this parameter to WINHTTP_NO_HEADER_INDEX to specify that only the first occurrence of a header should be returned.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_HEADER_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested header could not be located.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested operation cannot be carried out because the handle supplied is not in the correct state.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpqueryheaders
 * @since windows5.1.2600
 */
export WinHttpQueryHeaders(hRequest, dwInfoLevel, pwszName, lpBuffer, lpdwBufferLength, lpdwIndex) {
    pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"
    lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"
    lpdwIndexMarshal := lpdwIndex is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpQueryHeaders", hRequestMarshal, hRequest, "uint", dwInfoLevel, "ptr", pwszName, "ptr", lpBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, lpdwIndexMarshal, lpdwIndex, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves header information associated with an HTTP request; offers a way to retrieve parsed header name and value strings.
 * @remarks
 * **WinHttpQueryHeadersEx** builds on the functionality of [WinHttpQueryHeaders](nf-winhttp-winhttpqueryheaders.md). **WinHttpQueryHeaders** allows you to query request or response headers (or response trailers) in the form of a string, a number (DWORD), or a timestamp (SYSTEMTIME). Querying for all headers returns a single serialized string with CRLF or NULL characters delimiting different headers. For example, "Name1: value1\r\nName2: value2\r\n\r\n". Or "Name1: value1\0Name2: value2\0\0". A double delimiter is used to indicate the end of the string.
 * 
 * **WinHttpQueryHeadersEx** gives you a way to retrieve parsed header name and value strings.
 * @param {Pointer<Void>} hRequest Type: \_In\_ **[HINTERNET](/windows/win32/winhttp/hinternet-handles-in-winhttp)**
 * 
 * Request handle returned by [WinHttpOpenRequest](/windows/win32/api/winhttp/nf-winhttp-winhttpopenrequest). The [WinHttpReceiveResponse](/windows/win32/api/winhttp/nf-winhttp-winhttpreceiveresponse) call for this handle must have completed before calling **WinHttpQueryHeadersEx**. If you're querying trailers, then the [WinHttpReadData](/windows/win32/api/winhttp/nf-winhttp-winhttpreaddata) call for this handle must return 0 bytes read before calling **WinHttpQueryHeadersEx**.
 * @param {Integer} dwInfoLevel Type: \_In\_ **[DWORD](/windows/win32/winprog/windows-data-types)**
 * 
 * Value of type <b>DWORD</b> that specifies a combination of attribute and modifier flags listed in the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/query-info-flags">Query info flags</a> topic. These attribute and modifier flags indicate the information that is being requested, and how it is to be formatted.
 * 
 * > [!NOTE]
 * > The following flags return **ERROR_INVALID_PARAMETER** if used: **WINHTTP_QUERY_VERSION**, **WINHTTP_QUERY_STATUS_CODE**, **WINHTTP_QUERY_STATUS_TEXT**, **WINHTTP_QUERY_FLAG_NUMBER**, **WINHTTP_QUERY_FLAG_NUMBER64**, **WINHTTP_QUERY_FLAG_SYSTEMTIME**, and **WINHTTP_QUERY_RAW_HEADERS_CRLF**.
 * 
 * The flag **WINHTTP_QUERY_EX_ALL_HEADERS** returns all the headers.
 * 
 * If you're not querying for all of the headers, then you can pass the flag corresponding to a specific known header, or you can pass **WINHTTP_QUERY_CUSTOM** along with a string for the header name in the *pHeaderName* parameter.
 * 
 * Passing **WINHTTP_QUERY_FLAG_WIRE_ENCODING** returns the headers in the format in which they're sent over the wire (you should access/set the *psz\** members of [WINHTTP_EXTENDED_HEADER](/windows/win32/api/winhttp/ns-winhttp-winhttp_extended_header) and [WINHTTP_HEADER_NAME](/windows/win32/api/winhttp/ns-winhttp-winhttp_header_name)). If you don't set the wire encoding flag, then the default behavior is to return headers in Unicode format (you should access/set the *pwsz\** members of [WINHTTP_EXTENDED_HEADER](/windows/win32/api/winhttp/ns-winhttp-winhttp_extended_header) and [WINHTTP_HEADER_NAME](/windows/win32/api/winhttp/ns-winhttp-winhttp_header_name)).
 * @param {Integer} ullFlags Type: \_In\_ **[ULONGLONG](/windows/win32/winprog/windows-data-types)**
 * 
 * Reserved. Set to 0.
 * @param {Integer} uiCodePage Type: \_In\_ **[UINT](/windows/win32/winprog/windows-data-types)**
 * 
 * The code page to use for Unicode conversion. You should pass in 0 for default behavior (CP_ACP), or when using **WINHTTP_QUERY_FLAG_WIRE_ENCODING**. No validation is done for this parameter.
 * @param {Pointer<Integer>} pdwIndex Type: \_Inout\_opt\_ **[PDWORD](/windows/win32/winprog/windows-data-types)**
 * 
 * The address of a zero-based index used to enumerate multiple headers with the same name. When calling the function, this parameter is the index of the specified header to return. When the function returns, this parameter is the index of the next header. Pass **NULL** to access the first instance of a given header.
 * @param {Pointer<WINHTTP_HEADER_NAME>} pHeaderName Type: \_Inout\_opt\_ **[PWINHTTP_HEADER_NAME](/windows/win32/api/winhttp/ns-winhttp-winhttp_header_name)**
 * 
 * The address of a [WINHTTP_HEADER_NAME](/windows/win32/api/winhttp/ns-winhttp-winhttp_header_name) structure.
 * 
 * Set *pHeaderName* to **NULL** when retrieving all headers. If this parameter is not **NULL**, and you pass **WINHTTP_QUERY_CUSTOM** with *dwInfoLevel*, then **WinHttpQueryHeadersEx** will retrieve only the header specified by this parameter. If you pass **WINHTTP_QUERY_FLAG_WIRE_ENCODING** with *dwInfoLevel*, then you should use the *pszName* member (if the flag is not set, then use *pwszName* member).
 * @param {Integer} pBuffer Type: \_Out\_writes\_bytes\_to\_opt\_(*pdwBufferLength, *pdwBufferLength) **[LPVOID](/windows/win32/winprog/windows-data-types)**
 * 
 * A caller-provided buffer to store the parsed header pointers and the headers. If this parameter is **NULL** or too small, then **WinHttpQueryHeadersEx** returns **ERROR_INSUFFICIENT_BUFFER**, and the *pdwBufferLength* parameter contains the required buffer size in bytes.
 * @param {Pointer<Integer>} pdwBufferLength Type: \_Inout\_ **[PDWORD](/windows/win32/winprog/windows-data-types)**
 * 
 * Length of the caller-provided buffer. If *pBuffer* is **NULL** or too small, then **WinHttpQueryHeadersEx** writes the required buffer size in bytes to this parameter.
 * @param {Pointer<Pointer<WINHTTP_EXTENDED_HEADER>>} ppHeaders Type: \_Out\_writes\_opt\_(*pdwHeadersCount) **[PWINHTTP_EXTENDED_HEADER](/windows/win32/api/winhttp/ns-winhttp-winhttp_extended_header)\***
 * 
 * A handle to an array of [WINHTTP_EXTENDED_HEADER](/windows/win32/api/winhttp/ns-winhttp-winhttp_extended_header) for accessing parsed header names/values. You should pass in the address of a **WINHTTP_EXTENDED_HEADER** pointer that's initialized to **NULL**. Upon completion, you should access the *pszName/pszValue* parameters if using **WINHTTP_QUERY_FLAG_WIRE_ENCODING**, and *pwszName/pwszValue* otherwise.
 * @param {Pointer<Integer>} pdwHeadersCount Type: \_Out\_ **[PDWORD](/windows/win32/winprog/windows-data-types)**
 * 
 * The number of headers returned. You shouldn't try to access beyond `ppHeaders[cHeaders - 1]`, because that is out of bounds of the array.
 * @returns {Integer} A status code indicating the result of the operation. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_HEADER_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested header could not be located.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested operation cannot be carried out because the handle supplied is not in the correct state.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpqueryheadersex
 */
export WinHttpQueryHeadersEx(hRequest, dwInfoLevel, ullFlags, uiCodePage, pdwIndex, pHeaderName, pBuffer, pdwBufferLength, ppHeaders, pdwHeadersCount) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"
    pdwIndexMarshal := pdwIndex is VarRef ? "uint*" : "ptr"
    pdwBufferLengthMarshal := pdwBufferLength is VarRef ? "uint*" : "ptr"
    ppHeadersMarshal := ppHeaders is VarRef ? "ptr*" : "ptr"
    pdwHeadersCountMarshal := pdwHeadersCount is VarRef ? "uint*" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpQueryHeadersEx", hRequestMarshal, hRequest, "uint", dwInfoLevel, "uint", ullFlags, "uint", uiCodePage, pdwIndexMarshal, pdwIndex, WINHTTP_HEADER_NAME.Ptr, pHeaderName, "ptr", pBuffer, pdwBufferLengthMarshal, pdwBufferLength, ppHeadersMarshal, ppHeaders, pdwHeadersCountMarshal, pdwHeadersCount, UInt32)
    return result
}

/**
 * Retrieves an enumeration of http connections and their **GUID**s.
 * @param {Pointer<Void>} hInternet Type: \_In\_ **[HINTERNET](/windows/win32/winhttp/hinternet-handles-in-winhttp#about-hinternet-handles)**
 * 
 * A request handle or a connect handle.
 * 
 * If a connect handle, then WinHttp assumes that the host uses HTTPS by default. But you can pass **WINHTTP_QUERY_CONNECTION_GROUP_FLAG_INSECURE** (0x0000000000000001ull) in *ullFlags* to indicate that you want non-HTTPS connections.
 * @param {Pointer<Guid>} pGuidConnection Type: \_In\_ **[GUID](/windows/win32/api/guiddef/ns-guiddef-guid)\***
 * 
 * An optional GUID. If provided, then only connections matching the GUID are returned. Otherwise, the function returns all connections to the host (specified in *hInternet* either by a request handle or a connect handle).
 * @param {Integer} ullFlags Type: \_In\_ **[ULONGLONG](/windows/win32/winprog/windows-data-types)**
 * 
 * Flags. Pass **WINHTTP_QUERY_CONNECTION_GROUP_FLAG_INSECURE** to indicate that you want non-HTTPS connections (see *hInternet*).
 * @param {Pointer<Pointer<WINHTTP_QUERY_CONNECTION_GROUP_RESULT>>} ppResult Type: \_Inout\_ **[PWINHTTP_QUERY_CONNECTION_GROUP_RESULT](ns-winhttp-winhttp_query_connection_group_result.md)\***
 * 
 * The address of a pointer to a [WINHTTP_QUERY_CONNECTION_GROUP_RESULT](ns-winhttp-winhttp_query_connection_group_result.md), through which the results are returned.
 * 
 * WinHttp performs an allocation internally, so once you're done with it you must free this pointer by calling [WinHttpFreeQueryConnectionGroupResult](nf-winhttp-winhttpfreequeryconnectiongroupresult.md).
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpqueryconnectiongroup
 */
export WinHttpQueryConnectionGroup(hInternet, pGuidConnection, ullFlags, ppResult) {
    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
    ppResultMarshal := ppResult is VarRef ? "ptr*" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpQueryConnectionGroup", hInternetMarshal, hInternet, Guid.Ptr, pGuidConnection, "uint", ullFlags, ppResultMarshal, ppResult, UInt32)
    return result
}

/**
 * Frees the memory allocated by a previous call to [WinHttpQueryConnectionGroup](nf-winhttp-winhttpqueryconnectiongroup.md).
 * @param {Pointer<WINHTTP_QUERY_CONNECTION_GROUP_RESULT>} pResult Type: \_Inout\_ **[WINHTTP_QUERY_CONNECTION_GROUP_RESULT](ns-winhttp-winhttp_query_connection_group_result.md)\***
 * 
 * A pointer to the [WINHTTP_QUERY_CONNECTION_GROUP_RESULT](ns-winhttp-winhttp_query_connection_group_result.md) object to free.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpfreequeryconnectiongroupresult
 */
export WinHttpFreeQueryConnectionGroupResult(pResult) {
    DllCall("WINHTTP.dll\WinHttpFreeQueryConnectionGroupResult", WINHTTP_QUERY_CONNECTION_GROUP_RESULT.Ptr, pResult)
}

/**
 * Finds the URL for the Proxy Auto-Configuration (PAC) file.
 * @remarks
 * WinHTTP implements the <a href="https://www.ietf.org/archive/id/draft-ietf-wrec-wpad-01.txt">Web Proxy Auto-Discovery (WPAD) protocol</a>, often referred to as <i>autoproxy</i>. For more information about well-known locations, see the  <a href="https://www.ietf.org/archive/id/draft-ietf-wrec-wpad-01.txt">Discovery Process</a> section of the WPAD protocol document.
 * 
 * Note that because the <b>WinHttpDetectAutoProxyConfigUrl</b> function takes time to complete its operation, it should not be called from  a UI thread.
 * @param {Integer} dwAutoDetectFlags A data type that specifies what protocols to use to locate the PAC file. If both the DHCP and DNS auto detect flags are set, DHCP is used first; if no PAC URL is discovered using DHCP, then DNS is used.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTO_DETECT_TYPE_DHCP"></a><a id="winhttp_auto_detect_type_dhcp"></a><dl>
 * <dt><b>WINHTTP_AUTO_DETECT_TYPE_DHCP</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Use DHCP to locate the proxy auto-configuration file.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_AUTO_DETECT_TYPE_DNS_A"></a><a id="winhttp_auto_detect_type_dns_a"></a><dl>
 * <dt><b>WINHTTP_AUTO_DETECT_TYPE_DNS_A</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Use DNS to attempt to locate the proxy auto-configuration file at a well-known location on the domain of the local computer.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<PWSTR>} ppwstrAutoConfigUrl A data type that returns a pointer to a null-terminated Unicode string that contains the configuration URL that receives the proxy data. You must free the string pointed to by <i>ppwszAutoConfigUrl</i> using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalfree">GlobalFree</a> function.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_AUTODETECTION_FAILED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned if WinHTTP was unable to discover the URL of the Proxy Auto-Configuration (PAC) file.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpdetectautoproxyconfigurl
 * @since windows5.1.2600
 */
export WinHttpDetectAutoProxyConfigUrl(dwAutoDetectFlags, ppwstrAutoConfigUrl) {
    ppwstrAutoConfigUrlMarshal := ppwstrAutoConfigUrl is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpDetectAutoProxyConfigUrl", "uint", dwAutoDetectFlags, ppwstrAutoConfigUrlMarshal, ppwstrAutoConfigUrl, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the proxy data for the specified URL. (WinHttpGetProxyForUrl)
 * @remarks
 * This function implements the Web Proxy Auto-Discovery (WPAD) protocol for automatically configuring the proxy settings for an HTTP request. The WPAD protocol downloads a Proxy Auto-Configuration (PAC) file, which is a script that identifies the proxy server to use for a given target URL. PAC files are typically deployed by the IT department within a corporate network environment. The URL of the PAC file can either be specified explicitly or <b>WinHttpGetProxyForUrl</b> can be instructed to automatically discover the location of the PAC file on the local network.
 * 
 * <b>WinHttpGetProxyForUrl</b> supports only ECMAScript-based PAC files.
 * 
 * <b>WinHttpGetProxyForUrl</b> must be called on a per-URL basis, because the PAC file can return a different proxy server for different URLs. This is useful because the PAC file enables an IT department to implement proxy server load balancing by mapping (hashing) the target URL (specified by the <i>lpcwszUrl</i> parameter) to a certain proxy in a proxy server array.
 * 
 * <b>WinHttpGetProxyForUrl</b> caches the autoproxy URL and the autoproxy script when auto-discovery is specified in the <b>dwFlags</b> member of the <i>pAutoProxyOptions</i> structure. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinHttp/autoproxy-cache">Autoproxy Cache</a>.
 * @param {Pointer<Void>} hSession The WinHTTP session handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a> function.
 * @param {PWSTR} lpcwszUrl A pointer to a null-terminated Unicode string that contains the URL of the HTTP request that the application is preparing to send.
 * @param {Pointer<WINHTTP_AUTOPROXY_OPTIONS>} pAutoProxyOptions A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_autoproxy_options">WINHTTP_AUTOPROXY_OPTIONS</a> structure that specifies the auto-proxy options to use.
 * @param {Pointer<WINHTTP_PROXY_INFO>} pProxyInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_proxy_info">WINHTTP_PROXY_INFO</a> structure that receives the proxy setting. This structure is then applied to the request handle using the WINHTTP_OPTION_PROXY option. Free the <b>lpszProxy</b> and <b>lpszProxyBypass</b> strings contained in this structure (if they are non-NULL) using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalfree">GlobalFree</a> function.
 * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
 * 
 * 
 * If the function fails, it returns <b>FALSE</b>. For extended error data, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 *   Possible error codes include the folllowing.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_AUTO_PROXY_SERVICE_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned by <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurl">WinHttpGetProxyForUrl</a> when a proxy for the specified URL cannot be located.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_BAD_AUTO_PROXY_SCRIPT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An error occurred executing the script code in the Proxy Auto-Configuration (PAC) file.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INVALID_URL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_LOGIN_FAILURE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The login attempt failed.  When this error is encountered, close the request handle with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a>.  A new request handle must be created before retrying the function that originally produced this error.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_UNABLE_TO_DOWNLOAD_SCRIPT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The PAC file could not be downloaded. For example, the server referenced by the PAC URL may not have been reachable, or  the server returned a 404 NOT FOUND response.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_UNRECOGNIZED_SCHEME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL of the PAC file specified a scheme other than "http:" or "https:".
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpgetproxyforurl
 * @since windows5.1.2600
 */
export WinHttpGetProxyForUrl(hSession, lpcwszUrl, pAutoProxyOptions, pProxyInfo) {
    lpcwszUrl := lpcwszUrl is String ? StrPtr(lpcwszUrl) : lpcwszUrl

    hSessionMarshal := hSession is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpGetProxyForUrl", hSessionMarshal, hSession, "ptr", lpcwszUrl, WINHTTP_AUTOPROXY_OPTIONS.Ptr, pAutoProxyOptions, WINHTTP_PROXY_INFO.Ptr, pProxyInfo, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Creates a handle for use by WinHttpGetProxyForUrlEx.
 * @param {Pointer<Void>} hSession Valid <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> WinHTTP session handle returned by a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>. The session handle must be opened using <b>WINHTTP_FLAG_ASYNC</b>.
 * @param {Pointer<Pointer<Void>>} phResolver A pointer to a new handle for use by <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurlex">WinHttpGetProxyForUrlEx</a>.  When finished or cancelling an outstanding operation, close this handle with <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a>.
 * @returns {Integer} A status code indicating the result of the operation.
 * 
 * <table>
 * <tr>
 * <th>The following codes may be returned.</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation succeeded.
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
 * <i>hSession</i> is NULL.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <i>hSession</i> is not the result of a call to <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a> or <i>hSession</i> is not marked as asynchronous using <b>WINHTTP_FLAG_ASYNC</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpcreateproxyresolver
 * @since windows8.0
 */
export WinHttpCreateProxyResolver(hSession, phResolver) {
    hSessionMarshal := hSession is VarRef ? "ptr" : "ptr"
    phResolverMarshal := phResolver is VarRef ? "ptr*" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpCreateProxyResolver", hSessionMarshal, hSession, phResolverMarshal, phResolver, UInt32)
    return result
}

/**
 * Retrieves the proxy data for the specified URL. (WinHttpGetProxyForUrlEx)
 * @remarks
 * This function implements the Web Proxy Auto-Discovery (WPAD) protocol for automatically configuring the proxy settings for an HTTP request. The WPAD protocol downloads a Proxy Auto-Configuration (PAC) file, which is a script that identifies the proxy server to use for a given target URL. PAC files are typically deployed by the IT department within a corporate network environment. The URL of the PAC file can either be specified explicitly or <b>WinHttpGetProxyForUrlEx</b> can be instructed to automatically discover the location of the PAC file on the local network.
 * 
 * <b>WinHttpGetProxyForUrlEx</b> supports only ECMAScript-based PAC files.
 * 
 * <b>WinHttpGetProxyForUrlEx</b> must be called on a per-URL basis, because the PAC file can return a different proxy server for different URLs. This is useful because the PAC file enables an IT department to implement proxy server load balancing by mapping (hashing) the target URL (specified by the <i>lpcwszUrl</i> parameter) to a certain proxy in a proxy server array.
 * 
 * <b>WinHttpGetProxyForUrlEx</b> caches the autoproxy URL and the autoproxy script when auto-discovery is specified in the <b>dwFlags</b> member of the <i>pAutoProxyOptions</i> structure. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinHttp/autoproxy-cache">Autoproxy Cache</a>.
 * 
 * <b>WinHttpGetProxyForUrlEx</b> provides a fully Asynchronous and cancellable API that <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurl">WinHttpGetProxyForUrl</a> does not.  <b>WinHttpGetProxyForUrlEx</b> also provides the application with the full proxy list that was returned by the PAC script allowing the application to better handle failover to "DIRECT" and to understand SOCKS if desired.
 * 
 * <b>WinHttpGetProxyForUrlEx</b> always executes asynchronously and returns immediately with <b>ERROR_IO_PENDING</b> on success. The callback is set by calling <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetstatuscallback">WinHttpSetStatusCallback</a> on the <i>hSession</i> provided by <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>.  Alternately call <b>WinHttpSetStatusCallback</b> on the <i>hResolver</i> provided by <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpcreateproxyresolver">WinHttpCreateProxyResolver</a> to have a specific callback for each call. 
 * 
 * You must call <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetstatuscallback">WinHttpSetStatusCallback</a> before <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpcreateproxyresolver">WinHttpCreateProxyResolver</a>. When calling <b>WinHttpSetStatusCallback</b>, use <b>WINHTTP_CALLBACK_FLAG_REQUEST_ERROR |
 *                                               WINHTTP_CALLBACK_FLAG_GETPROXYFORURL_COMPLETE</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nc-winhttp-winhttp_status_callback">WINHTTP_STATUS_CALLBACK</a> for information on the use of the callback.
 * 
 * Once a callback of status <b>WINHTTP_CALLBACK_STATUS_GETPROXYFORURL_COMPLETE</b> is returned, the application can call <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyresult">WinHttpGetProxyResult</a> on the resolver handle used to issue <b>WinHttpGetProxyForUrlEx</b> to receive the results of that call.
 * 
 * 
 * If the call fails after returning <b>ERROR_IO_PENDING</b> then a callback of <b>WINHTTP_CALLBACK_STATUS_REQUEST_ERROR</b> will be issued.
 * 
 * This function always executes out-of-process.
 * @param {Pointer<Void>} hResolver The WinHTTP resolver handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpcreateproxyresolver">WinHttpCreateProxyResolver</a> function.
 * @param {PWSTR} pcwszUrl A pointer to a null-terminated Unicode string that contains a URL for which proxy information will be determined.
 * @param {Pointer<WINHTTP_AUTOPROXY_OPTIONS>} pAutoProxyOptions A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_autoproxy_options">WINHTTP_AUTOPROXY_OPTIONS</a> structure that specifies the auto-proxy options to use.
 * @param {Pointer} pContext Context data that will be passed to the completion callback function.
 * @returns {Integer} A status code indicating the result of the operation.
 * 
 * <table>
 * <tr>
 * <th>The following codes may be returned.</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_IO_PENDING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is continuing asynchronously.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_AUTO_PROXY_SERVICE_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned by <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurlex">WinHttpGetProxyForUrlEx</a> when a proxy for the specified URL cannot be located.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_BAD_AUTO_PROXY_SCRIPT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An error occurred executing the script code in the Proxy Auto-Configuration (PAC) file.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INVALID_URL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_UNABLE_TO_DOWNLOAD_SCRIPT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The PAC file could not be downloaded. For example, the server referenced by the PAC URL may not have been reachable, or  the server returned a 404 NOT FOUND response.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_UNRECOGNIZED_SCHEME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL of the PAC file specified a scheme other than "http:" or "https:".
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpgetproxyforurlex
 * @since windows8.0
 */
export WinHttpGetProxyForUrlEx(hResolver, pcwszUrl, pAutoProxyOptions, pContext) {
    pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl

    hResolverMarshal := hResolver is VarRef ? "ptr" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpGetProxyForUrlEx", hResolverMarshal, hResolver, "ptr", pcwszUrl, WINHTTP_AUTOPROXY_OPTIONS.Ptr, pAutoProxyOptions, "ptr", pContext, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hResolver 
 * @param {PWSTR} pcwszUrl 
 * @param {Pointer<WINHTTP_AUTOPROXY_OPTIONS>} pAutoProxyOptions 
 * @param {Integer} cbInterfaceSelectionContext 
 * @param {Integer} pInterfaceSelectionContext 
 * @param {Pointer} pContext 
 * @returns {Integer} 
 */
export WinHttpGetProxyForUrlEx2(hResolver, pcwszUrl, pAutoProxyOptions, cbInterfaceSelectionContext, pInterfaceSelectionContext, pContext) {
    pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl

    hResolverMarshal := hResolver is VarRef ? "ptr" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpGetProxyForUrlEx2", hResolverMarshal, hResolver, "ptr", pcwszUrl, WINHTTP_AUTOPROXY_OPTIONS.Ptr, pAutoProxyOptions, "uint", cbInterfaceSelectionContext, "ptr", pInterfaceSelectionContext, "ptr", pContext, UInt32)
    return result
}

/**
 * The WinHttpGetProxyResult function retrieves the results of a call to WinHttpGetProxyForUrlEx.
 * @param {Pointer<Void>} hResolver The resolver handle used to issue a previously completed call to <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurlex">WinHttpGetProxyForUrlEx</a>.
 * @param {Pointer<WINHTTP_PROXY_RESULT>} pProxyResult A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ns-winhttp-winhttp_proxy_result">WINHTTP_PROXY_RESULT</a> structure that contains the results of a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurlex">WinHttpGetProxyForUrlEx</a>.  The results must be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpfreeproxyresult">WinHttpFreeProxyResult</a>.
 * @returns {Integer} A status code indicating the result of the operation.
 * 
 * <table>
 * <tr>
 * <th>The following codes may be returned.</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of handle supplied is incorrect for this operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The resolver handle has not successfully completed a call to <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurlex">WinHttpGetProxyForUrlEx</a>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpgetproxyresult
 * @since windows8.0
 */
export WinHttpGetProxyResult(hResolver, pProxyResult) {
    hResolverMarshal := hResolver is VarRef ? "ptr" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpGetProxyResult", hResolverMarshal, hResolver, WINHTTP_PROXY_RESULT.Ptr, pProxyResult, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hResolver 
 * @param {Pointer<WINHTTP_PROXY_RESULT_EX>} pProxyResultEx 
 * @returns {Integer} 
 */
export WinHttpGetProxyResultEx(hResolver, pProxyResultEx) {
    hResolverMarshal := hResolver is VarRef ? "ptr" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpGetProxyResultEx", hResolverMarshal, hResolver, WINHTTP_PROXY_RESULT_EX.Ptr, pProxyResultEx, UInt32)
    return result
}

/**
 * The WinHttpFreeProxyResult function frees the data retrieved from a previous call to WinHttpGetProxyResult.
 * @remarks
 * Upon completion, all internal members of <i>pProxyResult</i> will be zeroed and the memory allocated to those members will be freed. If <i>pProxyResult</i> is an allocated pointer, the caller must free the pointer.
 * @param {Pointer<WINHTTP_PROXY_RESULT>} pProxyResult A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ns-winhttp-winhttp_proxy_result">WINHTTP_PROXY_RESULT</a> structure retrieved from a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyresult">WinHttpGetProxyResult</a>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpfreeproxyresult
 * @since windows8.0
 */
export WinHttpFreeProxyResult(pProxyResult) {
    DllCall("WINHTTP.dll\WinHttpFreeProxyResult", WINHTTP_PROXY_RESULT.Ptr, pProxyResult)
}

/**
 * 
 * @param {Pointer<WINHTTP_PROXY_RESULT_EX>} pProxyResultEx 
 * @returns {String} Nothing - always returns an empty string
 */
export WinHttpFreeProxyResultEx(pProxyResultEx) {
    DllCall("WINHTTP.dll\WinHttpFreeProxyResultEx", WINHTTP_PROXY_RESULT_EX.Ptr, pProxyResultEx)
}

/**
 * Resets the auto-proxy.
 * @remarks
 * To reset everything, set the <i>dwFlags</i> parameter to include <b>WINHTTP_RESET_ALL</b> and <b>WINHTTP_RESET_OUT_OF_PROC</b>. 
 * 
 * 
 * 
 * <div class="alert"><b>Note</b>  If you make subsequent calls to the <b>WinHttpResetAutoProxy</b> function, there must be at least 30 seconds delay between calls to reset the state of the auto-proxy. If there is less than 30 seconds, the <b>WinHttpResetAutoProxy</b> function call may return <b>ERROR_SUCCESS</b> but the reset won't happen. 
 * </div>
 * <div> </div>
 * @param {Pointer<Void>} hSession A valid 
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> WinHTTP session handle returned by a previous call to 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a> function.
 * @param {Integer} dwFlags A set of flags that affects the reset operation.
 * 
 * 
 * The following flags are supported as defined in the <i>Winhttp.h</i> header file.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_RESET_STATE"></a><a id="winhttp_reset_state"></a><dl>
 * <dt><b>WINHTTP_RESET_STATE</b></dt>
 * <dt>0x00000001</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Forces a flush and retry of non-persistent proxy information on the current network.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_RESET_SWPAD_CURRENT_NETWORK"></a><a id="winhttp_reset_swpad_current_network"></a><dl>
 * <dt><b>WINHTTP_RESET_SWPAD_CURRENT_NETWORK</b></dt>
 * <dt>0x00000002</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Flush the PAD information for the current network.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_RESET_SWPAD_ALL"></a><a id="winhttp_reset_swpad_all"></a><dl>
 * <dt><b>WINHTTP_RESET_SWPAD_ALL</b></dt>
 * <dt>0x00000004</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Flush the PAD information for all networks.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_RESET_SCRIPT_CACHE"></a><a id="winhttp_reset_script_cache"></a><dl>
 * <dt><b>WINHTTP_RESET_SCRIPT_CACHE</b></dt>
 * <dt>0x00000008</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Flush the persistent HTTP cache of proxy scripts.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_RESET_ALL"></a><a id="winhttp_reset_all"></a><dl>
 * <dt><b>WINHTTP_RESET_ALL</b></dt>
 * <dt>0x0000FFFF</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Forces a flush and retry of all proxy information on the current network.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_RESET_NOTIFY_NETWORK_CHANGED"></a><a id="winhttp_reset_notify_network_changed"></a><dl>
 * <dt><b>WINHTTP_RESET_NOTIFY_NETWORK_CHANGED</b></dt>
 * <dt>0x00010000</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Flush the current proxy information and notify that the network changed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINHTTP_RESET_OUT_OF_PROC"></a><a id="winhttp_reset_out_of_proc"></a><dl>
 * <dt><b>WINHTTP_RESET_OUT_OF_PROC</b></dt>
 * <dt>0x00020000</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Act on the autoproxy service instead of the current process.  <div class="alert"><b>Note</b>  This flag is required.</div>
 * <div> </div>
 * 
 * 
 * Applications that use the  <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurl">WinHttpGetProxyForUrl</a> function to purge in-process caching should close the <i>hInternet</i> handle and open a new handle for future calls.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} A code indicating the success or failure of the operation.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation was successful.
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
 * The <i>hSession</i> parameter is not a valid handle.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>hSession</i> parameter is not the product of a call to <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpresetautoproxy
 * @since windows8.0
 */
export WinHttpResetAutoProxy(hSession, dwFlags) {
    hSessionMarshal := hSession is VarRef ? "ptr" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpResetAutoProxy", hSessionMarshal, hSession, "uint", dwFlags, UInt32)
    return result
}

/**
 * Retrieves the Internet Explorer proxy configuration for the current user.
 * @remarks
 * In Internet Explorer, the proxy settings are found on the <b>Connections</b> tab of the <b>Tools</b> / <b>Internet Options</b> menu option. Proxy settings are configured on a per-connection basis; that is, the proxy settings for a LAN connection are separate from those for a dial-up or VPN connection. <b>WinHttpGetIEProxyConfigForCurrentUser</b> returns the proxy settings for the current active connection.
 * 
 * This function is useful in client applications running in network environments in which the Web Proxy Auto-Discovery (WPAD) protocol is not implemented (meaning that no Proxy Auto-Configuration file is available). If a PAC file is not available, then the <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurl">WinHttpGetProxyForUrl</a> function fails. The <b>WinHttpGetIEProxyConfigForCurrentUser</b> function can be used as a fall-back mechanism to discover a workable proxy configuration by retrieving the user's proxy configuration in Internet Explorer.
 * 
 * This function should not be used in a service process that does not impersonate a logged-on user.If the caller does not impersonate a logged on user, WinHTTP attempts to retrieve the Internet Explorer settings for the current service process: for example, the local service or the network service. If the Internet Explorer settings are not configured for these system accounts, the call to <b>WinHttpGetIEProxyConfigForCurrentUser</b> will fail.
 * 
 * The caller must free the <b>lpszProxy</b>, <b>lpszProxyBypass</b>  and <b>lpszAutoConfigUrl</b> strings in the <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ns-winhttp-winhttp_current_user_ie_proxy_config">WINHTTP_CURRENT_USER_IE_PROXY_CONFIG</a>  structure if they are non-<b>NULL</b>. Use <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalfree">GlobalFree</a> to free the strings.
 * @param {Pointer<WINHTTP_CURRENT_USER_IE_PROXY_CONFIG>} pProxyConfig A pointer, on input, to a <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ns-winhttp-winhttp_current_user_ie_proxy_config">WINHTTP_CURRENT_USER_IE_PROXY_CONFIG</a> structure. On output, the structure contains the Internet Explorer proxy settings for the current active network connection (for example, LAN, dial-up, or VPN connection).
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
 * 
 * <table>
 * <tr>
 * <th>Error Code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No Internet Explorer proxy settings can be found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error has occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory was available to complete the requested operation. (Windows error code)
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpgetieproxyconfigforcurrentuser
 * @since windows5.1.2600
 */
export WinHttpGetIEProxyConfigForCurrentUser(pProxyConfig) {
    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpGetIEProxyConfigForCurrentUser", WINHTTP_CURRENT_USER_IE_PROXY_CONFIG.Ptr, pProxyConfig, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * 
 * @param {Pointer<Void>} hSession 
 * @param {BOOL} fForceUpdate 
 * @param {Pointer<WINHTTP_PROXY_SETTINGS>} pWinHttpProxySettings 
 * @returns {Integer} 
 */
export WinHttpWriteProxySettings(hSession, fForceUpdate, pWinHttpProxySettings) {
    hSessionMarshal := hSession is VarRef ? "ptr" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpWriteProxySettings", hSessionMarshal, hSession, BOOL, fForceUpdate, WINHTTP_PROXY_SETTINGS.Ptr, pWinHttpProxySettings, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hSession 
 * @param {PWSTR} pcwszConnectionName 
 * @param {BOOL} fFallBackToDefaultSettings 
 * @param {BOOL} fSetAutoDiscoverForDefaultSettings 
 * @param {Pointer<Integer>} pdwSettingsVersion 
 * @param {Pointer<BOOL>} pfDefaultSettingsAreReturned 
 * @param {Pointer<WINHTTP_PROXY_SETTINGS>} pWinHttpProxySettings 
 * @returns {Integer} 
 */
export WinHttpReadProxySettings(hSession, pcwszConnectionName, fFallBackToDefaultSettings, fSetAutoDiscoverForDefaultSettings, pdwSettingsVersion, pfDefaultSettingsAreReturned, pWinHttpProxySettings) {
    pcwszConnectionName := pcwszConnectionName is String ? StrPtr(pcwszConnectionName) : pcwszConnectionName

    hSessionMarshal := hSession is VarRef ? "ptr" : "ptr"
    pdwSettingsVersionMarshal := pdwSettingsVersion is VarRef ? "uint*" : "ptr"
    pfDefaultSettingsAreReturnedMarshal := pfDefaultSettingsAreReturned is VarRef ? "int*" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpReadProxySettings", hSessionMarshal, hSession, "ptr", pcwszConnectionName, BOOL, fFallBackToDefaultSettings, BOOL, fSetAutoDiscoverForDefaultSettings, pdwSettingsVersionMarshal, pdwSettingsVersion, pfDefaultSettingsAreReturnedMarshal, pfDefaultSettingsAreReturned, WINHTTP_PROXY_SETTINGS.Ptr, pWinHttpProxySettings, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<WINHTTP_PROXY_SETTINGS>} pWinHttpProxySettings 
 * @returns {String} Nothing - always returns an empty string
 */
export WinHttpFreeProxySettings(pWinHttpProxySettings) {
    DllCall("WINHTTP.dll\WinHttpFreeProxySettings", WINHTTP_PROXY_SETTINGS.Ptr, pWinHttpProxySettings)
}

/**
 * 
 * @param {Pointer<Void>} hSession 
 * @param {Pointer<Integer>} pdwProxySettingsVersion 
 * @returns {Integer} 
 */
export WinHttpGetProxySettingsVersion(hSession, pdwProxySettingsVersion) {
    hSessionMarshal := hSession is VarRef ? "ptr" : "ptr"
    pdwProxySettingsVersionMarshal := pdwProxySettingsVersion is VarRef ? "uint*" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpGetProxySettingsVersion", hSessionMarshal, hSession, pdwProxySettingsVersionMarshal, pdwProxySettingsVersion, UInt32)
    return result
}

/**
 * 
 * @param {BOOL} fProxySettingsPerUser 
 * @returns {Integer} 
 */
export WinHttpSetProxySettingsPerUser(fProxySettingsPerUser) {
    result := DllCall("WINHTTP.dll\WinHttpSetProxySettingsPerUser", BOOL, fProxySettingsPerUser, UInt32)
    return result
}

/**
 * Completes a WebSocket handshake started by WinHttpSendRequest.
 * @remarks
 * <b>WinHttpWebSocketCompleteUpgrade</b> can be called on an open HTTP request to get a WebSocket handle for performing other WebSocket operations.
 * 
 * The request handle must be marked as a WebSocket upgrade by calling <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetoption">WinHttpSetOption</a> with <b>WINHTTP_OPTION_UPGRADE_TO_WEB_SOCKET</b> before sending the request.
 * 
 * The caller should check the HTTP status code returned by the server and call this function only if the status code was 101. Calling it with any other status code will result in a failure.
 * @param {Pointer<Void>} hRequest Type: <b>HINTERNET</b>
 * 
 * HTTP request handle used to send a WebSocket handshake.
 * @param {Pointer} pContext Type: <b>DWORD_PTR</b>
 * 
 * Context to be associated with the new handle.
 * @returns {Pointer<Void>} Type: <b>HINTERNET</b>
 * 
 * A new WebSocket handle. If NULL, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to determine the cause of failure.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpwebsocketcompleteupgrade
 * @since windows8.0
 */
export WinHttpWebSocketCompleteUpgrade(hRequest, pContext) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WINHTTP.dll\WinHttpWebSocketCompleteUpgrade", hRequestMarshal, hRequest, "ptr", pContext, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sends data over a WebSocket connection.
 * @param {Pointer<Void>} hWebSocket Type: <b>HINTERNET</b>
 * 
 * Handle to a websocket.
 * @param {WINHTTP_WEB_SOCKET_BUFFER_TYPE} eBufferType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ne-winhttp-winhttp_web_socket_buffer_type">WINHTTP_WEB_SOCKET_BUFFER_TYPE</a></b>
 * 
 * Type of buffer.<div class="alert"><b>Note</b>  Do not specify <b>WINHTTP_WEB_SOCKET_CLOSE_BUFFER_TYPE</b>. Use <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketclose">WinHttpWebSocketClose</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketshutdown">WinHttpWebSocketShutdown</a> to close the connection.</div>
 * <div> </div>
 * @param {Pointer<Void>} pvBuffer Type: <b>PVOID</b>
 * 
 * Pointer to a buffer containing the data to send. Can be <b>NULL</b> only if <i>dwBufferLength</i> is 0.
 * @param {Integer} dwBufferLength Type: <b>DWORD</b>
 * 
 * Length of <i>pvBuffer</i>.
 * @returns {Integer} Type: <b>DWORD</b>
 * 
 * <b>NO_ERROR</b> on success. Otherwise an error code.
 * 
 * <table>
 * <tr>
 * <th></th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_OPERATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A close or send is pending, or the send channel has already been closed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A parameter is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpwebsocketsend
 * @since windows8.0
 */
export WinHttpWebSocketSend(hWebSocket, eBufferType, pvBuffer, dwBufferLength) {
    hWebSocketMarshal := hWebSocket is VarRef ? "ptr" : "ptr"
    pvBufferMarshal := pvBuffer is VarRef ? "ptr" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpWebSocketSend", hWebSocketMarshal, hWebSocket, WINHTTP_WEB_SOCKET_BUFFER_TYPE, eBufferType, pvBufferMarshal, pvBuffer, "uint", dwBufferLength, UInt32)
    return result
}

/**
 * Receives data from a WebSocket connection.
 * @param {Pointer<Void>} hWebSocket Type: <b>HINTERNET</b>
 * 
 * Handle to a WebSocket.
 * @param {Integer} pvBuffer Type: <b>PVOID</b>
 * 
 * Pointer to a buffer to receive the data.
 * @param {Integer} dwBufferLength Type: <b>DWORD</b>
 * 
 * Length of <i>pvBuffer</i>, in bytes.
 * @param {Pointer<Integer>} pdwBytesRead Type: <b>DWORD*</b>
 * 
 * Pointer to a <b>DWORD</b> that receives the number of bytes read from the connection at the end of the operation. This is set only if <b>WinHttpWebSocketReceive</b> returns <b>NO_ERROR</b> and the handle was opened in synchronous mode.
 * @param {Pointer<WINHTTP_WEB_SOCKET_BUFFER_TYPE>} peBufferType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ne-winhttp-winhttp_web_socket_buffer_type">WINHTTP_WEB_SOCKET_BUFFER_TYPE</a>*</b>
 * 
 * The type of a returned buffer. This is only set if <b>WinHttpWebSocketReceive</b> returns <b>NO_ERROR</b> and the handle was opened in synchronous mode.
 * @returns {Integer} Type: <b>DWORD</b>
 * 
 * <b>NO_ERROR</b> on success. Otherwise an error code.
 * 
 * <table>
 * <tr>
 * <th></th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_OPERATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A close or receive is pending, or the receive channel has already been closed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_SERVER_RESPONSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid data was received from the server.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation was cancelled because <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketclose">WinHttpWebSocketClose</a> was called to close the connection.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpwebsocketreceive
 * @since windows8.0
 */
export WinHttpWebSocketReceive(hWebSocket, pvBuffer, dwBufferLength, pdwBytesRead, peBufferType) {
    hWebSocketMarshal := hWebSocket is VarRef ? "ptr" : "ptr"
    pdwBytesReadMarshal := pdwBytesRead is VarRef ? "uint*" : "ptr"
    peBufferTypeMarshal := peBufferType is VarRef ? "int*" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpWebSocketReceive", hWebSocketMarshal, hWebSocket, "ptr", pvBuffer, "uint", dwBufferLength, pdwBytesReadMarshal, pdwBytesRead, peBufferTypeMarshal, peBufferType, UInt32)
    return result
}

/**
 * Sends a close frame to a WebSocket server to close the send channel, but leaves the receive channel open.
 * @remarks
 * <b>WinHttpWebSocketShutdown</b> sends a close frame and prevents additional data from being sent over the WebSocket connection. It does not close the receive channel. Use <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketclose">WinHttpWebSocketClose</a> when you want to completely close the connection and prevent any subsequent receive operations.
 * 
 * The application is responsible for receiving the close frame from the server (through regular receive operations).
 * 
 * After <b>WinHttpWebSocketShutdown</b> is called, the application can call <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketclose">WinHttpWebSocketClose</a> if it does not want to receive a close frame on its own and delegate it to the stack.
 * @param {Pointer<Void>} hWebSocket Type: <b>HINTERNET</b>
 * 
 * Handle to a WebSocket.<div class="alert"><b>Note</b>  <b>WinHttpWebSocketShutdown</b> does not close this handle. To close the handle, call <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a> on <i>hWebSocket</i> once it is no longer needed.</div>
 * <div> </div>
 * @param {Integer} usStatus Type: <b>USHORT</b>
 * 
 * A close status code. See <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ne-winhttp-winhttp_web_socket_close_status">WINHTTP_WEB_SOCKET_CLOSE_STATUS</a> for possible values.
 * @param {Integer} pvReason Type: <b>PVOID</b>
 * 
 * A detailed reason for the close.
 * @param {Integer} dwReasonLength Type: <b>DWORD</b>
 * 
 * The length of <i>pvReason</i>, in bytes.
 * 
 * If <i>pvReason</i> is NULL, this must be 0. This value must be within the range of 0 to 123.
 * @returns {Integer} Type: <b>DWORD</b>
 * 
 * With the following exception, all error codes indicate that the underlying TCP connection has been aborted.
 * 
 * <table>
 * <tr>
 * <th></th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_IO_PENDING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation will complete asynchronously.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpwebsocketshutdown
 * @since windows8.0
 */
export WinHttpWebSocketShutdown(hWebSocket, usStatus, pvReason, dwReasonLength) {
    hWebSocketMarshal := hWebSocket is VarRef ? "ptr" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpWebSocketShutdown", hWebSocketMarshal, hWebSocket, "ushort", usStatus, "ptr", pvReason, "uint", dwReasonLength, UInt32)
    return result
}

/**
 * Closes a WebSocket connection.
 * @remarks
 * <b>WinHttpWebSocketClose</b> completely closes a WebSocket connection. To close the send channel while still leaving the receive channel open, use <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketshutdown">WinHttpWebSocketShutdown</a>.
 * 
 * It is possible to  receive a close frame during regular receive operations. In this case, <b>WinHttpWebSocketClose</b> will also send a close frame.
 * 
 * The close timer can be set by the property
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">WINHTTP_OPTION_WEB_SOCKET_CLOSE_TIMEOUT</a>.
 * The default is 10 seconds.
 * @param {Pointer<Void>} hWebSocket Type: <b>HINTERNET</b>
 * 
 * Handle to a WebSocket.<div class="alert"><b>Note</b>  <b>WinHttpWebSocketClose</b> does not close this handle. To close the handle, call <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a> on <i>hWebSocket</i> once it is no longer needed.</div>
 * <div> </div>
 * @param {Integer} usStatus Type: <b>USHORT</b>
 * 
 * A close status code. See <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ne-winhttp-winhttp_web_socket_close_status">WINHTTP_WEB_SOCKET_CLOSE_STATUS</a> for possible values.
 * @param {Integer} pvReason Type: <b>PVOID</b>
 * 
 * A detailed reason for the close.
 * @param {Integer} dwReasonLength Type: <b>DWORD</b>
 * 
 * The length of <i>pvReason</i>, in bytes.
 * 
 * If <i>pvReason</i> is NULL, this must be 0. This value must be within the range of 0 to 123.
 * @returns {Integer} Type: <b>DWORD</b>
 * 
 * With the following exception, all error codes indicate that the underlying TCP connection has been aborted.
 * 
 * <table>
 * <tr>
 * <th></th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_OPERATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A close or send is pending.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_SERVER_RESPONSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid data was received from the server.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpwebsocketclose
 * @since windows8.0
 */
export WinHttpWebSocketClose(hWebSocket, usStatus, pvReason, dwReasonLength) {
    hWebSocketMarshal := hWebSocket is VarRef ? "ptr" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpWebSocketClose", hWebSocketMarshal, hWebSocket, "ushort", usStatus, "ptr", pvReason, "uint", dwReasonLength, UInt32)
    return result
}

/**
 * Retrieves the close status sent by a server.
 * @remarks
 * Call <b>WinHttpWebSocketQueryCloseStatus</b> only after <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketclose">WinHttpWebSocketClose</a> succeeds or if <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketreceive">WinHttpWebSocketReceive</a> returns <b>WINHTTP_WEB_SOCKET_CLOSE_BUFFER_TYPE</b>.
 * 
 * <i>pdwReasonLengthConsumed</i> will never be greater than 123, so allocating buffer with at least 123 will guarantee that <b>ERROR_INSUFFICIENT_BUFFER</b> will never be returned.
 * @param {Pointer<Void>} hWebSocket Type: <b>HINTERNET</b>
 * 
 * Handle to a WebSocket
 * @param {Pointer<Integer>} pusStatus Type: <b>USHORT*</b>
 * 
 * A pointer to a close status code that will be filled upon return. See <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ne-winhttp-winhttp_web_socket_close_status">WINHTTP_WEB_SOCKET_CLOSE_STATUS</a> for possible values.
 * @param {Integer} pvReason Type: <b>PVOID</b>
 * 
 * A pointer to a buffer that will receive a close reason on return.
 * @param {Integer} dwReasonLength Type: <b>DWORD</b>
 * 
 * The length of the <i>pvReason</i> buffer, in bytes.
 * @param {Pointer<Integer>} pdwReasonLengthConsumed Type: <b>DWORD*</b>
 * 
 * The number of bytes consumed. If <i>pvReason</i> is <b>NULL</b> and <i>dwReasonLength</i> is 0, <i>pdwReasonLengthConsumed</i> will contain the size of the buffer that needs to be allocated by the calling application.
 * @returns {Integer} Type: <b>DWORD</b>
 * 
 * <b>NO_ERROR</b> on success. Otherwise an error code.
 * 
 * <table>
 * <tr>
 * <th></th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is not enough space in <i>pvReason</i> to write the whole close reason.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_OPERATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No close frame has been received yet.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A parameter is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpwebsocketqueryclosestatus
 * @since windows8.0
 */
export WinHttpWebSocketQueryCloseStatus(hWebSocket, pusStatus, pvReason, dwReasonLength, pdwReasonLengthConsumed) {
    hWebSocketMarshal := hWebSocket is VarRef ? "ptr" : "ptr"
    pusStatusMarshal := pusStatus is VarRef ? "ushort*" : "ptr"
    pdwReasonLengthConsumedMarshal := pdwReasonLengthConsumed is VarRef ? "uint*" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpWebSocketQueryCloseStatus", hWebSocketMarshal, hWebSocket, pusStatusMarshal, pusStatus, "ptr", pvReason, "uint", dwReasonLength, pdwReasonLengthConsumedMarshal, pdwReasonLengthConsumed, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hRequest 
 * @param {Pointer} dwContext 
 * @returns {Pointer<Void>} 
 */
export WinHttpProtocolCompleteUpgrade(hRequest, dwContext) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpProtocolCompleteUpgrade", hRequestMarshal, hRequest, "ptr", dwContext, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ProtocolHandle 
 * @param {Integer} Flags 
 * @param {Pointer<Void>} pvBuffer 
 * @param {Integer} dwBufferLength 
 * @returns {Integer} 
 */
export WinHttpProtocolSend(ProtocolHandle, Flags, pvBuffer, dwBufferLength) {
    ProtocolHandleMarshal := ProtocolHandle is VarRef ? "ptr" : "ptr"
    pvBufferMarshal := pvBuffer is VarRef ? "ptr" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpProtocolSend", ProtocolHandleMarshal, ProtocolHandle, "uint", Flags, pvBufferMarshal, pvBuffer, "uint", dwBufferLength, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ProtocolHandle 
 * @param {Integer} Flags 
 * @param {Integer} pvBuffer 
 * @param {Integer} dwBufferLength 
 * @param {Pointer<Integer>} pdwBytesRead 
 * @returns {Integer} 
 */
export WinHttpProtocolReceive(ProtocolHandle, Flags, pvBuffer, dwBufferLength, pdwBytesRead) {
    ProtocolHandleMarshal := ProtocolHandle is VarRef ? "ptr" : "ptr"
    pdwBytesReadMarshal := pdwBytesRead is VarRef ? "uint*" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpProtocolReceive", ProtocolHandleMarshal, ProtocolHandle, "uint", Flags, "ptr", pvBuffer, "uint", dwBufferLength, pdwBytesReadMarshal, pdwBytesRead, UInt32)
    return result
}

/**
 * Registers a callback function that WinHTTP calls when the effective proxy settings change.
 * @param {Integer} ullFlags Type: \_In\_ **[ULONGLONG](/windows/win32/winprog/windows-data-types)**
 * 
 * The flag to pass to the callback (for example, **WINHTTP_PROXY_NOTIFY_CHANGE**).
 * @param {Pointer<WINHTTP_PROXY_CHANGE_CALLBACK>} _pfnCallback Type: \_In\_ **[WINHTTP_PROXY_CHANGE_CALLBACK](nc-winhttp-winhttp_proxy_change_callback.md)**
 * 
 * A pointer to the callback function that should be called when the effective proxy settings change.
 * @param {Pointer<Void>} pvContext Type: \_In\_ **[PVOID](/windows/win32/winprog/windows-data-types)**
 * 
 * A pointer to a context object to pass to the callback.
 * @param {Pointer<Pointer<Void>>} hRegistration Type: \_Out\_ **WINHTTP_PROXY_CHANGE_REGISTRATION_HANDLE\***
 * 
 * A handle that identifies the registration of the callback function. To unregister, pass this value to [WinHttpUnregisterProxyChangeNotification](nf-winhttp-winhttpunregisterproxychangenotification.md). **WINHTTP_PROXY_CHANGE_REGISTRATION_HANDLE** is equivalent to [PVOID](/windows/win32/winprog/windows-data-types).
 * @returns {Integer} A **[DWORD](/windows/win32/winprog/windows-data-types)** containing a status code indicating the result of the operation. The following codes can be returned (the list is not exhaustive).
 * 
 * |Code|Description|
 * |-|-|
 * |ERROR_SUCCESS|The operation succeeded.|
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpregisterproxychangenotification
 */
export WinHttpRegisterProxyChangeNotification(ullFlags, _pfnCallback, pvContext, hRegistration) {
    pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"
    hRegistrationMarshal := hRegistration is VarRef ? "ptr*" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpRegisterProxyChangeNotification", "uint", ullFlags, "ptr", _pfnCallback, pvContextMarshal, pvContext, hRegistrationMarshal, hRegistration, UInt32)
    return result
}

/**
 * Unregisters a callback function that was registered by calling [WinHttpRegisterProxyChangeNotification](nf-winhttp-winhttpregisterproxychangenotification.md).
 * @param {Pointer<Void>} hRegistration Type: \_In\_ **WINHTTP_PROXY_CHANGE_REGISTRATION_HANDLE\***
 * 
 * The handle that was returned from [WinHttpRegisterProxyChangeNotification](nf-winhttp-winhttpregisterproxychangenotification.md).
 * @returns {Integer} A **[DWORD](/windows/win32/winprog/windows-data-types)** containing a status code indicating the result of the operation.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpunregisterproxychangenotification
 */
export WinHttpUnregisterProxyChangeNotification(hRegistration) {
    hRegistrationMarshal := hRegistration is VarRef ? "ptr" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpUnregisterProxyChangeNotification", hRegistrationMarshal, hRegistration, UInt32)
    return result
}

/**
 * Retrieves extended proxy settings.
 * @param {Pointer<Void>} hResolver Type: \_In\_ **[HINTERNET](/windows/win32/winprog/windows-data-types)**
 * 
 * The WinHTTP resolver handle returned by the [WinHttpCreateProxyResolver](nf-winhttp-winhttpcreateproxyresolver.md) function.
 * @param {WINHTTP_PROXY_SETTINGS_TYPE} ProxySettingsType Type: \_In\_ **[WINHTTP_PROXY_SETTINGS_TYPE](/windows/win32/api/winhttp/ne-winhttp-winhttp_proxy_settings_type)**
 * 
 * A proxy settings type.
 * @param {Pointer<WINHTTP_PROXY_SETTINGS_PARAM>} pProxySettingsParam Type: \_In\_opt\_ **[PWINHTTP_PROXY_SETTINGS_PARAM](ns-winhttp-winhttp_proxy_settings_param.md)**
 * 
 * An optional pointer to a [WINHTTP_PROXY_SETTINGS_PARAM](ns-winhttp-winhttp_proxy_settings_param.md).
 * @param {Pointer} pContext Type: \_In\_opt\_ **[DWORD_PTR](/windows/win32/winprog/windows-data-types)**
 * 
 * An optional pointer to a **[DWORD](/windows/win32/winprog/windows-data-types)** containing context data that will be passed to the completion callback function.
 * @returns {Integer} A **[DWORD](/windows/win32/winprog/windows-data-types)** containing a status code indicating the result of the operation. The following codes can be returned (the list is not exhaustive).
 * 
 * |Code|Description|
 * |-|-|
 * |ERROR_IO_PENDING|The operation is continuing asynchronously.|
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpgetproxysettingsex
 */
export WinHttpGetProxySettingsEx(hResolver, ProxySettingsType, pProxySettingsParam, pContext) {
    hResolverMarshal := hResolver is VarRef ? "ptr" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpGetProxySettingsEx", hResolverMarshal, hResolver, WINHTTP_PROXY_SETTINGS_TYPE, ProxySettingsType, WINHTTP_PROXY_SETTINGS_PARAM.Ptr, pProxySettingsParam, "ptr", pContext, UInt32)
    return result
}

/**
 * Retrieves the results of a call to [WinHttpGetProxySettingsEx](nf-winhttp-winhttpgetproxysettingsex.md).
 * @param {Pointer<Void>} hResolver Type: \_In\_ **[HINTERNET](/windows/win32/winprog/windows-data-types)**
 * 
 * The resolver handle used to issue a previously completed call to [WinHttpGetProxySettingsEx](nf-winhttp-winhttpgetproxysettingsex.md).
 * @param {Pointer<Void>} pProxySettingsEx A pointer to a [WINHTTP_PROXY_SETTINGS_EX](ns-winhttp-winhttp_proxy_settings_ex.md) structure. The memory occupied by the structure is allocated by **WinHttpGetProxySettingsResultEx**, so you need to free that memory by passing this pointer to [WinHttpFreeProxySettingsEx](nf-winhttp-winhttpfreeproxysettingsex.md).
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpgetproxysettingsresultex
 */
export WinHttpGetProxySettingsResultEx(hResolver, pProxySettingsEx) {
    hResolverMarshal := hResolver is VarRef ? "ptr" : "ptr"
    pProxySettingsExMarshal := pProxySettingsEx is VarRef ? "ptr" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpGetProxySettingsResultEx", hResolverMarshal, hResolver, pProxySettingsExMarshal, pProxySettingsEx, UInt32)
    return result
}

/**
 * Frees the data retrieved from a previous call to [WinHttpGetProxySettingsResultEx](nf-winhttp-winhttpgetproxysettingsresultex.md).
 * @param {WINHTTP_PROXY_SETTINGS_TYPE} ProxySettingsType Type: \_In\_ **[WINHTTP_PROXY_SETTINGS_TYPE](/windows/win32/api/winhttp/ne-winhttp-winhttp_proxy_settings_type)**
 * 
 * A proxy settings type.
 * @param {Pointer<Void>} pProxySettingsEx Type: \_In\_ **[PVOID](/windows/win32/winprog/windows-data-types)**
 * 
 * A pointer to a [WINHTTP_PROXY_SETTINGS_EX](ns-winhttp-winhttp_proxy_settings_ex.md) structure that was retrieved from a previous call to [WinHttpGetProxySettingsResultEx](nf-winhttp-winhttpgetproxysettingsresultex.md).
 * @returns {Integer} This function does not return a value.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpfreeproxysettingsex
 */
export WinHttpFreeProxySettingsEx(ProxySettingsType, pProxySettingsEx) {
    pProxySettingsExMarshal := pProxySettingsEx is VarRef ? "ptr" : "ptr"

    result := DllCall("WINHTTP.dll\WinHttpFreeProxySettingsEx", WINHTTP_PROXY_SETTINGS_TYPE, ProxySettingsType, pProxySettingsExMarshal, pProxySettingsEx, UInt32)
    return result
}

;@endregion Functions
