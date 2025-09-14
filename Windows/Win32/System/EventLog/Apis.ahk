#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EventLog {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static EVT_VARIANT_TYPE_MASK => 127

    /**
     * @type {Integer (UInt32)}
     */
    static EVT_VARIANT_TYPE_ARRAY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EVT_READ_ACCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVT_WRITE_ACCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVT_CLEAR_ACCESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EVT_ALL_ACCESS => 7
;@endregion Constants

;@region Methods
    /**
     * Establishes a connection to a remote computer that you can use when calling the other Windows Event Log functions.
     * @remarks
     * When you are finished with the session handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function. Closing the session handle will also close all open handles created in the session (closing the open handles cancels any current activity on those handles).
     * 
     * To connect to the remote computer, the remote computer must enable the "Remote Event Log Management" Windows Firewall exception; otherwise, when you try to use the session handle, the call will error with RPC_S_SERVER_UNAVAILABLE. The computer to which you are connecting must be running Windows Vista or later.
     * 
     * This function does not validate the credentials; the credentials are validated the first time you try to use the session handle. If the credentials are not valid, the call will fail with ERROR_ACCESS_DENIED.
     * @param {Integer} LoginClass The connection method to use to connect to the remote computer. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_login_class">EVT_LOGIN_CLASS</a> enumeration.
     * @param {Pointer<Void>} Login A <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_rpc_login">EVT_RPC_LOGIN</a> structure that identifies the remote computer that you want to connect to, the user's credentials, and the type of authentication to use when connecting.
     * @returns {Pointer} If successful, the function returns a session handle that you can use to access event log information on the remote computer; otherwise, <b>NULL</b>. If <b>NULL</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtopensession
     * @since windows6.0.6000
     */
    static EvtOpenSession(LoginClass, Login) {
        static Timeout := 0, Flags := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtOpenSession", "int", LoginClass, "ptr", Login, "uint", Timeout, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes an open handle.
     * @remarks
     * You cannot use the handle after the handle is closed. When you close a parent handle, any opened handles that were created using the handle are also closed. For example, if you query for events, the query result contains a handle for each event that matches the query. Best practice suggests that you close each event handle when you are done with the event but if you do not, when you close the query handle, all event handles are also closed.
     * @param {Pointer} Object An open event handle to close.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. To get the error code, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtclose
     * @since windows6.0.6000
     */
    static EvtClose(Object) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtClose", "ptr", Object, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Cancels all pending operations on a handle.
     * @remarks
     * Use this function to cancel long-running operations. For example, calling the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtnext">EvtNext</a> function could theoretically take a long time due to 
     *     the filtering of thousands of event records.  Calling 
     *     <b>EvtCancel</b> would stop the 
     *     <b>EvtNext</b> function from processing further event records. Note 
     *     that the function may not be able to stop the operation immediately.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function to close the handle 
     *     when done.
     * 
     * The following procedure describes how to cancel a long-running operation.
     * 
     * <p class="proch"><b>To cancel a long-running operation</b>
     * 
     * <ol>
     * <li>Thread A calls a long running operation (for example,  the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtseek">EvtSeek</a> function).</li>
     * <li>Thread B wants to cancel and close all operations, so thread B calls the 
     *       <b>EvtCancel</b> function.</li>
     * <li>Thread B then waits for all pending calls to complete (by synchronizing with thread A). Because the 
     *       <b>EvtCancel</b> function was called, thread A should complete 
     *       soon after the call to the <b>EvtCancel</b> was made.</li>
     * <li>After thread A has fully completed the operation 
     *       (<a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtseek">EvtSeek</a>), thread B can close the query result handle using 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function.</li>
     * </ol>
     * The operation being stopped will return with an error code of ERROR_CANCELLED.
     * @param {Pointer} Object The handle whose operation you want to cancel. You can cancel the following operations:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclearlog">EvtClearLog</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtexportlog">EvtExportLog</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtnext">EvtNext</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtquery">EvtQuery</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtseek">EvtSeek</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsubscribe">EvtSubscribe</a>
     * </li>
     * </ul>
     * To cancel the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclearlog">EvtClearLog</a>, 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtexportlog">EvtExportLog</a>, 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtquery">EvtQuery</a>, and 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsubscribe">EvtSubscribe</a> operations, you must pass the session 
     *        handle. To specify the default session (local session), set this parameter to 
     *        <b>NULL</b>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. To get the error code, call the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtcancel
     * @since windows6.0.6000
     */
    static EvtCancel(Object) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtCancel", "ptr", Object, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a text message that contains the extended error information for the current error.
     * @remarks
     * You must call this function on the thread that generated the error and before calling another Windows Event Log function.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtquery">EvtQuery</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsubscribe">EvtSubscribe</a> functions can provide extended error information if there is a problem with the specified XPath. For example, the error information can identify the character in the XPath where a parsing error occurred. To receive the extended error information for a malformed XPath, you cannot specify the EvtQueryTolerateQueryErrors flag when calling <b>EvtQuery</b> or <b>EvtSubscribe</b>.
     * @param {Integer} BufferSize The size of the <i>Buffer</i> buffer, in characters.
     * @param {Pointer<PWSTR>} Buffer A caller-allocated string buffer that will receive the extended error information. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<UInt32>} BufferUsed The size, in characters, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {Integer} The return value is ERROR_SUCCESS if the call succeeded; otherwise, a Win32 error code.
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtgetextendedstatus
     * @since windows6.0.6000
     */
    static EvtGetExtendedStatus(BufferSize, Buffer, BufferUsed) {
        result := DllCall("wevtapi.dll\EvtGetExtendedStatus", "uint", BufferSize, "ptr", Buffer, "ptr", BufferUsed, "uint")
        return result
    }

    /**
     * Runs a query to retrieve events from a channel or log file that match the specified query criteria.
     * @remarks
     * To get events from the query results, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtnext">EvtNext</a> function. To retrieve events beginning with a specific event in the results, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtseek">EvtSeek</a> function.
     * 
     *  You must call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function with the query results handle when done.
     * 
     * You must only use the query handle that this function returns on the same thread that created the handle.
     * @param {Pointer} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> to query for events on the local computer.
     * @param {Pointer<PWSTR>} Path The name of the channel or the full path to a log file that contains the events that you want to query. You can specify an .evt, .evtx, or.etl log file. The path is required if the <i>Query</i> parameter contains an XPath query; the path is ignored if the <i>Query</i> parameter contains a structured XML query and the query specifies the path.
     * @param {Pointer<PWSTR>} Query A query that specifies the types of events that you want to retrieve. You can specify an XPath 1.0 query or structured XML query. If your XPath contains more than 20 expressions, use a structured XML query. To receive all events, set this parameter to <b>NULL</b> or "*".
     * @param {Integer} Flags One or more flags that specify the order that you want to receive the events and whether you are querying against a channel or log file.  For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_query_flags">EVT_QUERY_FLAGS</a> enumeration.
     * @returns {Pointer} A handle to the query results if successful; otherwise, <b>NULL</b>. If the function returns <b>NULL</b>, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtquery
     * @since windows6.0.6000
     */
    static EvtQuery(Session, Path, Query, Flags) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtQuery", "ptr", Session, "ptr", Path, "ptr", Query, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the next event from the query or subscription results.
     * @remarks
     * Call this function in a loop until the function returns <b>FALSE</b> and the error code is ERROR_NO_MORE_ITEMS.
     * 
     * For each event that you retrieve, you can then call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtcreaterendercontext">EvtCreateRenderContext</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtrender">EvtRender</a> functions to render the event.
     * 
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> on each event handle that you receive.
     * @param {Pointer} ResultSet The handle to a query or subscription result set that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtquery">EvtQuery</a> function or the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsubscribe">EvtSubscribe</a> function returns.
     * @param {Integer} EventsSize The number of elements in the <i>EventArray</i> array. The function will try to retrieve this number of elements from the result set.
     * @param {Pointer<IntPtr>} Events A pointer to an array of handles that will be set to the handles to the events from the result set.
     * @param {Integer} Timeout The number of milliseconds that you are willing to wait for a result.  Set to INFINITE to indicate no time-out value. If the time-out expires, the last error is set to ERROR_TIMEOUT.
     * @param {Integer} Flags Reserved. Must be zero.
     * @param {Pointer<UInt32>} Returned The number of handles in the array that are set.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. To get the error code, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtnext
     * @since windows6.0.6000
     */
    static EvtNext(ResultSet, EventsSize, Events, Timeout, Flags, Returned) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtNext", "ptr", ResultSet, "uint", EventsSize, "ptr", Events, "uint", Timeout, "uint", Flags, "ptr", Returned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Seeks to a specific event in a query result set.
     * @remarks
     * You can use this function only on result sets from an Admin or Operational channel, or from .evtx log files.
     * @param {Pointer} ResultSet The handle to a query result set that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtquery">EvtQuery</a> function returns.
     * @param {Integer} Position The zero-based offset to an event in the result set. The flag that you specify in the <i>Flags</i> parameter indicates the beginning relative position in the result set from which to seek. For example, you can seek from the beginning of the results or from the end of the results. Set to 0 to move to the relative position specified by the flag.
     * @param {Pointer} Bookmark A handle to a bookmark that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtcreatebookmark">EvtCreateBookmark</a> function returns. The bookmark identifies an event in the result set to which you want to seek. Set this parameter only if the  <i>Flags</i> parameter has the EvtSeekRelativeToBookmark  flag set.
     * @param {Integer} Flags One or more flags that indicate the relative position in the result set from which to seek. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_seek_flags">EVT_SEEK_FLAGS</a> enumeration.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. To get the error code, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtseek
     * @since windows6.0.6000
     */
    static EvtSeek(ResultSet, Position, Bookmark, Flags) {
        static Timeout := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtSeek", "ptr", ResultSet, "int64", Position, "ptr", Bookmark, "uint", Timeout, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a subscription that will receive current and future events from a channel or log file that match the specified query criteria.
     * @remarks
     * To cancel the subscription, pass the returned subscription handle to the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function.
     * 
     * There are two subscription models: the poll model and the push model. In the push model, you implement a subscription callback and set the <i>Callback</i> parameter to your implementation. The service will call your callback for each event that matches your query criteria (or if an error occurs).
     * 
     * In the poll model, you create an event object that the service signals. When signaled, you call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtnext">EvtNext</a> function using the subscription handle to enumerate the events. You must call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function on each event that you enumerate. You then reset the object and wait for the service to signal again. This process repeats until you cancel the subscription.
     * @param {Pointer} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> to subscribe to events on the local computer.
     * @param {Pointer<HANDLE>} SignalEvent The handle to an event object that the service will signal when new events are available that match your query criteria.  This parameter must be <b>NULL</b> if the <i>Callback</i> parameter is not <b>NULL</b>.
     * @param {Pointer<PWSTR>} ChannelPath The name of the Admin or Operational channel that contains the events that you want to subscribe to (you cannot subscribe to Analytic or Debug channels). The path is required if the <i>Query</i> parameter contains an XPath query; the path is ignored if the <i>Query</i> parameter contains a structured XML query.
     * @param {Pointer<PWSTR>} Query A query that specifies the types of events that you want the subscription service to return. You can specify an XPath 1.0 query or structured XML query. If your XPath contains more than 20 expressions, use a structured XML query. To receive all events, set this parameter to <b>NULL</b> or "*".
     * @param {Pointer} Bookmark A handle to a bookmark that identifies the starting point for the subscription.  To get a bookmark handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtcreatebookmark">EvtCreateBookmark</a> function.  You must set this parameter if the <i>Flags</i> parameter contains the EvtSubscribeStartAfterBookmark flag; otherwise, <b>NULL</b>.
     * @param {Pointer<Void>} Context A caller-defined context value that the subscription service will pass to the specified callback each time it delivers an event.
     * @param {Pointer<EVT_SUBSCRIBE_CALLBACK>} Callback Pointer to your <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nc-winevt-evt_subscribe_callback">EVT_SUBSCRIBE_CALLBACK</a> callback function that will receive the subscription events. This parameter must be <b>NULL</b> if the <i>SignalEvent</i> parameter is not <b>NULL</b>.
     * @param {Integer} Flags One or more flags that specify when to start subscribing to events. For example, if you specify EvtSubscribeStartAtOldestRecord, the service will retrieve all current and future events that match your query criteria; however, if you specify EvtSubscribeToFutureEvents, the service returns only future events that match your query criteria. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_subscribe_flags">EVT_SUBSCRIBE_FLAGS</a> enumeration.
     * @returns {Pointer} A handle to the subscription if successful; otherwise, <b>NULL</b>. If the function returns <b>NULL</b>, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code. You must call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function with the subscription handle when done.
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtsubscribe
     * @since windows6.0.6000
     */
    static EvtSubscribe(Session, SignalEvent, ChannelPath, Query, Bookmark, Context, Callback, Flags) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtSubscribe", "ptr", Session, "ptr", SignalEvent, "ptr", ChannelPath, "ptr", Query, "ptr", Bookmark, "ptr", Context, "ptr", Callback, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a context that specifies the information in the event that you want to render.
     * @remarks
     * To render the specified information from the event, call the  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtrender">EvtRender</a> function.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function to close the handle when done.
     * @param {Integer} ValuePathsCount The number of XPath expressions in the <i>ValuePaths</i> parameter.
     * @param {Pointer<PWSTR>} ValuePaths An array of XPath expressions that uniquely identify a node or attribute in the event that you want to render.
     * 
     * Set to **NULL** if the **EvtRenderContextValues** context flag is not set in the *Flags* parameter.
     * 
     * The expressions must not contain the **OR** or **AND** operator. 
     * 
     * Attribute names in the expressions must not be followed by a space.
     * @param {Integer} Flags One or more flags that identify the information in the event that you want to render. For example, the system information, user information, or specific values. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_render_context_flags">EVT_RENDER_CONTEXT_FLAGS</a> enumeration.
     * @returns {Pointer} A context handle that you use when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtrender">EvtRender</a> function to render the contents of an event; otherwise, <b>NULL</b>. If <b>NULL</b>, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtcreaterendercontext
     * @since windows6.0.6000
     */
    static EvtCreateRenderContext(ValuePathsCount, ValuePaths, Flags) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtCreateRenderContext", "uint", ValuePathsCount, "ptr", ValuePaths, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Renders an XML fragment based on the rendering context that you specify.
     * @remarks
     * There is a one-to-one relationship between the array of XPath expressions that you specified when you called the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtcreaterendercontext">EvtCreateRenderContext</a> function and  the array the values returned in the buffer.
     * 
     * When an EVT_HANDLE from this function is used in the <b>EvtRender</b> function, the list of values that is returned by that function consists of an array of <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> structures, each corresponding to exactly one of the XPATH expressions in the original <i>ValuePaths</i> parameter array in order of appearance.  Each such <b>EVT_VARIANT</b> structure contains the value that is identified by its corresponding XPATH expression for the event that is being rendered.  If no value is found, the <b>EVT_VARIANT</b> structure contains <b>NULL</b>.  If multiple values are present, the <b>EVT_VARIANT</b> structure will contain the first value encountered.
     * 
     * Be careful when comparing floating-point numbers in XPath queries. Any string representation of a floating-point number is approximated, so the value displayed in XML might not match the number stored with the event. Floating-point numbers should be compared as being less than or greater than a constant.
     * @param {Pointer} Context A handle to the rendering context that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtcreaterendercontext">EvtCreateRenderContext</a> function returns. This parameter must be set to <b>NULL</b> if the <i>Flags</i> parameter is set to EvtRenderEventXml or EvtRenderBookmark.
     * @param {Pointer} Fragment A handle to an event or to a bookmark. Set this parameter to a bookmark handle if the <i>Flags</i> parameter is set to EvtRenderBookmark; otherwise, set to an event handle.
     * @param {Integer} Flags A flag that identifies what to render. For example, the entire event or specific properties of the event. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_render_flags">EVT_RENDER_FLAGS</a> enumeration.
     * @param {Integer} BufferSize The size of the <i>Buffer</i> buffer, in bytes.
     * @param {Pointer<Void>} Buffer A caller-allocated buffer that will receive the rendered output. The contents is a <b>null</b>-terminated Unicode string if the <i>Flags</i> parameter is set to EvtRenderEventXml or EvtRenderBookmark. Otherwise, if <i>Flags</i> is set to EvtRenderEventValues, the buffer contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> structures; one for each property specified by the rendering context. The <i>PropertyCount</i> parameter contains the number of elements in the array.
     * 
     *  You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<UInt32>} BufferUsed The size, in bytes, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @param {Pointer<UInt32>} PropertyCount The number of the properties in the <i>Buffer</i> parameter if the <i>Flags</i> parameter is set to EvtRenderEventValues; otherwise, zero.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. Call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtrender
     * @since windows6.0.6000
     */
    static EvtRender(Context, Fragment, Flags, BufferSize, Buffer, BufferUsed, PropertyCount) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtRender", "ptr", Context, "ptr", Fragment, "uint", Flags, "uint", BufferSize, "ptr", Buffer, "ptr", BufferUsed, "ptr", PropertyCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Formats a message string. (EvtFormatMessage)
     * @remarks
     * When the service attempts to find a message for an event, the service looks in the message table resources of the publisher indicated by the <i>PublisherMetadata</i> parameter. After the message ID is found, the following search algorithms are used.
     * 
     * 
     * 
     * For event messages:
     * 
     * <ol>
     * <li>Search the file specified in <b>messageFileName</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-provider-eventstype-element">provider</a> element.</li>
     * <li> If not found, search system messages.</li>
     * </ol>
     * For the Level, Opcode, and Keyword attributes of the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-event-definitiontype-element">event</a> element:
     * 
     * <ol>
     * <li>Search the Winmeta provider resources.</li>
     * <li>Search the file specified in <b>messageFileName</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-provider-eventstype-element">provider</a> element.</li>
     * </ol>
     * For the Task attribute of the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-event-definitiontype-element">event</a> element:
     * 
     * <ol>
     * <li>Search the file specified in <b>messageFileName</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-provider-eventstype-element">provider</a> element.</li>
     * <li>If not found, search the Winmeta provider resources.</li>
     * </ol>
     * For localizable parameters referenced as %%<i>n</i> (where <i>n</i> is the message ID) in the event message:
     * 
     * <ol>
     * <li>Search files listed in <b>parameterFileName</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-provider-eventstype-element">provider</a> element from left to right.</li>
     * <li>If not found, search system messages.
     * </li>
     * </ol>
     * @param {Pointer} PublisherMetadata A handle to the provider's metadata that the  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenpublishermetadata">EvtOpenPublisherMetadata</a> function returns. The handle acts as a formatting context for the event or message identifier. 
     * 
     * You can set this parameter to <b>NULL</b> if the Windows Event Collector service forwarded the event. Forwarded events include a <b>RenderingInfo</b> section that contains the rendered message strings. You can also set this parameter to <b>NULL</b> if the event property that you are formatting is defined in the Winmeta.xml file (for example, if level is set to win:Error). In the latter case, the service uses the Winmeta provider as the formatting context and will format only those message strings that you reference in your event that are defined in the Winmeta.xml file.
     * @param {Pointer} Event A handle to an event. The <i>Flags</i> parameter specifies the message string in the event that you want to format. This parameter must be <b>NULL</b> if the <i>Flags</i> parameter is set to <b>EvtFormatMessageId</b>.
     * @param {Integer} MessageId The resource identifier of the message string that you want to format. To get the resource identifier for a message string, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetpublishermetadataproperty">GetPublisherMetadataProperty</a> function. Set this parameter only if the <i>Flags</i> parameter is set to <b>EvtFormatMessageId</b>.
     * @param {Integer} ValueCount The number of values in the <i>Values</i> parameter.
     * @param {Pointer<EVT_VARIANT>} Values An array of insertion values to use when formatting the event's message string. Typically, you set this parameter to <b>NULL</b> and the function gets the insertion values from the event data itself. You would use this parameter to override the default behavior and supply the insertion values to use. For example, you might use this parameter if you wanted to resolve a SID to a principal name before inserting the value. 
     * 
     * To override the insertion values, the <i>Flags</i> parameter must be set to <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_format_message_flags">EvtFormatMessageEvent</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_format_message_flags">EvtFormatMessageXML</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_format_message_flags">EvtFormatMessageId</a>. If <i>Flags</i> is set to <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_format_message_flags">EvtFormatMessageId</a>, the resource identifier must identify the event's message string.
     * @param {Integer} Flags A flag that specifies the message string in the event to format. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_format_message_flags">EVT_FORMAT_MESSAGE_FLAGS</a> enumeration.
     * @param {Integer} BufferSize The size of the <i>Buffer</i> buffer, in characters.
     * @param {Pointer<PWSTR>} Buffer A caller-allocated buffer that will receive the formatted message string. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<UInt32>} BufferUsed The size, in characters of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. Call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtformatmessage
     * @since windows6.0.6000
     */
    static EvtFormatMessage(PublisherMetadata, Event, MessageId, ValueCount, Values, Flags, BufferSize, Buffer, BufferUsed) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtFormatMessage", "ptr", PublisherMetadata, "ptr", Event, "uint", MessageId, "uint", ValueCount, "ptr", Values, "uint", Flags, "uint", BufferSize, "ptr", Buffer, "ptr", BufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a handle to a channel or log file that you can then use to get information about the channel or log file.
     * @remarks
     * Relative paths and environment variables cannot be used when specifying a file.  A Universal Naming Convention (UNC) path can be used to locate the file.  Any relative path and environment variable expansion needs to be done prior to making API calls.
     * 
     * To get information about the channel or log file, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetloginfo">EvtGetLogInfo</a> function.
     * @param {Pointer} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> to open a channel or log on the local computer.
     * @param {Pointer<PWSTR>} Path The name of the channel or the full path to the exported log file.
     * @param {Integer} Flags A flag that determines whether the <i>Path</i> parameter points to a log file or channel. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_open_log_flags">EVT_OPEN_LOG_FLAGS</a> enumeration.
     * @returns {Pointer} If successful, the function returns a handle to the file or channel; otherwise, <b>NULL</b>. If <b>NULL</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtopenlog
     * @since windows6.0.6000
     */
    static EvtOpenLog(Session, Path, Flags) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtOpenLog", "ptr", Session, "ptr", Path, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets information about a channel or log file.
     * @remarks
     * You can get complete information for Operational and Admin channels or .evtx files; however, for Debug and Analytic channels or .etl files, you cannot get information for the EvtLogFull, EvtLogOldestRecordNumber, and EvtLogNumberOfLogRecords properties.
     * @param {Pointer} Log A handle to the channel or log file that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenlog">EvtOpenLog</a> function returns.
     * @param {Integer} PropertyId The identifier of the property to retrieve. For a list of property identifiers, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_log_property_id">EVT_LOG_PROPERTY_ID</a> enumeration.
     * @param {Integer} PropertyValueBufferSize The size of the <i>PropertyValueBuffer</i> buffer, in bytes.
     * @param {Pointer<EVT_VARIANT>} PropertyValueBuffer A caller-allocated buffer that will receive the property value. The buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> object. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<UInt32>} PropertyValueBufferUsed The size, in bytes, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. To get the error code, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtgetloginfo
     * @since windows6.0.6000
     */
    static EvtGetLogInfo(Log, PropertyId, PropertyValueBufferSize, PropertyValueBuffer, PropertyValueBufferUsed) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtGetLogInfo", "ptr", Log, "int", PropertyId, "uint", PropertyValueBufferSize, "ptr", PropertyValueBuffer, "ptr", PropertyValueBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes all events from the specified channel and writes them to the target log file.
     * @remarks
     * To copy events from a channel or log file, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtexportlog">EvtExportLog</a> function.
     * 
     * You must specify the absolute path to the target log file; you cannot use relative paths and environment variables to specifying the target log file.  The path can be a Universal Naming Convention (UNC) path. You should use .evtx as the file name extension.
     * 
     * This function affects only the channel—if the channel uses autoBackup or fileMax, this function will not affect those backup files.
     * @param {Pointer} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> for local channels.
     * @param {Pointer<PWSTR>} ChannelPath The name of the channel to clear.
     * @param {Pointer<PWSTR>} TargetFilePath The full path to the target log file that will receive the events. Set to <b>NULL</b> to clear the log file and not save the events.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. Use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtclearlog
     * @since windows6.0.6000
     */
    static EvtClearLog(Session, ChannelPath, TargetFilePath, Flags) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtClearLog", "ptr", Session, "ptr", ChannelPath, "ptr", TargetFilePath, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies events from the specified channel or log file and writes them to the target log file.
     * @remarks
     * You can export events from multiple channels using a structured XML query (see <a href="https://docs.microsoft.com/windows/desktop/WES/consuming-events">Consuming Events</a>); however, you cannot use this function to merge events from multiple log files. If the query result is empty, the service creates a file that contains header information but no events.
     * 
     * To remove events from a channel and write them to a target log file, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclearlog">EvtClearLog</a> function. To include localized strings with the events in the log file, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtarchiveexportedlog">EvtArchiveExportedLog</a> function.
     * 
     * You must specify the absolute path to the target log file; you cannot use relative paths and environment variables to specifying the target log file.  The path can be a Universal Naming Convention (UNC) path. You should use .evtx as the file name extension.
     * 
     * This function  affects only the specified channel or log file—if the channel uses autoBackup or fileMax, this function will not affect those backup files.
     * @param {Pointer} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> for local channels.
     * @param {Pointer<PWSTR>} Path The name of the channel or the full path to a log file that contains the events that you want to export. If the <i>Query</i> parameter contains an XPath query, you must specify the channel or log file. If the <i>Flags</i> parameter contains EvtExportLogFilePath, you must specify the log file. If the <i>Query</i> parameter contains a structured XML query, the channel or path that you specify here must match the channel or path in the query. If the <i>Flags</i> parameter contains EvtExportLogChannelPath, this parameter can be <b>NULL</b> if  the query is a structured XML query that specifies the channel.
     * @param {Pointer<PWSTR>} Query A query that specifies the types of events that you want to export. You can specify an XPath 1.0 query or structured XML query. If your XPath contains more than 20 expressions, use a structured XML query. To export all events, set this parameter to <b>NULL</b> or "*".
     * @param {Pointer<PWSTR>} TargetFilePath The full path to the target log file that will receive the events. The target log file must not exist.
     * @param {Integer} Flags Flags that indicate whether the events come from a channel or log file. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_exportlog_flags">EVT_EXPORTLOG_FLAGS</a> enumeration.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. Use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtexportlog
     * @since windows6.0.6000
     */
    static EvtExportLog(Session, Path, Query, TargetFilePath, Flags) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtExportLog", "ptr", Session, "ptr", Path, "ptr", Query, "ptr", TargetFilePath, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds localized strings to the events in the specified log file.
     * @remarks
     * To consume an event from an exported log file, the provider needs to be available to provide the resources (message strings) for the event. You would call this function to include the localized resources with the event, so that you can consume the event when the provider is not available.
     * @param {Pointer} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> for local channels.
     * @param {Pointer<PWSTR>} LogFilePath The full path to the exported log file that contains the events to localize.
     * @param {Integer} Locale The locale to use to localize the strings that the service adds to the events in the log file. If zero, the function uses the calling thread's locale. If the provider's resources does not contain the locale, the string is empty.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. Use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtarchiveexportedlog
     * @since windows6.0.6000
     */
    static EvtArchiveExportedLog(Session, LogFilePath, Locale, Flags) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtArchiveExportedLog", "ptr", Session, "ptr", LogFilePath, "uint", Locale, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a handle that you use to enumerate the list of channels that are registered on the computer.
     * @remarks
     * The enumeration includes all the channels that the providers that are registered on the computer defined. To enumerate the channel names, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtnextchannelpath">EvtNextChannelPath</a> function in a loop. The names are sorted alphabetically.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function to close the enumerator handle when done.
     * @param {Pointer} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> to enumerate the channels on the local computer.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {Pointer} If successful, the function returns a handle to the list of channel names that are registered on the computer; otherwise, <b>NULL</b>. If <b>NULL</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtopenchannelenum
     * @since windows6.0.6000
     */
    static EvtOpenChannelEnum(Session, Flags) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtOpenChannelEnum", "ptr", Session, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a channel name from the enumerator.
     * @remarks
     * Call this function in a loop until the function returns <b>FALSE</b> and the error code is ERROR_NO_MORE_ITEMS.
     * @param {Pointer} ChannelEnum A handle to the enumerator that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenchannelenum">EvtOpenChannelEnum</a> function returns.
     * @param {Integer} ChannelPathBufferSize The size of the <i>ChannelPathBuffer</i> buffer, in characters.
     * @param {Pointer<PWSTR>} ChannelPathBuffer A caller-allocated buffer that will receive the name of the channel. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<UInt32>} ChannelPathBufferUsed The size, in characters, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. To get the error code, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtnextchannelpath
     * @since windows6.0.6000
     */
    static EvtNextChannelPath(ChannelEnum, ChannelPathBufferSize, ChannelPathBuffer, ChannelPathBufferUsed) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtNextChannelPath", "ptr", ChannelEnum, "uint", ChannelPathBufferSize, "ptr", ChannelPathBuffer, "ptr", ChannelPathBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a handle that you use to read or modify a channel's configuration property.
     * @remarks
     * To get a configuration property, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetchannelconfigproperty">EvtGetChannelConfigProperty</a> function.
     * 
     * To modify a configuration property, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsetchannelconfigproperty">EvtSetChannelConfigProperty</a> function. To save the configuration changes, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsavechannelconfig">EvtSaveChannelConfig</a> function.
     * 
     * To enumerate the registered channels, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenchannelenum">EvtOpenChannelEnum</a> function.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function to close the handle when done.
     * @param {Pointer} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> to access a channel on the local computer.
     * @param {Pointer<PWSTR>} ChannelPath The name of the channel to access.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {Pointer} If successful, the function returns a handle to the channel's configuration; otherwise, <b>NULL</b>. If <b>NULL</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtopenchannelconfig
     * @since windows6.0.6000
     */
    static EvtOpenChannelConfig(Session, ChannelPath, Flags) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtOpenChannelConfig", "ptr", Session, "ptr", ChannelPath, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Saves the changes made to a channel's configuration.
     * @remarks
     * To change a channel's configuration property, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsetchannelconfigproperty">EvtSetChannelConfigProperty</a> function.
     * 
     * You must call this function with elevated permissions; otherwise, this function returns ERROR_ACCESS_DENIED.
     * @param {Pointer} ChannelConfig A handle to the channel's configuration properties that the  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenchannelconfig">EvtOpenChannelConfig</a> function returns.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. To get the error code, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtsavechannelconfig
     * @since windows6.0.6000
     */
    static EvtSaveChannelConfig(ChannelConfig, Flags) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtSaveChannelConfig", "ptr", ChannelConfig, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the specified configuration property of a channel.
     * @remarks
     * This function changes an in-memory copy of the configuration properties. To apply the changes that you have made to one or more of the configuration properties, call the  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsavechannelconfig">EvtSaveChannelConfig</a> function.
     * @param {Pointer} ChannelConfig A handle to the channel's configuration properties that the  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenchannelconfig">EvtOpenChannelConfig</a> function returns.
     * @param {Integer} PropertyId The identifier of the channel property to set. For a list of property identifiers, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_channel_config_property_id">EVT_CHANNEL_CONFIG_PROPERTY_ID</a> enumeration.
     * @param {Integer} Flags Reserved. Must be zero.
     * @param {Pointer<EVT_VARIANT>} PropertyValue The property value to set.
     * 
     * A caller-allocated buffer that contains the new configuration property value. The buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> object. Be sure to set the configuration value and variant type.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. To get the error code, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtsetchannelconfigproperty
     * @since windows6.0.6000
     */
    static EvtSetChannelConfigProperty(ChannelConfig, PropertyId, Flags, PropertyValue) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtSetChannelConfigProperty", "ptr", ChannelConfig, "int", PropertyId, "uint", Flags, "ptr", PropertyValue, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the specified channel configuration property.
     * @param {Pointer} ChannelConfig A handle to the channel's configuration properties that the  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenchannelconfig">EvtOpenChannelConfig</a> function returns.
     * @param {Integer} PropertyId The identifier of the channel property to retrieve. For a list of property identifiers, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_channel_config_property_id">EVT_CHANNEL_CONFIG_PROPERTY_ID</a> enumeration.
     * @param {Integer} Flags Reserved. Must be zero.
     * @param {Integer} PropertyValueBufferSize The size of the <i>PropertyValueBuffer</i> buffer, in bytes.
     * @param {Pointer<EVT_VARIANT>} PropertyValueBuffer A caller-allocated buffer that will receive the configuration property. The buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> object. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<UInt32>} PropertyValueBufferUsed The size, in bytes, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. To get the error code, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtgetchannelconfigproperty
     * @since windows6.0.6000
     */
    static EvtGetChannelConfigProperty(ChannelConfig, PropertyId, Flags, PropertyValueBufferSize, PropertyValueBuffer, PropertyValueBufferUsed) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtGetChannelConfigProperty", "ptr", ChannelConfig, "int", PropertyId, "uint", Flags, "uint", PropertyValueBufferSize, "ptr", PropertyValueBuffer, "ptr", PropertyValueBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a handle that you use to enumerate the list of registered providers on the computer.
     * @remarks
     * To enumerate the registered providers, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtnextpublisherid">EvtNextPublisherId</a> function in a loop.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function to close the enumerator handle when done.
     * @param {Pointer} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> to enumerate the registered providers on the local computer.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {Pointer} If successful, the function returns a handle to the list of registered providers; otherwise, <b>NULL</b>. If <b>NULL</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtopenpublisherenum
     * @since windows6.0.6000
     */
    static EvtOpenPublisherEnum(Session, Flags) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtOpenPublisherEnum", "ptr", Session, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the identifier of a provider from the enumerator.
     * @remarks
     * Call this function in a loop until the function returns <b>FALSE</b> and the error code is ERROR_NO_MORE_ITEMS.
     * 
     * This list of provider names is not sorted alphabetically.
     * @param {Pointer} PublisherEnum A handle to the registered providers enumerator that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenpublisherenum">EvtOpenPublisherEnum</a> function returns.
     * @param {Integer} PublisherIdBufferSize The size of the <i>PublisherIdBuffer</i> buffer, in characters.
     * @param {Pointer<PWSTR>} PublisherIdBuffer A caller-allocated buffer that will receive the name of the registered provider. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<UInt32>} PublisherIdBufferUsed The size, in characters, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. To get the error code, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtnextpublisherid
     * @since windows6.0.6000
     */
    static EvtNextPublisherId(PublisherEnum, PublisherIdBufferSize, PublisherIdBuffer, PublisherIdBufferUsed) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtNextPublisherId", "ptr", PublisherEnum, "uint", PublisherIdBufferSize, "ptr", PublisherIdBuffer, "ptr", PublisherIdBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a handle that you use to read the specified provider's metadata.
     * @remarks
     * If you specify an archived log file, this function will check for the specified provider's metadata in the log file. If the provider's metadata is not found in the log file, the function will search for the provider in the list of registered providers on the local computer.
     * 
     * To read the provider's metadata, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetpublishermetadataproperty">EvtGetPublisherMetadataProperty</a> function. To enumerate the events that the provider defines, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopeneventmetadataenum">EvtOpenEventMetadataEnum</a> function.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function to close the metadata handle when done.
     * @param {Pointer} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> to get the metadata for a provider on the local computer.
     * @param {Pointer<PWSTR>} PublisherId The name of the provider. To enumerate the names of the providers registered on the computer, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenpublisherenum">EvtOpenPublisherEnum</a> function.
     * @param {Pointer<PWSTR>} LogFilePath The full path to an archived log file that contains the events that the provider logged. An archived log file also contains the provider's metadata. Use this parameter when the provider is not registered on the local computer. Set to <b>NULL</b> when reading the metadata from a registered provider..
     * @param {Integer} Locale The locale identifier to use when accessing the localized metadata from the provider. To create the locale identifier, use the MAKELCID macro. Set to 0 to use the locale identifier of the calling thread.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {Pointer} If successful, the function returns a handle to the provider's metadata; otherwise, <b>NULL</b>. If <b>NULL</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtopenpublishermetadata
     * @since windows6.0.6000
     */
    static EvtOpenPublisherMetadata(Session, PublisherId, LogFilePath, Locale, Flags) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtOpenPublisherMetadata", "ptr", Session, "ptr", PublisherId, "ptr", LogFilePath, "uint", Locale, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the specified provider metadata property.
     * @remarks
     * <div class="alert"><b>Caution</b>  <p class="note">
     * <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgeteventmetadataproperty">EvtGetEventMetadataProperty</a> can return many different kinds of values in the <i>EventMetadataPropertyBuffer</i> variable. If <i>EventMetadataPropertyBuffer</i>-&gt;Type == <b>EvtVarTypeEvtHandle</b> then <i>EventMetadataPropertyBuffer</i> contains a handle that needs to be freed. When you are done with the handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function. 
     * 
     * </div>
     * <div> </div>
     * @param {Pointer} PublisherMetadata A handle to the metadata that the  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenpublishermetadata">EvtOpenPublisherMetadata</a> function returns.
     * @param {Integer} PropertyId The identifier of the metadata property to retrieve. For a list of property identifiers, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_publisher_metadata_property_id">EVT_PUBLISHER_METADATA_PROPERTY_ID</a> enumeration.
     * @param {Integer} Flags Reserved. Must be zero.
     * @param {Integer} PublisherMetadataPropertyBufferSize The size of the <i>PublisherMetadataPropertyBuffer</i> buffer, in bytes.
     * @param {Pointer<EVT_VARIANT>} PublisherMetadataPropertyBuffer A caller-allocated buffer that will receive the metadata property. The buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> object. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<UInt32>} PublisherMetadataPropertyBufferUsed The size, in bytes, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. To get the error code, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtgetpublishermetadataproperty
     * @since windows6.0.6000
     */
    static EvtGetPublisherMetadataProperty(PublisherMetadata, PropertyId, Flags, PublisherMetadataPropertyBufferSize, PublisherMetadataPropertyBuffer, PublisherMetadataPropertyBufferUsed) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtGetPublisherMetadataProperty", "ptr", PublisherMetadata, "int", PropertyId, "uint", Flags, "uint", PublisherMetadataPropertyBufferSize, "ptr", PublisherMetadataPropertyBuffer, "ptr", PublisherMetadataPropertyBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a handle that you use to enumerate the list of events that the provider defines.
     * @remarks
     * To enumerate the events, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtnexteventmetadata">EvtNextEventMetadata</a> function in a loop.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function to close the enumerator handle when done.
     * @param {Pointer} PublisherMetadata A handle to the provider's metadata that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenpublishermetadata">EvtOpenPublisherMetadata</a> function returns.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {Pointer} If successful, the function returns a handle to the list of events that the  provider defines; otherwise, <b>NULL</b>. If <b>NULL</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtopeneventmetadataenum
     * @since windows6.0.6000
     */
    static EvtOpenEventMetadataEnum(PublisherMetadata, Flags) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtOpenEventMetadataEnum", "ptr", PublisherMetadata, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets an event definition from the enumerator.
     * @remarks
     * Call this function in a loop until the function returns <b>NULL</b> and the error code is ERROR_NO_MORE_ITEMS.
     * 
     * To get a property from the event definition, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgeteventmetadataproperty">EvtGetEventMetadataProperty</a> function.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function to close the event definition handle when done.
     * @param {Pointer} EventMetadataEnum A handle to the event definition enumerator that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopeneventmetadataenum">EvtOpenEventMetadataEnum</a> function returns.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {Pointer} If successful, the function returns a handle to the event's metadata; otherwise, <b>NULL</b>. If <b>NULL</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtnexteventmetadata
     * @since windows6.0.6000
     */
    static EvtNextEventMetadata(EventMetadataEnum, Flags) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtNextEventMetadata", "ptr", EventMetadataEnum, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the specified event metadata property.
     * @param {Pointer} EventMetadata A handle to the event metadata that the  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtnexteventmetadata">EvtNextEventMetadata</a> function returns.
     * @param {Integer} PropertyId The identifier of the metadata property to retrieve. For a list of property identifiers, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_event_metadata_property_id">EVT_EVENT_METADATA_PROPERTY_ID</a> enumeration.
     * @param {Integer} Flags Reserved. Must be zero.
     * @param {Integer} EventMetadataPropertyBufferSize The size of the <i>EventMetadataPropertyBuffer</i> buffer, in bytes.
     * @param {Pointer<EVT_VARIANT>} EventMetadataPropertyBuffer A caller-allocated buffer that will receive the metadata property. The buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> object. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<UInt32>} EventMetadataPropertyBufferUsed The size, in bytes, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. To get the error code, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtgeteventmetadataproperty
     * @since windows6.0.6000
     */
    static EvtGetEventMetadataProperty(EventMetadata, PropertyId, Flags, EventMetadataPropertyBufferSize, EventMetadataPropertyBuffer, EventMetadataPropertyBufferUsed) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtGetEventMetadataProperty", "ptr", EventMetadata, "int", PropertyId, "uint", Flags, "uint", EventMetadataPropertyBufferSize, "ptr", EventMetadataPropertyBuffer, "ptr", EventMetadataPropertyBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the number of elements in the array of objects.
     * @param {Pointer} ObjectArray A handle to an array of objects that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetpublishermetadataproperty">EvtGetPublisherMetadataProperty</a> function returns.
     * @param {Pointer<UInt32>} ObjectArraySize The number of elements in the array.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. To get the error code, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtgetobjectarraysize
     * @since windows6.0.6000
     */
    static EvtGetObjectArraySize(ObjectArray, ObjectArraySize) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtGetObjectArraySize", "ptr", ObjectArray, "ptr", ObjectArraySize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a provider metadata property from the specified object in the array.
     * @remarks
     * When you call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetpublishermetadataproperty">EvtGetPublisherMetadataProperty</a> function with the following IDs, the function returns a handle to an array of objects of that type:
     * 
     * <ul>
     * <li>EvtPublisherMetadataChannelReferences</li>
     * <li>EvtPublisherMetadataLevels</li>
     * <li>EvtPublisherMetadataTasks</li>
     * <li>EvtPublisherMetadataOpcodes</li>
     * <li>EvtPublisherMetadataKeywords</li>
     * </ul>
     * For example, if you pass <b>EvtPublisherMetadataKeywords</b> to <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetpublishermetadataproperty">EvtGetPublisherMetadataProperty</a>, the function returns a handle to an array of keyword objects.
     * 
     * To determine the size of the array, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarraysize">EvtGetObjectArraySize</a> function.
     * @param {Pointer} ObjectArray A handle to an array of objects that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetpublishermetadataproperty">EvtGetPublisherMetadataProperty</a> function returns.
     * @param {Integer} PropertyId The property identifier of the metadata property that you want to get from the  specified object. For possible values, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_publisher_metadata_property_id">EVT_PUBLISHER_METADATA_PROPERTY_ID</a>.
     * @param {Integer} ArrayIndex The zero-based index of the object in the array.
     * @param {Integer} Flags Reserved. Must be zero.
     * @param {Integer} PropertyValueBufferSize The size of the <i>PropertyValueBuffer</i> buffer, in bytes.
     * @param {Pointer<EVT_VARIANT>} PropertyValueBuffer A caller-allocated buffer that will receive the metadata property. The buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> object. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<UInt32>} PropertyValueBufferUsed The size, in bytes, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. To get the error code, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtgetobjectarrayproperty
     * @since windows6.0.6000
     */
    static EvtGetObjectArrayProperty(ObjectArray, PropertyId, ArrayIndex, Flags, PropertyValueBufferSize, PropertyValueBuffer, PropertyValueBufferUsed) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtGetObjectArrayProperty", "ptr", ObjectArray, "uint", PropertyId, "uint", ArrayIndex, "uint", Flags, "uint", PropertyValueBufferSize, "ptr", PropertyValueBuffer, "ptr", PropertyValueBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets information about a query that you ran that identifies the list of channels or log files that the query attempted to access. The function also gets a list of return codes that indicates the success or failure of each access.
     * @remarks
     * You only need to call this function, if you pass the EvtQueryTolerateQueryErrors flag to <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtquery">EvtQuery</a> or the EvtSubscribeTolerateQueryErrors flag to <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsubscribe">EvtSubscribe</a>.
     * @param {Pointer} QueryOrSubscription A handle to the query that the<a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtquery">EvtQuery</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsubscribe">EvtSubscribe</a> function returns.
     * @param {Integer} PropertyId The identifier of the query information to retrieve. For a list of identifiers, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_query_property_id">EVT_QUERY_PROPERTY_ID</a> enumeration.
     * @param {Integer} PropertyValueBufferSize The size of the <i>PropertyValueBuffer</i> buffer, in bytes.
     * @param {Pointer<EVT_VARIANT>} PropertyValueBuffer A caller-allocated buffer that will receive the query information. The buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> object. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<UInt32>} PropertyValueBufferUsed The size, in bytes, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. To get the error code, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtgetqueryinfo
     * @since windows6.0.6000
     */
    static EvtGetQueryInfo(QueryOrSubscription, PropertyId, PropertyValueBufferSize, PropertyValueBuffer, PropertyValueBufferUsed) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtGetQueryInfo", "ptr", QueryOrSubscription, "int", PropertyId, "uint", PropertyValueBufferSize, "ptr", PropertyValueBuffer, "ptr", PropertyValueBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a bookmark that identifies an event in a channel.
     * @remarks
     * To create a bookmark, set the <i>BookmarkXml</i> parameter to <b>NULL</b>. Before you exit, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtupdatebookmark">EvtUpdateBookmark</a> function to update the bookmark. Pass the bookmark handle to the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtrender">EvtRender</a> function to render the bookmark as an XML string. You can then persist the string for use later. To begin consuming events from where you left off the last time, set  <i>BookmarkXml</i> to the XML string that you persisted. For a subscription, pass the bookmark handle to the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsubscribe">EvtSubscribe</a> function. For a query, pass the bookmark handle to the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtseek">EvtSeek</a> function to seek to a specific event in the query result.
     * 
     * If the query is against multiple channels, the bookmark handle will contain bookmarks for each channel. You cannot create a bookmark for a log file.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function to close the handle when done.
     * @param {Pointer<PWSTR>} BookmarkXml An XML string that contains the bookmark or <b>NULL</b> if creating a bookmark.
     * @returns {Pointer} A handle to the bookmark if the call succeeds; otherwise, <b>NULL</b>. If <b>NULL</b>, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtcreatebookmark
     * @since windows6.0.6000
     */
    static EvtCreateBookmark(BookmarkXml) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtCreateBookmark", "ptr", BookmarkXml, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Updates the bookmark with information that identifies the specified event.
     * @param {Pointer} Bookmark The handle to the bookmark to be updated. The <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtcreatebookmark">EvtCreateBookmark</a> function returns this handle.
     * @param {Pointer} Event The handle to the event to bookmark.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. Call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtupdatebookmark
     * @since windows6.0.6000
     */
    static EvtUpdateBookmark(Bookmark, Event) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtUpdateBookmark", "ptr", Bookmark, "ptr", Event, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets information that identifies the structured XML query that selected the event and the channel or log file that contained the event.
     * @remarks
     * If the query that you passed to <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtquery">EvtQuery</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsubscribe">EvtSubscribe</a> was an XPath instead of a structured XML query, the query identifier will be zero and the path will be the path that you passed to the function.
     * @param {Pointer} Event A handle to an event for which you want to retrieve information.
     * @param {Integer} PropertyId A flag that identifies the information to retrieve. For example, the query identifier or the path. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_event_property_id">EVT_EVENT_PROPERTY_ID</a> enumeration.
     * @param {Integer} PropertyValueBufferSize The size of the <i>PropertyValueBuffer</i> buffer, in bytes.
     * @param {Pointer<EVT_VARIANT>} PropertyValueBuffer A caller-allocated buffer that will receive the information. The buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> object. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<UInt32>} PropertyValueBufferUsed The size, in bytes, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed. Use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winevt/nf-winevt-evtgeteventinfo
     * @since windows6.0.6000
     */
    static EvtGetEventInfo(Event, PropertyId, PropertyValueBufferSize, PropertyValueBuffer, PropertyValueBufferUsed) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtGetEventInfo", "ptr", Event, "int", PropertyId, "uint", PropertyValueBufferSize, "ptr", PropertyValueBuffer, "ptr", PropertyValueBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Clears the specified event log, and optionally saves the current copy of the log to a backup file. (ANSI)
     * @remarks
     * After this function returns, any handles that reference the cleared event log cannot be used to read the log.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines ClearEventLog as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HANDLE>} hEventLog A handle to the event log to be cleared. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> function returns this handle.
     * @param {Pointer<PSTR>} lpBackupFileName The absolute or relative path of the backup file. If this file already exists, the function fails. 
     * 
     * 
     * 
     * 
     * If the <i>lpBackupFileName</i> parameter is <b>NULL</b>, the event log is not backed up.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The 
     * <b>ClearEventLog</b> function can fail if the event log is empty or the backup file already exists.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-cleareventloga
     * @since windows5.0
     */
    static ClearEventLogA(hEventLog, lpBackupFileName) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ClearEventLogA", "ptr", hEventLog, "ptr", lpBackupFileName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Clears the specified event log, and optionally saves the current copy of the log to a backup file. (Unicode)
     * @remarks
     * After this function returns, any handles that reference the cleared event log cannot be used to read the log.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines ClearEventLog as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HANDLE>} hEventLog A handle to the event log to be cleared. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> function returns this handle.
     * @param {Pointer<PWSTR>} lpBackupFileName The absolute or relative path of the backup file. If this file already exists, the function fails. 
     * 
     * 
     * 
     * 
     * If the <i>lpBackupFileName</i> parameter is <b>NULL</b>, the event log is not backed up.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The 
     * <b>ClearEventLog</b> function can fail if the event log is empty or the backup file already exists.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-cleareventlogw
     * @since windows5.0
     */
    static ClearEventLogW(hEventLog, lpBackupFileName) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ClearEventLogW", "ptr", hEventLog, "ptr", lpBackupFileName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Saves the specified event log to a backup file. (ANSI)
     * @remarks
     * The <b>BackupEventLog</b> function fails with the ERROR_PRIVILEGE_NOT_HELD error if the user does not have the SE_BACKUP_NAME privilege.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines BackupEventLog as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HANDLE>} hEventLog A handle to the open event log. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> function returns this handle.
     * @param {Pointer<PSTR>} lpBackupFileName The absolute or relative path of the backup file.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-backupeventloga
     * @since windows5.0
     */
    static BackupEventLogA(hEventLog, lpBackupFileName) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\BackupEventLogA", "ptr", hEventLog, "ptr", lpBackupFileName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Saves the specified event log to a backup file. (Unicode)
     * @remarks
     * The <b>BackupEventLog</b> function fails with the ERROR_PRIVILEGE_NOT_HELD error if the user does not have the SE_BACKUP_NAME privilege.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines BackupEventLog as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HANDLE>} hEventLog A handle to the open event log. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> function returns this handle.
     * @param {Pointer<PWSTR>} lpBackupFileName The absolute or relative path of the backup file.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-backupeventlogw
     * @since windows5.0
     */
    static BackupEventLogW(hEventLog, lpBackupFileName) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\BackupEventLogW", "ptr", hEventLog, "ptr", lpBackupFileName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes the specified event log. (CloseEventLog)
     * @param {Pointer<HANDLE>} hEventLog A handle to the event log to be closed. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openbackupeventloga">OpenBackupEventLog</a> function returns this handle.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-closeeventlog
     * @since windows5.0
     */
    static CloseEventLog(hEventLog) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CloseEventLog", "ptr", hEventLog, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes the specified event log. (DeregisterEventSource)
     * @param {Pointer<HANDLE>} hEventLog A handle to the event log. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registereventsourcea">RegisterEventSource</a> function returns this handle.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-deregistereventsource
     * @since windows5.0
     */
    static DeregisterEventSource(hEventLog) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\DeregisterEventSource", "ptr", hEventLog, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables an application to receive notification when an event is written to the specified event log.
     * @remarks
     * The 
     * <b>NotifyChangeEventLog</b> function does not work with remote handles. If the <i>hEventLog</i> parameter is the handle to an event log on a remote computer, <b>NotifyChangeEventLog</b> returns zero, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INVALID_HANDLE</b>.
     * 
     * If the thread is not waiting on the event when the system calls <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-pulseevent">PulseEvent</a>, the thread will not receive the notification. Therefore, you should create a separate thread to wait for notifications.
     * 
     * The system will continue to notify you of changes until you close the handle to the event log. To close the event log, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-closeeventlog">CloseEventLog</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-deregistereventsource">DeregisterEventSource</a> function.
     * @param {Pointer<HANDLE>} hEventLog A handle to an event log. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a>  function returns this handle.
     * @param {Pointer<HANDLE>} hEvent A handle to a manual-reset or auto-reset event object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function to create the event object.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-notifychangeeventlog
     * @since windows5.0
     */
    static NotifyChangeEventLog(hEventLog, hEvent) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\NotifyChangeEventLog", "ptr", hEventLog, "ptr", hEvent, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the number of records in the specified event log.
     * @remarks
     * The oldest record in an event log is not necessarily record number 1. To determine the oldest record number in an event log, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getoldesteventlogrecord">GetOldestEventLogRecord</a> function.
     * @param {Pointer<HANDLE>} hEventLog A handle to the open event log. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openbackupeventloga">OpenBackupEventLog</a> function returns this handle.
     * @param {Pointer<UInt32>} NumberOfRecords A pointer to a variable that receives the number of records in the specified event log.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getnumberofeventlogrecords
     * @since windows5.0
     */
    static GetNumberOfEventLogRecords(hEventLog, NumberOfRecords) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetNumberOfEventLogRecords", "ptr", hEventLog, "ptr", NumberOfRecords, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the absolute record number of the oldest record in the specified event log.
     * @remarks
     * The oldest record in an event log is not necessarily record number 1. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/EventLog/event-log-records">Event Log Records</a>.
     * @param {Pointer<HANDLE>} hEventLog A handle to the open event log. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openbackupeventloga">OpenBackupEventLog</a> function returns this handle.
     * @param {Pointer<UInt32>} OldestRecord A pointer to a variable that receives the absolute record number of the oldest record in the specified event log.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getoldesteventlogrecord
     * @since windows5.0
     */
    static GetOldestEventLogRecord(hEventLog, OldestRecord) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetOldestEventLogRecord", "ptr", hEventLog, "ptr", OldestRecord, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a handle to the specified event log. (ANSI)
     * @remarks
     * To close the handle to the event log, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-closeeventlog">CloseEventLog</a> function.
     * @param {Pointer<PSTR>} lpUNCServerName The Universal Naming Convention (UNC) name of the remote server on which the event log is to be opened. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PSTR>} lpSourceName The name of the log. 
     * 
     * If you specify a custom log and it cannot be found, the event logging service opens the <b>Application</b> log; however, there will be no associated message or category string file.
     * @returns {Pointer<HANDLE>} If the function succeeds, the return value is the handle to an event log.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-openeventloga
     * @since windows5.0
     */
    static OpenEventLogA(lpUNCServerName, lpSourceName) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenEventLogA", "ptr", lpUNCServerName, "ptr", lpSourceName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a handle to the specified event log. (Unicode)
     * @remarks
     * To close the handle to the event log, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-closeeventlog">CloseEventLog</a> function.
     * @param {Pointer<PWSTR>} lpUNCServerName The Universal Naming Convention (UNC) name of the remote server on which the event log is to be opened. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} lpSourceName The name of the log. 
     * 
     * If you specify a custom log and it cannot be found, the event logging service opens the <b>Application</b> log; however, there will be no associated message or category string file.
     * @returns {Pointer<HANDLE>} If the function succeeds, the return value is the handle to an event log.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-openeventlogw
     * @since windows5.0
     */
    static OpenEventLogW(lpUNCServerName, lpSourceName) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenEventLogW", "ptr", lpUNCServerName, "ptr", lpSourceName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a registered handle to the specified event log. (ANSI)
     * @remarks
     * If the source name cannot be found, the event logging service uses the <b>Application</b> log. Although events will be reported , the events will not include descriptions because there are no message and category message files for looking up descriptions related to the event identifiers.
     * 
     * To close the handle to the event log, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-deregistereventsource">DeregisterEventSource</a> function.
     * @param {Pointer<PSTR>} lpUNCServerName The Universal Naming Convention (UNC) name of the remote server on which this operation is to be performed. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PSTR>} lpSourceName The name of the <a href="https://docs.microsoft.com/windows/desktop/EventLog/event-sources">event source</a> whose handle is to be retrieved. The source name must be a subkey of a log under the <b>Eventlog</b> registry key. 
     * 						Note that the <b>Security</b> log is for system use only.
     * 
     * <div class="alert"><b>Note</b>  This string must not contain characters prohibited in XML Attributes, with the exception of XML Escape sequences such as <b>&amp;lt  &amp;gl</b>.</div>
     * <div> </div>
     * @returns {Pointer<HANDLE>} If the function succeeds, the return value is a handle to the event log.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The function returns <b>ERROR_ACCESS_DENIED</b> if <i>lpSourceName</i> specifies the <b>Security</b> event log.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-registereventsourcea
     * @since windows5.0
     */
    static RegisterEventSourceA(lpUNCServerName, lpSourceName) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\RegisterEventSourceA", "ptr", lpUNCServerName, "ptr", lpSourceName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a registered handle to the specified event log. (Unicode)
     * @remarks
     * If the source name cannot be found, the event logging service uses the <b>Application</b> log. Although events will be reported , the events will not include descriptions because there are no message and category message files for looking up descriptions related to the event identifiers.
     * 
     * To close the handle to the event log, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-deregistereventsource">DeregisterEventSource</a> function.
     * @param {Pointer<PWSTR>} lpUNCServerName The Universal Naming Convention (UNC) name of the remote server on which this operation is to be performed. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} lpSourceName The name of the <a href="https://docs.microsoft.com/windows/desktop/EventLog/event-sources">event source</a> whose handle is to be retrieved. The source name must be a subkey of a log under the <b>Eventlog</b> registry key. 
     * 						Note that the <b>Security</b> log is for system use only.
     * 
     * <div class="alert"><b>Note</b>  This string must not contain characters prohibited in XML Attributes, with the exception of XML Escape sequences such as <b>&amp;lt;</b> or <b>&amp;gt;</b>.</div>
     * <div> </div>
     * @returns {Pointer<HANDLE>} If the function succeeds, the return value is a handle to the event log.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The function returns <b>ERROR_ACCESS_DENIED</b> if <i>lpSourceName</i> specifies the <b>Security</b> event log.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-registereventsourcew
     * @since windows5.0
     */
    static RegisterEventSourceW(lpUNCServerName, lpSourceName) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\RegisterEventSourceW", "ptr", lpUNCServerName, "ptr", lpSourceName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a handle to a backup event log created by the BackupEventLog function. (ANSI)
     * @remarks
     * If the backup filename specifies a remote server, the <i>lpUNCServerName</i> parameter must be <b>NULL</b>.
     * 
     * When this function is used on Windows Vista and later computers, only backup event logs that were saved with the <b>BackupEventLog</b> function on Windows Vista and later computers can be opened.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines OpenBackupEventLog as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpUNCServerName The Universal Naming Convention (UNC) name of the remote server on which this operation is to be performed. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PSTR>} lpFileName The full path of the backup file.
     * @returns {Pointer<HANDLE>} If the function succeeds, the return value is a handle to the backup event log.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-openbackupeventloga
     * @since windows5.0
     */
    static OpenBackupEventLogA(lpUNCServerName, lpFileName) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenBackupEventLogA", "ptr", lpUNCServerName, "ptr", lpFileName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a handle to a backup event log created by the BackupEventLog function. (Unicode)
     * @remarks
     * If the backup filename specifies a remote server, the <i>lpUNCServerName</i> parameter must be <b>NULL</b>.
     * 
     * When this function is used on Windows Vista and later computers, only backup event logs that were saved with the <b>BackupEventLog</b> function on Windows Vista and later computers can be opened.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines OpenBackupEventLog as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpUNCServerName The Universal Naming Convention (UNC) name of the remote server on which this operation is to be performed. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Pointer<PWSTR>} lpFileName The full path of the backup file.
     * @returns {Pointer<HANDLE>} If the function succeeds, the return value is a handle to the backup event log.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-openbackupeventlogw
     * @since windows5.0
     */
    static OpenBackupEventLogW(lpUNCServerName, lpFileName) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenBackupEventLogW", "ptr", lpUNCServerName, "ptr", lpFileName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads the specified number of entries from the specified event log. (ANSI)
     * @remarks
     * When this function returns successfully, the read position in the event  log is adjusted by the number of records read.
     * 
     * <div class="alert"><b>Note</b>  The configured file name for this source may also be the configured file name for other sources (several sources can exist as subkeys under a single log). Therefore, this function may return events that were logged by more than one source.</div>
     * <div> </div>
     * @param {Pointer<HANDLE>} hEventLog A handle to the event log to be read. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> function returns this handle.
     * @param {Integer} dwReadFlags 
     * @param {Integer} dwRecordOffset The record number of the log-entry at which the read operation should start. This parameter is ignored unless <i>dwReadFlags</i> includes the <b>EVENTLOG_SEEK_READ</b> flag.
     * @param {Pointer<Void>} lpBuffer An application-allocated buffer that will receive one or more <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-eventlogrecord">EVENTLOGRECORD</a> structures. This parameter cannot be <b>NULL</b>, even if the <i>nNumberOfBytesToRead</i> parameter is zero. 
     * 
     * 
     * 
     * 
     * The maximum size of this buffer is 0x7ffff bytes.
     * @param {Integer} nNumberOfBytesToRead The size of the <i>lpBuffer</i> buffer, in bytes. This function will read as many log entries as will fit in the buffer; the function will not return partial entries.
     * @param {Pointer<UInt32>} pnBytesRead A pointer to a variable that receives the number of bytes read by the function.
     * @param {Pointer<UInt32>} pnMinNumberOfBytesNeeded A pointer to a variable that receives the required size of the <i>lpBuffer</i> buffer. This value is valid only if this function returns zero and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-readeventloga
     * @since windows5.0
     */
    static ReadEventLogA(hEventLog, dwReadFlags, dwRecordOffset, lpBuffer, nNumberOfBytesToRead, pnBytesRead, pnMinNumberOfBytesNeeded) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ReadEventLogA", "ptr", hEventLog, "uint", dwReadFlags, "uint", dwRecordOffset, "ptr", lpBuffer, "uint", nNumberOfBytesToRead, "ptr", pnBytesRead, "ptr", pnMinNumberOfBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads the specified number of entries from the specified event log. (Unicode)
     * @remarks
     * When this function returns successfully, the read position in the event  log is adjusted by the number of records read.
     * 
     * <div class="alert"><b>Note</b>  The configured file name for this source may also be the configured file name for other sources (several sources can exist as subkeys under a single log). Therefore, this function may return events that were logged by more than one source.</div>
     * <div> </div>
     * @param {Pointer<HANDLE>} hEventLog A handle to the event log to be read. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> function returns this handle.
     * @param {Integer} dwReadFlags 
     * @param {Integer} dwRecordOffset The record number of the log-entry at which the read operation should start. This parameter is ignored unless <i>dwReadFlags</i> includes the <b>EVENTLOG_SEEK_READ</b> flag.
     * @param {Pointer<Void>} lpBuffer An application-allocated buffer that will receive one or more <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-eventlogrecord">EVENTLOGRECORD</a> structures. This parameter cannot be <b>NULL</b>, even if the <i>nNumberOfBytesToRead</i> parameter is zero. 
     * 
     * 
     * 
     * 
     * The maximum size of this buffer is 0x7ffff bytes.
     * @param {Integer} nNumberOfBytesToRead The size of the <i>lpBuffer</i> buffer, in bytes. This function will read as many log entries as will fit in the buffer; the function will not return partial entries.
     * @param {Pointer<UInt32>} pnBytesRead A pointer to a variable that receives the number of bytes read by the function.
     * @param {Pointer<UInt32>} pnMinNumberOfBytesNeeded A pointer to a variable that receives the required size of the <i>lpBuffer</i> buffer. This value is valid only this function returns zero and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-readeventlogw
     * @since windows5.0
     */
    static ReadEventLogW(hEventLog, dwReadFlags, dwRecordOffset, lpBuffer, nNumberOfBytesToRead, pnBytesRead, pnMinNumberOfBytesNeeded) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ReadEventLogW", "ptr", hEventLog, "uint", dwReadFlags, "uint", dwRecordOffset, "ptr", lpBuffer, "uint", nNumberOfBytesToRead, "ptr", pnBytesRead, "ptr", pnMinNumberOfBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes an entry at the end of the specified event log. (ANSI)
     * @remarks
     * This function is used to log an event. The entry is written to the end of the configured log for the source identified by the <i>hEventLog</i> parameter. The 
     * <b>ReportEvent</b> function adds the time, the entry's length, and the offsets before storing the entry in the log. To enable the function to add the user name, you must supply the user's SID in the <i>lpUserSid</i> parameter.
     * 
     * There are different size limits on the size of the message data that can be logged depending on the version of Windows used by both the client where the application is run and the server where the message is logged. The server is determined by the <i>lpUNCServerName</i> parameter passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registereventsourcea">RegisterEventSource</a> function. Different errors are returned when the size limit is exceeded that depend on the version of Windows.
     * 
     * If the string that you log contains %<i>n</i>, where <i>n</i> is an integer value (for example, %1), the event viewer treats it as an insertion string. Because an IPv6 address can contain this character sequence, you must provide a format specifier (<i>!S!</i>) to log an event message that contains an IPv6 address. This specifier tells the formatting code to use the string literally and not perform any further expansions (for example, "my IPv6 address is: %1!S!").
     * @param {Pointer<HANDLE>} hEventLog A handle to the event log. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registereventsourcea">RegisterEventSource</a> function returns this handle. 
     * 
     * As of Windows XP with SP2, this parameter cannot be a handle to the <b>Security</b> log. To write an event to the <b>Security</b> log, use the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzreportsecurityevent">AuthzReportSecurityEvent</a> function.
     * @param {Integer} wType 
     * @param {Integer} wCategory The event category. This is source-specific information; the category can have any value. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/EventLog/event-categories">Event Categories</a>.
     * @param {Integer} dwEventID The event identifier. The event identifier specifies the entry in the message file associated with the event source. For more information, see <a href="https://docs.microsoft.com/windows/desktop/EventLog/event-identifiers">Event Identifiers</a>.
     * @param {Pointer<PSID>} lpUserSid A pointer to the current user's security identifier. This parameter can be <b>NULL</b> if the security identifier is not required.
     * @param {Integer} wNumStrings The number of insert strings in the array pointed to by the <i>lpStrings</i> parameter. A value of zero indicates that no strings are present.
     * @param {Integer} dwDataSize The number of bytes of event-specific raw (binary) data to write to the log. If this parameter is zero, no event-specific data is present.
     * @param {Pointer<PSTR>} lpStrings A pointer to a buffer containing an array of null-terminated strings that are merged into the message before Event Viewer displays the string to the user. This parameter must be a valid pointer (or <b>NULL</b>), even if <i>wNumStrings</i> is zero. Each string is limited to 31,839  characters.
     * 
     * <b>Prior to Windows Vista:  </b>Each string is limited to 32K characters.
     * @param {Pointer<Void>} lpRawData A pointer to the buffer containing the binary data. This parameter must be a valid pointer (or <b>NULL</b>), even if the <i>dwDataSize</i> parameter is zero.
     * @returns {Integer} If the function succeeds, the return value is nonzero, indicating that the entry was written to the log.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, which returns one of the following extended error codes.
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
     * 
     * This error is returned on Windows Server 2003 if the  message data to be logged is too large. This error is returned by the RPC server on Windows Server 2003 if the <i>dwDataSize</i> parameter is larger than 261,991 (0x3ff67).
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
     * Insufficient memory resources are available to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array bounds are invalid. 
     * 
     * This error is returned if the  message data to be logged is too large. On Windows Vista and later, this error is returned if the <i>dwDataSize</i> parameter is larger than 61,440 (0xf000).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_BAD_STUB_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stub received bad data.
     * 
     * This error is returned on Windows XP if the  message data to be logged is too large. This error is returned by the RPC server on Windows XP, if the <i>dwDataSize</i> parameter is larger than 262,143 (0x3ffff).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-reporteventa
     * @since windows5.0
     */
    static ReportEventA(hEventLog, wType, wCategory, dwEventID, lpUserSid, wNumStrings, dwDataSize, lpStrings, lpRawData) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ReportEventA", "ptr", hEventLog, "ushort", wType, "ushort", wCategory, "uint", dwEventID, "ptr", lpUserSid, "ushort", wNumStrings, "uint", dwDataSize, "ptr", lpStrings, "ptr", lpRawData, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes an entry at the end of the specified event log. (Unicode)
     * @remarks
     * This function is used to log an event. The entry is written to the end of the configured log for the source identified by the <i>hEventLog</i> parameter. The 
     * <b>ReportEvent</b> function adds the time, the entry's length, and the offsets before storing the entry in the log. To enable the function to add the user name, you must supply the user's SID in the <i>lpUserSid</i> parameter.
     * 
     * There are different size limits on the size of the message data that can be logged depending on the version of Windows used by both the client where the application is run and the server where the message is logged. The server is determined by the <i>lpUNCServerName</i> parameter passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registereventsourcea">RegisterEventSource</a> function. Different errors are returned when the size limit is exceeded that depend on the version of Windows.
     * 
     * If the string that you log contains %<i>n</i>, where <i>n</i> is an integer value (for example, %1), the event viewer treats it as an insertion string. Because an IPv6 address can contain this character sequence, you must provide a format specifier (<i>!S!</i>) to log an event message that contains an IPv6 address. This specifier tells the formatting code to use the string literally and not perform any further expansions (for example, "my IPv6 address is: %1!S!").
     * @param {Pointer<HANDLE>} hEventLog A handle to the event log. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registereventsourcea">RegisterEventSource</a> function returns this handle. 
     * 
     * As of Windows XP with SP2, this parameter cannot be a handle to the <b>Security</b> log. To write an event to the <b>Security</b> log, use the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzreportsecurityevent">AuthzReportSecurityEvent</a> function.
     * @param {Integer} wType 
     * @param {Integer} wCategory The event category. This is source-specific information; the category can have any value. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/EventLog/event-categories">Event Categories</a>.
     * @param {Integer} dwEventID The event identifier. The event identifier specifies the entry in the message file associated with the event source. For more information, see <a href="https://docs.microsoft.com/windows/desktop/EventLog/event-identifiers">Event Identifiers</a>.
     * @param {Pointer<PSID>} lpUserSid A pointer to the current user's security identifier. This parameter can be <b>NULL</b> if the security identifier is not required.
     * @param {Integer} wNumStrings The number of insert strings in the array pointed to by the <i>lpStrings</i> parameter. A value of zero indicates that no strings are present.
     * @param {Integer} dwDataSize The number of bytes of event-specific raw (binary) data to write to the log. If this parameter is zero, no event-specific data is present.
     * @param {Pointer<PWSTR>} lpStrings A pointer to a buffer containing an array of null-terminated strings that are merged into the message before Event Viewer displays the string to the user. This parameter must be a valid pointer (or <b>NULL</b>), even if <i>wNumStrings</i> is zero. Each string is limited to 31,839  characters.
     * 
     * <b>Prior to Windows Vista:  </b>Each string is limited to 32K characters.
     * @param {Pointer<Void>} lpRawData A pointer to the buffer containing the binary data. This parameter must be a valid pointer (or <b>NULL</b>), even if the <i>dwDataSize</i> parameter is zero.
     * @returns {Integer} If the function succeeds, the return value is nonzero, indicating that the entry was written to the log.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, which returns one of the following extended error codes.
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
     * 
     * This error is returned on Windows Server 2003 if the  message data to be logged is too large. This error is returned by the RPC server on Windows Server 2003 if the <i>dwDataSize</i> parameter is larger than 261,991 (0x3ff67).
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
     * Insufficient memory resources are available to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array bounds are invalid. 
     * 
     * This error is returned if the  message data to be logged is too large. On Windows Vista and later, this error is returned if the <i>dwDataSize</i> parameter is larger than 61,440 (0xf000).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_BAD_STUB_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stub received bad data.
     * 
     * This error is returned on Windows XP if the  message data to be logged is too large. This error is returned by the RPC server on Windows XP, if the <i>dwDataSize</i> parameter is larger than 262,143 (0x3ffff).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-reporteventw
     * @since windows5.0
     */
    static ReportEventW(hEventLog, wType, wCategory, dwEventID, lpUserSid, wNumStrings, dwDataSize, lpStrings, lpRawData) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ReportEventW", "ptr", hEventLog, "ushort", wType, "ushort", wCategory, "uint", dwEventID, "ptr", lpUserSid, "ushort", wNumStrings, "uint", dwDataSize, "ptr", lpStrings, "ptr", lpRawData, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the specified event log.
     * @param {Pointer<HANDLE>} hEventLog A handle to the event log. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registereventsourcea">RegisterEventSource</a> function returns this handle.
     * @param {Integer} dwInfoLevel The level of event log information to return. 
     * 
     * This parameter can be the following value. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENTLOG_FULL_INFO"></a><a id="eventlog_full_info"></a><dl>
     * <dt><b>EVENTLOG_FULL_INFO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicate whether the specified log is full. The <i>lpBuffer</i> parameter will contain an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-eventlog_full_information">EVENTLOG_FULL_INFORMATION</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} lpBuffer An application-allocated buffer that receives the event log information. The format of this data depends on the value of the <i>dwInfoLevel</i> parameter.
     * @param {Integer} cbBufSize The size of the <i>lpBuffer</i> buffer, in bytes.
     * @param {Pointer<UInt32>} pcbBytesNeeded The function sets this parameter to the required buffer size for the requested information, regardless of whether the function succeeds. Use this value if the function fails with <b>ERROR_INSUFFICIENT_BUFFER</b> to allocate a buffer of the correct size.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-geteventloginformation
     * @since windows5.0
     */
    static GetEventLogInformation(hEventLog, dwInfoLevel, lpBuffer, cbBufSize, pcbBytesNeeded) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetEventLogInformation", "ptr", hEventLog, "uint", dwInfoLevel, "ptr", lpBuffer, "uint", cbBufSize, "ptr", pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}
