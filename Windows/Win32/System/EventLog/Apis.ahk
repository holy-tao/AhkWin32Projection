#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include .\EVT_HANDLE.ahk
#Include ..\..\Foundation\HANDLE.ahk

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
     * @param {Integer} LoginClass The connection method to use to connect to the remote computer. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_login_class">EVT_LOGIN_CLASS</a> enumeration.
     * @param {Pointer<Void>} Login A <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_rpc_login">EVT_RPC_LOGIN</a> structure that identifies the remote computer that you want to connect to, the user's credentials, and the type of authentication to use when connecting.
     * @returns {EVT_HANDLE} If successful, the function returns a session handle that you can use to access event log information on the remote computer; otherwise, <b>NULL</b>. If <b>NULL</b>, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtopensession
     * @since windows6.0.6000
     */
    static EvtOpenSession(LoginClass, Login) {
        static Timeout := 0, Flags := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtOpenSession", "int", LoginClass, "ptr", Login, "uint", Timeout, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return EVT_HANDLE({Value: result}, True)
    }

    /**
     * Closes an open handle.
     * @param {EVT_HANDLE} Object An open event handle to close.
     * @returns {BOOL} <table>
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
     * The function failed. To get the error code, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtclose
     * @since windows6.0.6000
     */
    static EvtClose(Object) {
        Object := Object is Win32Handle ? NumGet(Object, "ptr") : Object

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtClose", "ptr", Object, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Cancels all pending operations on a handle.
     * @param {EVT_HANDLE} Object The handle whose operation you want to cancel. You can cancel the following operations:
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
     * @returns {BOOL} <table>
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
     *         <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtcancel
     * @since windows6.0.6000
     */
    static EvtCancel(Object) {
        Object := Object is Win32Handle ? NumGet(Object, "ptr") : Object

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtCancel", "ptr", Object, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a text message that contains the extended error information for the current error.
     * @param {Integer} BufferSize The size of the <i>Buffer</i> buffer, in characters.
     * @param {PWSTR} Buffer A caller-allocated string buffer that will receive the extended error information. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<Integer>} BufferUsed The size, in characters, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {Integer} The return value is ERROR_SUCCESS if the call succeeded; otherwise, a Win32 error code.
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtgetextendedstatus
     * @since windows6.0.6000
     */
    static EvtGetExtendedStatus(BufferSize, Buffer, BufferUsed) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := DllCall("wevtapi.dll\EvtGetExtendedStatus", "uint", BufferSize, "ptr", Buffer, "uint*", BufferUsed, "uint")
        return result
    }

    /**
     * Runs a query to retrieve events from a channel or log file that match the specified query criteria.
     * @param {EVT_HANDLE} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> to query for events on the local computer.
     * @param {PWSTR} Path The name of the channel or the full path to a log file that contains the events that you want to query. You can specify an .evt, .evtx, or.etl log file. The path is required if the <i>Query</i> parameter contains an XPath query; the path is ignored if the <i>Query</i> parameter contains a structured XML query and the query specifies the path.
     * @param {PWSTR} Query A query that specifies the types of events that you want to retrieve. You can specify an XPath 1.0 query or structured XML query. If your XPath contains more than 20 expressions, use a structured XML query. To receive all events, set this parameter to <b>NULL</b> or "*".
     * @param {Integer} Flags One or more flags that specify the order that you want to receive the events and whether you are querying against a channel or log file.  For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_query_flags">EVT_QUERY_FLAGS</a> enumeration.
     * @returns {EVT_HANDLE} A handle to the query results if successful; otherwise, <b>NULL</b>. If the function returns <b>NULL</b>, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtquery
     * @since windows6.0.6000
     */
    static EvtQuery(Session, Path, Query, Flags) {
        Session := Session is Win32Handle ? NumGet(Session, "ptr") : Session
        Path := Path is String ? StrPtr(Path) : Path
        Query := Query is String ? StrPtr(Query) : Query

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtQuery", "ptr", Session, "ptr", Path, "ptr", Query, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return EVT_HANDLE({Value: result}, True)
    }

    /**
     * Gets the next event from the query or subscription results.
     * @param {EVT_HANDLE} ResultSet The handle to a query or subscription result set that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtquery">EvtQuery</a> function or the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsubscribe">EvtSubscribe</a> function returns.
     * @param {Integer} EventsSize The number of elements in the <i>EventArray</i> array. The function will try to retrieve this number of elements from the result set.
     * @param {Pointer<Pointer>} Events A pointer to an array of handles that will be set to the handles to the events from the result set.
     * @param {Integer} Timeout The number of milliseconds that you are willing to wait for a result.  Set to INFINITE to indicate no time-out value. If the time-out expires, the last error is set to ERROR_TIMEOUT.
     * @param {Integer} Flags Reserved. Must be zero.
     * @param {Pointer<Integer>} Returned The number of handles in the array that are set.
     * @returns {BOOL} <table>
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
     * The function failed. To get the error code, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtnext
     * @since windows6.0.6000
     */
    static EvtNext(ResultSet, EventsSize, Events, Timeout, Flags, Returned) {
        ResultSet := ResultSet is Win32Handle ? NumGet(ResultSet, "ptr") : ResultSet

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtNext", "ptr", ResultSet, "uint", EventsSize, "ptr*", Events, "uint", Timeout, "uint", Flags, "uint*", Returned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Seeks to a specific event in a query result set.
     * @param {EVT_HANDLE} ResultSet The handle to a query result set that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtquery">EvtQuery</a> function returns.
     * @param {Integer} Position The zero-based offset to an event in the result set. The flag that you specify in the <i>Flags</i> parameter indicates the beginning relative position in the result set from which to seek. For example, you can seek from the beginning of the results or from the end of the results. Set to 0 to move to the relative position specified by the flag.
     * @param {EVT_HANDLE} Bookmark A handle to a bookmark that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtcreatebookmark">EvtCreateBookmark</a> function returns. The bookmark identifies an event in the result set to which you want to seek. Set this parameter only if the  <i>Flags</i> parameter has the EvtSeekRelativeToBookmark  flag set.
     * @param {Integer} Flags One or more flags that indicate the relative position in the result set from which to seek. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_seek_flags">EVT_SEEK_FLAGS</a> enumeration.
     * @returns {BOOL} <table>
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
     * The function failed. To get the error code, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtseek
     * @since windows6.0.6000
     */
    static EvtSeek(ResultSet, Position, Bookmark, Flags) {
        static Timeout := 0 ;Reserved parameters must always be NULL

        ResultSet := ResultSet is Win32Handle ? NumGet(ResultSet, "ptr") : ResultSet
        Bookmark := Bookmark is Win32Handle ? NumGet(Bookmark, "ptr") : Bookmark

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtSeek", "ptr", ResultSet, "int64", Position, "ptr", Bookmark, "uint", Timeout, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a subscription that will receive current and future events from a channel or log file that match the specified query criteria.
     * @param {EVT_HANDLE} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> to subscribe to events on the local computer.
     * @param {HANDLE} SignalEvent The handle to an event object that the service will signal when new events are available that match your query criteria.  This parameter must be <b>NULL</b> if the <i>Callback</i> parameter is not <b>NULL</b>.
     * @param {PWSTR} ChannelPath The name of the Admin or Operational channel that contains the events that you want to subscribe to (you cannot subscribe to Analytic or Debug channels). The path is required if the <i>Query</i> parameter contains an XPath query; the path is ignored if the <i>Query</i> parameter contains a structured XML query.
     * @param {PWSTR} Query A query that specifies the types of events that you want the subscription service to return. You can specify an XPath 1.0 query or structured XML query. If your XPath contains more than 20 expressions, use a structured XML query. To receive all events, set this parameter to <b>NULL</b> or "*".
     * @param {EVT_HANDLE} Bookmark A handle to a bookmark that identifies the starting point for the subscription.  To get a bookmark handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtcreatebookmark">EvtCreateBookmark</a> function.  You must set this parameter if the <i>Flags</i> parameter contains the EvtSubscribeStartAfterBookmark flag; otherwise, <b>NULL</b>.
     * @param {Pointer<Void>} Context A caller-defined context value that the subscription service will pass to the specified callback each time it delivers an event.
     * @param {Pointer<EVT_SUBSCRIBE_CALLBACK>} Callback Pointer to your <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nc-winevt-evt_subscribe_callback">EVT_SUBSCRIBE_CALLBACK</a> callback function that will receive the subscription events. This parameter must be <b>NULL</b> if the <i>SignalEvent</i> parameter is not <b>NULL</b>.
     * @param {Integer} Flags One or more flags that specify when to start subscribing to events. For example, if you specify EvtSubscribeStartAtOldestRecord, the service will retrieve all current and future events that match your query criteria; however, if you specify EvtSubscribeToFutureEvents, the service returns only future events that match your query criteria. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_subscribe_flags">EVT_SUBSCRIBE_FLAGS</a> enumeration.
     * @returns {EVT_HANDLE} A handle to the subscription if successful; otherwise, <b>NULL</b>. If the function returns <b>NULL</b>, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code. You must call the <a href="/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function with the subscription handle when done.
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtsubscribe
     * @since windows6.0.6000
     */
    static EvtSubscribe(Session, SignalEvent, ChannelPath, Query, Bookmark, Context, Callback, Flags) {
        Session := Session is Win32Handle ? NumGet(Session, "ptr") : Session
        SignalEvent := SignalEvent is Win32Handle ? NumGet(SignalEvent, "ptr") : SignalEvent
        ChannelPath := ChannelPath is String ? StrPtr(ChannelPath) : ChannelPath
        Query := Query is String ? StrPtr(Query) : Query
        Bookmark := Bookmark is Win32Handle ? NumGet(Bookmark, "ptr") : Bookmark

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtSubscribe", "ptr", Session, "ptr", SignalEvent, "ptr", ChannelPath, "ptr", Query, "ptr", Bookmark, "ptr", Context, "ptr", Callback, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return EVT_HANDLE({Value: result}, True)
    }

    /**
     * Creates a context that specifies the information in the event that you want to render.
     * @param {Integer} ValuePathsCount The number of XPath expressions in the <i>ValuePaths</i> parameter.
     * @param {Pointer<PWSTR>} ValuePaths An array of XPath expressions that uniquely identify a node or attribute in the event that you want to render.
     * 
     * Set to **NULL** if the **EvtRenderContextValues** context flag is not set in the *Flags* parameter.
     * 
     * The expressions must not contain the **OR** or **AND** operator. 
     * 
     * Attribute names in the expressions must not be followed by a space.
     * @param {Integer} Flags One or more flags that identify the information in the event that you want to render. For example, the system information, user information, or specific values. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_render_context_flags">EVT_RENDER_CONTEXT_FLAGS</a> enumeration.
     * @returns {EVT_HANDLE} A context handle that you use when calling the <a href="/windows/desktop/api/winevt/nf-winevt-evtrender">EvtRender</a> function to render the contents of an event; otherwise, <b>NULL</b>. If <b>NULL</b>, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtcreaterendercontext
     * @since windows6.0.6000
     */
    static EvtCreateRenderContext(ValuePathsCount, ValuePaths, Flags) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtCreateRenderContext", "uint", ValuePathsCount, "ptr", ValuePaths, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return EVT_HANDLE({Value: result}, True)
    }

    /**
     * Renders an XML fragment based on the rendering context that you specify.
     * @param {EVT_HANDLE} Context A handle to the rendering context that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtcreaterendercontext">EvtCreateRenderContext</a> function returns. This parameter must be set to <b>NULL</b> if the <i>Flags</i> parameter is set to EvtRenderEventXml or EvtRenderBookmark.
     * @param {EVT_HANDLE} Fragment A handle to an event or to a bookmark. Set this parameter to a bookmark handle if the <i>Flags</i> parameter is set to EvtRenderBookmark; otherwise, set to an event handle.
     * @param {Integer} Flags A flag that identifies what to render. For example, the entire event or specific properties of the event. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_render_flags">EVT_RENDER_FLAGS</a> enumeration.
     * @param {Integer} BufferSize The size of the <i>Buffer</i> buffer, in bytes.
     * @param {Pointer} Buffer A caller-allocated buffer that will receive the rendered output. The contents is a <b>null</b>-terminated Unicode string if the <i>Flags</i> parameter is set to EvtRenderEventXml or EvtRenderBookmark. Otherwise, if <i>Flags</i> is set to EvtRenderEventValues, the buffer contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> structures; one for each property specified by the rendering context. The <i>PropertyCount</i> parameter contains the number of elements in the array.
     * 
     *  You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<Integer>} BufferUsed The size, in bytes, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @param {Pointer<Integer>} PropertyCount The number of the properties in the <i>Buffer</i> parameter if the <i>Flags</i> parameter is set to EvtRenderEventValues; otherwise, zero.
     * @returns {BOOL} <table>
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
     * The function failed. Call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtrender
     * @since windows6.0.6000
     */
    static EvtRender(Context, Fragment, Flags, BufferSize, Buffer, BufferUsed, PropertyCount) {
        Context := Context is Win32Handle ? NumGet(Context, "ptr") : Context
        Fragment := Fragment is Win32Handle ? NumGet(Fragment, "ptr") : Fragment

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtRender", "ptr", Context, "ptr", Fragment, "uint", Flags, "uint", BufferSize, "ptr", Buffer, "uint*", BufferUsed, "uint*", PropertyCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Formats a message string.
     * @param {EVT_HANDLE} PublisherMetadata A handle to the provider's metadata that the  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenpublishermetadata">EvtOpenPublisherMetadata</a> function returns. The handle acts as a formatting context for the event or message identifier. 
     * 
     * You can set this parameter to <b>NULL</b> if the Windows Event Collector service forwarded the event. Forwarded events include a <b>RenderingInfo</b> section that contains the rendered message strings. You can also set this parameter to <b>NULL</b> if the event property that you are formatting is defined in the Winmeta.xml file (for example, if level is set to win:Error). In the latter case, the service uses the Winmeta provider as the formatting context and will format only those message strings that you reference in your event that are defined in the Winmeta.xml file.
     * @param {EVT_HANDLE} Event A handle to an event. The <i>Flags</i> parameter specifies the message string in the event that you want to format. This parameter must be <b>NULL</b> if the <i>Flags</i> parameter is set to <b>EvtFormatMessageId</b>.
     * @param {Integer} MessageId The resource identifier of the message string that you want to format. To get the resource identifier for a message string, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetpublishermetadataproperty">GetPublisherMetadataProperty</a> function. Set this parameter only if the <i>Flags</i> parameter is set to <b>EvtFormatMessageId</b>.
     * @param {Integer} ValueCount The number of values in the <i>Values</i> parameter.
     * @param {Pointer<EVT_VARIANT>} Values An array of insertion values to use when formatting the event's message string. Typically, you set this parameter to <b>NULL</b> and the function gets the insertion values from the event data itself. You would use this parameter to override the default behavior and supply the insertion values to use. For example, you might use this parameter if you wanted to resolve a SID to a principal name before inserting the value. 
     * 
     * To override the insertion values, the <i>Flags</i> parameter must be set to <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_format_message_flags">EvtFormatMessageEvent</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_format_message_flags">EvtFormatMessageXML</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_format_message_flags">EvtFormatMessageId</a>. If <i>Flags</i> is set to <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_format_message_flags">EvtFormatMessageId</a>, the resource identifier must identify the event's message string.
     * @param {Integer} Flags A flag that specifies the message string in the event to format. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_format_message_flags">EVT_FORMAT_MESSAGE_FLAGS</a> enumeration.
     * @param {Integer} BufferSize The size of the <i>Buffer</i> buffer, in characters.
     * @param {PWSTR} Buffer A caller-allocated buffer that will receive the formatted message string. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<Integer>} BufferUsed The size, in characters of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {BOOL} <table>
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
     * The function failed. Call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtformatmessage
     * @since windows6.0.6000
     */
    static EvtFormatMessage(PublisherMetadata, Event, MessageId, ValueCount, Values, Flags, BufferSize, Buffer, BufferUsed) {
        PublisherMetadata := PublisherMetadata is Win32Handle ? NumGet(PublisherMetadata, "ptr") : PublisherMetadata
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtFormatMessage", "ptr", PublisherMetadata, "ptr", Event, "uint", MessageId, "uint", ValueCount, "ptr", Values, "uint", Flags, "uint", BufferSize, "ptr", Buffer, "uint*", BufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a handle to a channel or log file that you can then use to get information about the channel or log file.
     * @param {EVT_HANDLE} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> to open a channel or log on the local computer.
     * @param {PWSTR} Path The name of the channel or the full path to the exported log file.
     * @param {Integer} Flags A flag that determines whether the <i>Path</i> parameter points to a log file or channel. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_open_log_flags">EVT_OPEN_LOG_FLAGS</a> enumeration.
     * @returns {EVT_HANDLE} If successful, the function returns a handle to the file or channel; otherwise, <b>NULL</b>. If <b>NULL</b>, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtopenlog
     * @since windows6.0.6000
     */
    static EvtOpenLog(Session, Path, Flags) {
        Session := Session is Win32Handle ? NumGet(Session, "ptr") : Session
        Path := Path is String ? StrPtr(Path) : Path

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtOpenLog", "ptr", Session, "ptr", Path, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return EVT_HANDLE({Value: result}, True)
    }

    /**
     * Gets information about a channel or log file.
     * @param {EVT_HANDLE} Log A handle to the channel or log file that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenlog">EvtOpenLog</a> function returns.
     * @param {Integer} PropertyId The identifier of the property to retrieve. For a list of property identifiers, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_log_property_id">EVT_LOG_PROPERTY_ID</a> enumeration.
     * @param {Integer} PropertyValueBufferSize The size of the <i>PropertyValueBuffer</i> buffer, in bytes.
     * @param {Pointer} PropertyValueBuffer A caller-allocated buffer that will receive the property value. The buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> object. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<Integer>} PropertyValueBufferUsed The size, in bytes, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {BOOL} <table>
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
     * The function failed. To get the error code, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtgetloginfo
     * @since windows6.0.6000
     */
    static EvtGetLogInfo(Log, PropertyId, PropertyValueBufferSize, PropertyValueBuffer, PropertyValueBufferUsed) {
        Log := Log is Win32Handle ? NumGet(Log, "ptr") : Log

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtGetLogInfo", "ptr", Log, "int", PropertyId, "uint", PropertyValueBufferSize, "ptr", PropertyValueBuffer, "uint*", PropertyValueBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes all events from the specified channel and writes them to the target log file.
     * @param {EVT_HANDLE} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> for local channels.
     * @param {PWSTR} ChannelPath The name of the channel to clear.
     * @param {PWSTR} TargetFilePath The full path to the target log file that will receive the events. Set to <b>NULL</b> to clear the log file and not save the events.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {BOOL} <table>
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
     * The function failed. Use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtclearlog
     * @since windows6.0.6000
     */
    static EvtClearLog(Session, ChannelPath, TargetFilePath, Flags) {
        Session := Session is Win32Handle ? NumGet(Session, "ptr") : Session
        ChannelPath := ChannelPath is String ? StrPtr(ChannelPath) : ChannelPath
        TargetFilePath := TargetFilePath is String ? StrPtr(TargetFilePath) : TargetFilePath

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtClearLog", "ptr", Session, "ptr", ChannelPath, "ptr", TargetFilePath, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies events from the specified channel or log file and writes them to the target log file.
     * @param {EVT_HANDLE} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> for local channels.
     * @param {PWSTR} Path The name of the channel or the full path to a log file that contains the events that you want to export. If the <i>Query</i> parameter contains an XPath query, you must specify the channel or log file. If the <i>Flags</i> parameter contains EvtExportLogFilePath, you must specify the log file. If the <i>Query</i> parameter contains a structured XML query, the channel or path that you specify here must match the channel or path in the query. If the <i>Flags</i> parameter contains EvtExportLogChannelPath, this parameter can be <b>NULL</b> if  the query is a structured XML query that specifies the channel.
     * @param {PWSTR} Query A query that specifies the types of events that you want to export. You can specify an XPath 1.0 query or structured XML query. If your XPath contains more than 20 expressions, use a structured XML query. To export all events, set this parameter to <b>NULL</b> or "*".
     * @param {PWSTR} TargetFilePath The full path to the target log file that will receive the events. The target log file must not exist.
     * @param {Integer} Flags Flags that indicate whether the events come from a channel or log file. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_exportlog_flags">EVT_EXPORTLOG_FLAGS</a> enumeration.
     * @returns {BOOL} <table>
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
     * The function failed. Use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtexportlog
     * @since windows6.0.6000
     */
    static EvtExportLog(Session, Path, Query, TargetFilePath, Flags) {
        Session := Session is Win32Handle ? NumGet(Session, "ptr") : Session
        Path := Path is String ? StrPtr(Path) : Path
        Query := Query is String ? StrPtr(Query) : Query
        TargetFilePath := TargetFilePath is String ? StrPtr(TargetFilePath) : TargetFilePath

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtExportLog", "ptr", Session, "ptr", Path, "ptr", Query, "ptr", TargetFilePath, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds localized strings to the events in the specified log file.
     * @param {EVT_HANDLE} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> for local channels.
     * @param {PWSTR} LogFilePath The full path to the exported log file that contains the events to localize.
     * @param {Integer} Locale The locale to use to localize the strings that the service adds to the events in the log file. If zero, the function uses the calling thread's locale. If the provider's resources does not contain the locale, the string is empty.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {BOOL} <table>
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
     * The function failed. Use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtarchiveexportedlog
     * @since windows6.0.6000
     */
    static EvtArchiveExportedLog(Session, LogFilePath, Locale, Flags) {
        Session := Session is Win32Handle ? NumGet(Session, "ptr") : Session
        LogFilePath := LogFilePath is String ? StrPtr(LogFilePath) : LogFilePath

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtArchiveExportedLog", "ptr", Session, "ptr", LogFilePath, "uint", Locale, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a handle that you use to enumerate the list of channels that are registered on the computer.
     * @param {EVT_HANDLE} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> to enumerate the channels on the local computer.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {EVT_HANDLE} If successful, the function returns a handle to the list of channel names that are registered on the computer; otherwise, <b>NULL</b>. If <b>NULL</b>, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtopenchannelenum
     * @since windows6.0.6000
     */
    static EvtOpenChannelEnum(Session, Flags) {
        Session := Session is Win32Handle ? NumGet(Session, "ptr") : Session

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtOpenChannelEnum", "ptr", Session, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return EVT_HANDLE({Value: result}, True)
    }

    /**
     * Gets a channel name from the enumerator.
     * @param {EVT_HANDLE} ChannelEnum A handle to the enumerator that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenchannelenum">EvtOpenChannelEnum</a> function returns.
     * @param {Integer} ChannelPathBufferSize The size of the <i>ChannelPathBuffer</i> buffer, in characters.
     * @param {PWSTR} ChannelPathBuffer A caller-allocated buffer that will receive the name of the channel. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<Integer>} ChannelPathBufferUsed The size, in characters, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {BOOL} <table>
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
     * The function failed. To get the error code, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtnextchannelpath
     * @since windows6.0.6000
     */
    static EvtNextChannelPath(ChannelEnum, ChannelPathBufferSize, ChannelPathBuffer, ChannelPathBufferUsed) {
        ChannelEnum := ChannelEnum is Win32Handle ? NumGet(ChannelEnum, "ptr") : ChannelEnum
        ChannelPathBuffer := ChannelPathBuffer is String ? StrPtr(ChannelPathBuffer) : ChannelPathBuffer

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtNextChannelPath", "ptr", ChannelEnum, "uint", ChannelPathBufferSize, "ptr", ChannelPathBuffer, "uint*", ChannelPathBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a handle that you use to read or modify a channel's configuration property.
     * @param {EVT_HANDLE} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> to access a channel on the local computer.
     * @param {PWSTR} ChannelPath The name of the channel to access.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {EVT_HANDLE} If successful, the function returns a handle to the channel's configuration; otherwise, <b>NULL</b>. If <b>NULL</b>, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtopenchannelconfig
     * @since windows6.0.6000
     */
    static EvtOpenChannelConfig(Session, ChannelPath, Flags) {
        Session := Session is Win32Handle ? NumGet(Session, "ptr") : Session
        ChannelPath := ChannelPath is String ? StrPtr(ChannelPath) : ChannelPath

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtOpenChannelConfig", "ptr", Session, "ptr", ChannelPath, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return EVT_HANDLE({Value: result}, True)
    }

    /**
     * Saves the changes made to a channel's configuration.
     * @param {EVT_HANDLE} ChannelConfig A handle to the channel's configuration properties that the  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenchannelconfig">EvtOpenChannelConfig</a> function returns.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {BOOL} <table>
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
     * The function failed. To get the error code, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtsavechannelconfig
     * @since windows6.0.6000
     */
    static EvtSaveChannelConfig(ChannelConfig, Flags) {
        ChannelConfig := ChannelConfig is Win32Handle ? NumGet(ChannelConfig, "ptr") : ChannelConfig

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtSaveChannelConfig", "ptr", ChannelConfig, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the specified configuration property of a channel.
     * @param {EVT_HANDLE} ChannelConfig A handle to the channel's configuration properties that the  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenchannelconfig">EvtOpenChannelConfig</a> function returns.
     * @param {Integer} PropertyId The identifier of the channel property to set. For a list of property identifiers, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_channel_config_property_id">EVT_CHANNEL_CONFIG_PROPERTY_ID</a> enumeration.
     * @param {Integer} Flags Reserved. Must be zero.
     * @param {Pointer<EVT_VARIANT>} PropertyValue The property value to set.
     * 
     * A caller-allocated buffer that contains the new configuration property value. The buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> object. Be sure to set the configuration value and variant type.
     * @returns {BOOL} <table>
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
     * The function failed. To get the error code, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtsetchannelconfigproperty
     * @since windows6.0.6000
     */
    static EvtSetChannelConfigProperty(ChannelConfig, PropertyId, Flags, PropertyValue) {
        ChannelConfig := ChannelConfig is Win32Handle ? NumGet(ChannelConfig, "ptr") : ChannelConfig

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtSetChannelConfigProperty", "ptr", ChannelConfig, "int", PropertyId, "uint", Flags, "ptr", PropertyValue, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the specified channel configuration property.
     * @param {EVT_HANDLE} ChannelConfig A handle to the channel's configuration properties that the  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenchannelconfig">EvtOpenChannelConfig</a> function returns.
     * @param {Integer} PropertyId The identifier of the channel property to retrieve. For a list of property identifiers, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_channel_config_property_id">EVT_CHANNEL_CONFIG_PROPERTY_ID</a> enumeration.
     * @param {Integer} Flags Reserved. Must be zero.
     * @param {Integer} PropertyValueBufferSize The size of the <i>PropertyValueBuffer</i> buffer, in bytes.
     * @param {Pointer} PropertyValueBuffer A caller-allocated buffer that will receive the configuration property. The buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> object. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<Integer>} PropertyValueBufferUsed The size, in bytes, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {BOOL} <table>
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
     * The function failed. To get the error code, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtgetchannelconfigproperty
     * @since windows6.0.6000
     */
    static EvtGetChannelConfigProperty(ChannelConfig, PropertyId, Flags, PropertyValueBufferSize, PropertyValueBuffer, PropertyValueBufferUsed) {
        ChannelConfig := ChannelConfig is Win32Handle ? NumGet(ChannelConfig, "ptr") : ChannelConfig

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtGetChannelConfigProperty", "ptr", ChannelConfig, "int", PropertyId, "uint", Flags, "uint", PropertyValueBufferSize, "ptr", PropertyValueBuffer, "uint*", PropertyValueBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a handle that you use to enumerate the list of registered providers on the computer.
     * @param {EVT_HANDLE} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> to enumerate the registered providers on the local computer.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {EVT_HANDLE} If successful, the function returns a handle to the list of registered providers; otherwise, <b>NULL</b>. If <b>NULL</b>, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtopenpublisherenum
     * @since windows6.0.6000
     */
    static EvtOpenPublisherEnum(Session, Flags) {
        Session := Session is Win32Handle ? NumGet(Session, "ptr") : Session

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtOpenPublisherEnum", "ptr", Session, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return EVT_HANDLE({Value: result}, True)
    }

    /**
     * Gets the identifier of a provider from the enumerator.
     * @param {EVT_HANDLE} PublisherEnum A handle to the registered providers enumerator that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenpublisherenum">EvtOpenPublisherEnum</a> function returns.
     * @param {Integer} PublisherIdBufferSize The size of the <i>PublisherIdBuffer</i> buffer, in characters.
     * @param {PWSTR} PublisherIdBuffer A caller-allocated buffer that will receive the name of the registered provider. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<Integer>} PublisherIdBufferUsed The size, in characters, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {BOOL} <table>
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
     * The function failed. To get the error code, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtnextpublisherid
     * @since windows6.0.6000
     */
    static EvtNextPublisherId(PublisherEnum, PublisherIdBufferSize, PublisherIdBuffer, PublisherIdBufferUsed) {
        PublisherEnum := PublisherEnum is Win32Handle ? NumGet(PublisherEnum, "ptr") : PublisherEnum
        PublisherIdBuffer := PublisherIdBuffer is String ? StrPtr(PublisherIdBuffer) : PublisherIdBuffer

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtNextPublisherId", "ptr", PublisherEnum, "uint", PublisherIdBufferSize, "ptr", PublisherIdBuffer, "uint*", PublisherIdBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a handle that you use to read the specified provider's metadata.
     * @param {EVT_HANDLE} Session A remote session handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a> function returns. Set to <b>NULL</b> to get the metadata for a provider on the local computer.
     * @param {PWSTR} PublisherId The name of the provider. To enumerate the names of the providers registered on the computer, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenpublisherenum">EvtOpenPublisherEnum</a> function.
     * @param {PWSTR} LogFilePath The full path to an archived log file that contains the events that the provider logged. An archived log file also contains the provider's metadata. Use this parameter when the provider is not registered on the local computer. Set to <b>NULL</b> when reading the metadata from a registered provider..
     * @param {Integer} Locale The locale identifier to use when accessing the localized metadata from the provider. To create the locale identifier, use the MAKELCID macro. Set to 0 to use the locale identifier of the calling thread.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {EVT_HANDLE} If successful, the function returns a handle to the provider's metadata; otherwise, <b>NULL</b>. If <b>NULL</b>, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtopenpublishermetadata
     * @since windows6.0.6000
     */
    static EvtOpenPublisherMetadata(Session, PublisherId, LogFilePath, Locale, Flags) {
        Session := Session is Win32Handle ? NumGet(Session, "ptr") : Session
        PublisherId := PublisherId is String ? StrPtr(PublisherId) : PublisherId
        LogFilePath := LogFilePath is String ? StrPtr(LogFilePath) : LogFilePath

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtOpenPublisherMetadata", "ptr", Session, "ptr", PublisherId, "ptr", LogFilePath, "uint", Locale, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return EVT_HANDLE({Value: result}, True)
    }

    /**
     * Gets the specified provider metadata property.
     * @param {EVT_HANDLE} PublisherMetadata A handle to the metadata that the  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenpublishermetadata">EvtOpenPublisherMetadata</a> function returns.
     * @param {Integer} PropertyId The identifier of the metadata property to retrieve. For a list of property identifiers, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_publisher_metadata_property_id">EVT_PUBLISHER_METADATA_PROPERTY_ID</a> enumeration.
     * @param {Integer} Flags Reserved. Must be zero.
     * @param {Integer} PublisherMetadataPropertyBufferSize The size of the <i>PublisherMetadataPropertyBuffer</i> buffer, in bytes.
     * @param {Pointer} PublisherMetadataPropertyBuffer A caller-allocated buffer that will receive the metadata property. The buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> object. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<Integer>} PublisherMetadataPropertyBufferUsed The size, in bytes, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {BOOL} <table>
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
     * The function failed. To get the error code, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtgetpublishermetadataproperty
     * @since windows6.0.6000
     */
    static EvtGetPublisherMetadataProperty(PublisherMetadata, PropertyId, Flags, PublisherMetadataPropertyBufferSize, PublisherMetadataPropertyBuffer, PublisherMetadataPropertyBufferUsed) {
        PublisherMetadata := PublisherMetadata is Win32Handle ? NumGet(PublisherMetadata, "ptr") : PublisherMetadata

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtGetPublisherMetadataProperty", "ptr", PublisherMetadata, "int", PropertyId, "uint", Flags, "uint", PublisherMetadataPropertyBufferSize, "ptr", PublisherMetadataPropertyBuffer, "uint*", PublisherMetadataPropertyBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a handle that you use to enumerate the list of events that the provider defines.
     * @param {EVT_HANDLE} PublisherMetadata A handle to the provider's metadata that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopenpublishermetadata">EvtOpenPublisherMetadata</a> function returns.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {EVT_HANDLE} If successful, the function returns a handle to the list of events that the  provider defines; otherwise, <b>NULL</b>. If <b>NULL</b>, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtopeneventmetadataenum
     * @since windows6.0.6000
     */
    static EvtOpenEventMetadataEnum(PublisherMetadata, Flags) {
        PublisherMetadata := PublisherMetadata is Win32Handle ? NumGet(PublisherMetadata, "ptr") : PublisherMetadata

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtOpenEventMetadataEnum", "ptr", PublisherMetadata, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return EVT_HANDLE({Value: result}, True)
    }

    /**
     * Gets an event definition from the enumerator.
     * @param {EVT_HANDLE} EventMetadataEnum A handle to the event definition enumerator that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopeneventmetadataenum">EvtOpenEventMetadataEnum</a> function returns.
     * @param {Integer} Flags Reserved. Must be zero.
     * @returns {EVT_HANDLE} If successful, the function returns a handle to the event's metadata; otherwise, <b>NULL</b>. If <b>NULL</b>, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtnexteventmetadata
     * @since windows6.0.6000
     */
    static EvtNextEventMetadata(EventMetadataEnum, Flags) {
        EventMetadataEnum := EventMetadataEnum is Win32Handle ? NumGet(EventMetadataEnum, "ptr") : EventMetadataEnum

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtNextEventMetadata", "ptr", EventMetadataEnum, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return EVT_HANDLE({Value: result}, True)
    }

    /**
     * Gets the specified event metadata property.
     * @param {EVT_HANDLE} EventMetadata A handle to the event metadata that the  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtnexteventmetadata">EvtNextEventMetadata</a> function returns.
     * @param {Integer} PropertyId The identifier of the metadata property to retrieve. For a list of property identifiers, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_event_metadata_property_id">EVT_EVENT_METADATA_PROPERTY_ID</a> enumeration.
     * @param {Integer} Flags Reserved. Must be zero.
     * @param {Integer} EventMetadataPropertyBufferSize The size of the <i>EventMetadataPropertyBuffer</i> buffer, in bytes.
     * @param {Pointer} EventMetadataPropertyBuffer A caller-allocated buffer that will receive the metadata property. The buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> object. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<Integer>} EventMetadataPropertyBufferUsed The size, in bytes, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {BOOL} <table>
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
     * The function failed. To get the error code, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtgeteventmetadataproperty
     * @since windows6.0.6000
     */
    static EvtGetEventMetadataProperty(EventMetadata, PropertyId, Flags, EventMetadataPropertyBufferSize, EventMetadataPropertyBuffer, EventMetadataPropertyBufferUsed) {
        EventMetadata := EventMetadata is Win32Handle ? NumGet(EventMetadata, "ptr") : EventMetadata

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtGetEventMetadataProperty", "ptr", EventMetadata, "int", PropertyId, "uint", Flags, "uint", EventMetadataPropertyBufferSize, "ptr", EventMetadataPropertyBuffer, "uint*", EventMetadataPropertyBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the number of elements in the array of objects.
     * @param {Pointer} ObjectArray A handle to an array of objects that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetpublishermetadataproperty">EvtGetPublisherMetadataProperty</a> function returns.
     * @param {Pointer<Integer>} ObjectArraySize The number of elements in the array.
     * @returns {BOOL} <table>
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
     * The function failed. To get the error code, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtgetobjectarraysize
     * @since windows6.0.6000
     */
    static EvtGetObjectArraySize(ObjectArray, ObjectArraySize) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtGetObjectArraySize", "ptr", ObjectArray, "uint*", ObjectArraySize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a provider metadata property from the specified object in the array.
     * @param {Pointer} ObjectArray A handle to an array of objects that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetpublishermetadataproperty">EvtGetPublisherMetadataProperty</a> function returns.
     * @param {Integer} PropertyId The property identifier of the metadata property that you want to get from the  specified object. For possible values, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_publisher_metadata_property_id">EVT_PUBLISHER_METADATA_PROPERTY_ID</a>.
     * @param {Integer} ArrayIndex The zero-based index of the object in the array.
     * @param {Integer} Flags Reserved. Must be zero.
     * @param {Integer} PropertyValueBufferSize The size of the <i>PropertyValueBuffer</i> buffer, in bytes.
     * @param {Pointer} PropertyValueBuffer A caller-allocated buffer that will receive the metadata property. The buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> object. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<Integer>} PropertyValueBufferUsed The size, in bytes, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {BOOL} <table>
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
     * The function failed. To get the error code, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtgetobjectarrayproperty
     * @since windows6.0.6000
     */
    static EvtGetObjectArrayProperty(ObjectArray, PropertyId, ArrayIndex, Flags, PropertyValueBufferSize, PropertyValueBuffer, PropertyValueBufferUsed) {
        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtGetObjectArrayProperty", "ptr", ObjectArray, "uint", PropertyId, "uint", ArrayIndex, "uint", Flags, "uint", PropertyValueBufferSize, "ptr", PropertyValueBuffer, "uint*", PropertyValueBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets information about a query that you ran that identifies the list of channels or log files that the query attempted to access. The function also gets a list of return codes that indicates the success or failure of each access.
     * @param {EVT_HANDLE} QueryOrSubscription A handle to the query that the<a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtquery">EvtQuery</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsubscribe">EvtSubscribe</a> function returns.
     * @param {Integer} PropertyId The identifier of the query information to retrieve. For a list of identifiers, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_query_property_id">EVT_QUERY_PROPERTY_ID</a> enumeration.
     * @param {Integer} PropertyValueBufferSize The size of the <i>PropertyValueBuffer</i> buffer, in bytes.
     * @param {Pointer} PropertyValueBuffer A caller-allocated buffer that will receive the query information. The buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> object. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<Integer>} PropertyValueBufferUsed The size, in bytes, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {BOOL} <table>
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
     * The function failed. To get the error code, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtgetqueryinfo
     * @since windows6.0.6000
     */
    static EvtGetQueryInfo(QueryOrSubscription, PropertyId, PropertyValueBufferSize, PropertyValueBuffer, PropertyValueBufferUsed) {
        QueryOrSubscription := QueryOrSubscription is Win32Handle ? NumGet(QueryOrSubscription, "ptr") : QueryOrSubscription

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtGetQueryInfo", "ptr", QueryOrSubscription, "int", PropertyId, "uint", PropertyValueBufferSize, "ptr", PropertyValueBuffer, "uint*", PropertyValueBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a bookmark that identifies an event in a channel.
     * @param {PWSTR} BookmarkXml An XML string that contains the bookmark or <b>NULL</b> if creating a bookmark.
     * @returns {EVT_HANDLE} A handle to the bookmark if the call succeeds; otherwise, <b>NULL</b>. If <b>NULL</b>, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtcreatebookmark
     * @since windows6.0.6000
     */
    static EvtCreateBookmark(BookmarkXml) {
        BookmarkXml := BookmarkXml is String ? StrPtr(BookmarkXml) : BookmarkXml

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtCreateBookmark", "ptr", BookmarkXml, "ptr")
        if(A_LastError)
            throw OSError()

        return EVT_HANDLE({Value: result}, True)
    }

    /**
     * Updates the bookmark with information that identifies the specified event.
     * @param {EVT_HANDLE} Bookmark The handle to the bookmark to be updated. The <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtcreatebookmark">EvtCreateBookmark</a> function returns this handle.
     * @param {EVT_HANDLE} Event The handle to the event to bookmark.
     * @returns {BOOL} <table>
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
     * The function failed. Call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtupdatebookmark
     * @since windows6.0.6000
     */
    static EvtUpdateBookmark(Bookmark, Event) {
        Bookmark := Bookmark is Win32Handle ? NumGet(Bookmark, "ptr") : Bookmark
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtUpdateBookmark", "ptr", Bookmark, "ptr", Event, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets information that identifies the structured XML query that selected the event and the channel or log file that contained the event.
     * @param {EVT_HANDLE} Event A handle to an event for which you want to retrieve information.
     * @param {Integer} PropertyId A flag that identifies the information to retrieve. For example, the query identifier or the path. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_event_property_id">EVT_EVENT_PROPERTY_ID</a> enumeration.
     * @param {Integer} PropertyValueBufferSize The size of the <i>PropertyValueBuffer</i> buffer, in bytes.
     * @param {Pointer} PropertyValueBuffer A caller-allocated buffer that will receive the information. The buffer contains an <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ns-winevt-evt_variant">EVT_VARIANT</a> object. You can set this parameter to <b>NULL</b> to determine the required buffer size.
     * @param {Pointer<Integer>} PropertyValueBufferUsed The size, in bytes, of the caller-allocated buffer that the function used or the required buffer size if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {BOOL} <table>
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
     * The function failed. Use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to get the error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winevt/nf-winevt-evtgeteventinfo
     * @since windows6.0.6000
     */
    static EvtGetEventInfo(Event, PropertyId, PropertyValueBufferSize, PropertyValueBuffer, PropertyValueBufferUsed) {
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        A_LastError := 0

        result := DllCall("wevtapi.dll\EvtGetEventInfo", "ptr", Event, "int", PropertyId, "uint", PropertyValueBufferSize, "ptr", PropertyValueBuffer, "uint*", PropertyValueBufferUsed, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Clears the specified event log, and optionally saves the current copy of the log to a backup file.
     * @param {HANDLE} hEventLog A handle to the event log to be cleared. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> function returns this handle.
     * @param {PSTR} lpBackupFileName The absolute or relative path of the backup file. If this file already exists, the function fails. 
     * 
     * 
     * 
     * 
     * If the <i>lpBackupFileName</i> parameter is <b>NULL</b>, the event log is not backed up.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The 
     * <b>ClearEventLog</b> function can fail if the event log is empty or the backup file already exists.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-cleareventloga
     * @since windows5.0
     */
    static ClearEventLogA(hEventLog, lpBackupFileName) {
        hEventLog := hEventLog is Win32Handle ? NumGet(hEventLog, "ptr") : hEventLog
        lpBackupFileName := lpBackupFileName is String ? StrPtr(lpBackupFileName) : lpBackupFileName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ClearEventLogA", "ptr", hEventLog, "ptr", lpBackupFileName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Clears the specified event log, and optionally saves the current copy of the log to a backup file.
     * @param {HANDLE} hEventLog A handle to the event log to be cleared. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> function returns this handle.
     * @param {PWSTR} lpBackupFileName The absolute or relative path of the backup file. If this file already exists, the function fails. 
     * 
     * 
     * 
     * 
     * If the <i>lpBackupFileName</i> parameter is <b>NULL</b>, the event log is not backed up.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The 
     * <b>ClearEventLog</b> function can fail if the event log is empty or the backup file already exists.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-cleareventlogw
     * @since windows5.0
     */
    static ClearEventLogW(hEventLog, lpBackupFileName) {
        hEventLog := hEventLog is Win32Handle ? NumGet(hEventLog, "ptr") : hEventLog
        lpBackupFileName := lpBackupFileName is String ? StrPtr(lpBackupFileName) : lpBackupFileName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ClearEventLogW", "ptr", hEventLog, "ptr", lpBackupFileName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Saves the specified event log to a backup file.
     * @param {HANDLE} hEventLog A handle to the open event log. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> function returns this handle.
     * @param {PSTR} lpBackupFileName The absolute or relative path of the backup file.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-backupeventloga
     * @since windows5.0
     */
    static BackupEventLogA(hEventLog, lpBackupFileName) {
        hEventLog := hEventLog is Win32Handle ? NumGet(hEventLog, "ptr") : hEventLog
        lpBackupFileName := lpBackupFileName is String ? StrPtr(lpBackupFileName) : lpBackupFileName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\BackupEventLogA", "ptr", hEventLog, "ptr", lpBackupFileName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Saves the specified event log to a backup file.
     * @param {HANDLE} hEventLog A handle to the open event log. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> function returns this handle.
     * @param {PWSTR} lpBackupFileName The absolute or relative path of the backup file.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-backupeventlogw
     * @since windows5.0
     */
    static BackupEventLogW(hEventLog, lpBackupFileName) {
        hEventLog := hEventLog is Win32Handle ? NumGet(hEventLog, "ptr") : hEventLog
        lpBackupFileName := lpBackupFileName is String ? StrPtr(lpBackupFileName) : lpBackupFileName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\BackupEventLogW", "ptr", hEventLog, "ptr", lpBackupFileName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes the specified event log.
     * @param {HANDLE} hEventLog A handle to the event log to be closed. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openbackupeventloga">OpenBackupEventLog</a> function returns this handle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-closeeventlog
     * @since windows5.0
     */
    static CloseEventLog(hEventLog) {
        hEventLog := hEventLog is Win32Handle ? NumGet(hEventLog, "ptr") : hEventLog

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CloseEventLog", "ptr", hEventLog, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes the specified event log.
     * @param {HANDLE} hEventLog A handle to the event log. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registereventsourcea">RegisterEventSource</a> function returns this handle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-deregistereventsource
     * @since windows5.0
     */
    static DeregisterEventSource(hEventLog) {
        hEventLog := hEventLog is Win32Handle ? NumGet(hEventLog, "ptr") : hEventLog

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\DeregisterEventSource", "ptr", hEventLog, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables an application to receive notification when an event is written to the specified event log.
     * @param {HANDLE} hEventLog A handle to an event log. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a>  function returns this handle.
     * @param {HANDLE} hEvent A handle to a manual-reset or auto-reset event object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function to create the event object.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-notifychangeeventlog
     * @since windows5.0
     */
    static NotifyChangeEventLog(hEventLog, hEvent) {
        hEventLog := hEventLog is Win32Handle ? NumGet(hEventLog, "ptr") : hEventLog
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\NotifyChangeEventLog", "ptr", hEventLog, "ptr", hEvent, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the number of records in the specified event log.
     * @param {HANDLE} hEventLog A handle to the open event log. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openbackupeventloga">OpenBackupEventLog</a> function returns this handle.
     * @param {Pointer<Integer>} NumberOfRecords A pointer to a variable that receives the number of records in the specified event log.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getnumberofeventlogrecords
     * @since windows5.0
     */
    static GetNumberOfEventLogRecords(hEventLog, NumberOfRecords) {
        hEventLog := hEventLog is Win32Handle ? NumGet(hEventLog, "ptr") : hEventLog

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetNumberOfEventLogRecords", "ptr", hEventLog, "uint*", NumberOfRecords, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the absolute record number of the oldest record in the specified event log.
     * @param {HANDLE} hEventLog A handle to the open event log. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openbackupeventloga">OpenBackupEventLog</a> function returns this handle.
     * @param {Pointer<Integer>} OldestRecord A pointer to a variable that receives the absolute record number of the oldest record in the specified event log.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getoldesteventlogrecord
     * @since windows5.0
     */
    static GetOldestEventLogRecord(hEventLog, OldestRecord) {
        hEventLog := hEventLog is Win32Handle ? NumGet(hEventLog, "ptr") : hEventLog

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetOldestEventLogRecord", "ptr", hEventLog, "uint*", OldestRecord, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a handle to the specified event log.
     * @param {PSTR} lpUNCServerName The Universal Naming Convention (UNC) name of the remote server on which the event log is to be opened. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {PSTR} lpSourceName The name of the log. 
     * 
     * If you specify a custom log and it cannot be found, the event logging service opens the <b>Application</b> log; however, there will be no associated message or category string file.
     * @returns {HANDLE} If the function succeeds, the return value is the handle to an event log.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-openeventloga
     * @since windows5.0
     */
    static OpenEventLogA(lpUNCServerName, lpSourceName) {
        lpUNCServerName := lpUNCServerName is String ? StrPtr(lpUNCServerName) : lpUNCServerName
        lpSourceName := lpSourceName is String ? StrPtr(lpSourceName) : lpSourceName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenEventLogA", "ptr", lpUNCServerName, "ptr", lpSourceName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Opens a handle to the specified event log.
     * @param {PWSTR} lpUNCServerName The Universal Naming Convention (UNC) name of the remote server on which the event log is to be opened. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {PWSTR} lpSourceName The name of the log. 
     * 
     * If you specify a custom log and it cannot be found, the event logging service opens the <b>Application</b> log; however, there will be no associated message or category string file.
     * @returns {HANDLE} If the function succeeds, the return value is the handle to an event log.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-openeventlogw
     * @since windows5.0
     */
    static OpenEventLogW(lpUNCServerName, lpSourceName) {
        lpUNCServerName := lpUNCServerName is String ? StrPtr(lpUNCServerName) : lpUNCServerName
        lpSourceName := lpSourceName is String ? StrPtr(lpSourceName) : lpSourceName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenEventLogW", "ptr", lpUNCServerName, "ptr", lpSourceName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Retrieves a registered handle to the specified event log.
     * @param {PSTR} lpUNCServerName The Universal Naming Convention (UNC) name of the remote server on which this operation is to be performed. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {PSTR} lpSourceName The name of the <a href="https://docs.microsoft.com/windows/desktop/EventLog/event-sources">event source</a> whose handle is to be retrieved. The source name must be a subkey of a log under the <b>Eventlog</b> registry key. 
     * 						Note that the <b>Security</b> log is for system use only.
     * 
     * <div class="alert"><b>Note</b>  This string must not contain characters prohibited in XML Attributes, with the exception of XML Escape sequences such as <b>&amp;lt  &amp;gl</b>.</div>
     * <div> </div>
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the event log.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The function returns <b>ERROR_ACCESS_DENIED</b> if <i>lpSourceName</i> specifies the <b>Security</b> event log.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-registereventsourcea
     * @since windows5.0
     */
    static RegisterEventSourceA(lpUNCServerName, lpSourceName) {
        lpUNCServerName := lpUNCServerName is String ? StrPtr(lpUNCServerName) : lpUNCServerName
        lpSourceName := lpSourceName is String ? StrPtr(lpSourceName) : lpSourceName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\RegisterEventSourceA", "ptr", lpUNCServerName, "ptr", lpSourceName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Retrieves a registered handle to the specified event log.
     * @param {PWSTR} lpUNCServerName The Universal Naming Convention (UNC) name of the remote server on which this operation is to be performed. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {PWSTR} lpSourceName The name of the <a href="https://docs.microsoft.com/windows/desktop/EventLog/event-sources">event source</a> whose handle is to be retrieved. The source name must be a subkey of a log under the <b>Eventlog</b> registry key. 
     * 						Note that the <b>Security</b> log is for system use only.
     * 
     * <div class="alert"><b>Note</b>  This string must not contain characters prohibited in XML Attributes, with the exception of XML Escape sequences such as <b>&amp;lt;</b> or <b>&amp;gt;</b>.</div>
     * <div> </div>
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the event log.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The function returns <b>ERROR_ACCESS_DENIED</b> if <i>lpSourceName</i> specifies the <b>Security</b> event log.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-registereventsourcew
     * @since windows5.0
     */
    static RegisterEventSourceW(lpUNCServerName, lpSourceName) {
        lpUNCServerName := lpUNCServerName is String ? StrPtr(lpUNCServerName) : lpUNCServerName
        lpSourceName := lpSourceName is String ? StrPtr(lpSourceName) : lpSourceName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\RegisterEventSourceW", "ptr", lpUNCServerName, "ptr", lpSourceName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Opens a handle to a backup event log created by the BackupEventLog function.
     * @param {PSTR} lpUNCServerName The Universal Naming Convention (UNC) name of the remote server on which this operation is to be performed. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {PSTR} lpFileName The full path of the backup file.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the backup event log.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-openbackupeventloga
     * @since windows5.0
     */
    static OpenBackupEventLogA(lpUNCServerName, lpFileName) {
        lpUNCServerName := lpUNCServerName is String ? StrPtr(lpUNCServerName) : lpUNCServerName
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenBackupEventLogA", "ptr", lpUNCServerName, "ptr", lpFileName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Opens a handle to a backup event log created by the BackupEventLog function.
     * @param {PWSTR} lpUNCServerName The Universal Naming Convention (UNC) name of the remote server on which this operation is to be performed. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {PWSTR} lpFileName The full path of the backup file.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the backup event log.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-openbackupeventlogw
     * @since windows5.0
     */
    static OpenBackupEventLogW(lpUNCServerName, lpFileName) {
        lpUNCServerName := lpUNCServerName is String ? StrPtr(lpUNCServerName) : lpUNCServerName
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenBackupEventLogW", "ptr", lpUNCServerName, "ptr", lpFileName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Reads the specified number of entries from the specified event log.
     * @param {HANDLE} hEventLog A handle to the event log to be read. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> function returns this handle.
     * @param {Integer} dwReadFlags 
     * @param {Integer} dwRecordOffset The record number of the log-entry at which the read operation should start. This parameter is ignored unless <i>dwReadFlags</i> includes the <b>EVENTLOG_SEEK_READ</b> flag.
     * @param {Pointer} lpBuffer An application-allocated buffer that will receive one or more <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-eventlogrecord">EVENTLOGRECORD</a> structures. This parameter cannot be <b>NULL</b>, even if the <i>nNumberOfBytesToRead</i> parameter is zero. 
     * 
     * 
     * 
     * 
     * The maximum size of this buffer is 0x7ffff bytes.
     * @param {Integer} nNumberOfBytesToRead The size of the <i>lpBuffer</i> buffer, in bytes. This function will read as many log entries as will fit in the buffer; the function will not return partial entries.
     * @param {Pointer<Integer>} pnBytesRead A pointer to a variable that receives the number of bytes read by the function.
     * @param {Pointer<Integer>} pnMinNumberOfBytesNeeded A pointer to a variable that receives the required size of the <i>lpBuffer</i> buffer. This value is valid only if this function returns zero and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-readeventloga
     * @since windows5.0
     */
    static ReadEventLogA(hEventLog, dwReadFlags, dwRecordOffset, lpBuffer, nNumberOfBytesToRead, pnBytesRead, pnMinNumberOfBytesNeeded) {
        hEventLog := hEventLog is Win32Handle ? NumGet(hEventLog, "ptr") : hEventLog

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ReadEventLogA", "ptr", hEventLog, "uint", dwReadFlags, "uint", dwRecordOffset, "ptr", lpBuffer, "uint", nNumberOfBytesToRead, "uint*", pnBytesRead, "uint*", pnMinNumberOfBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads the specified number of entries from the specified event log.
     * @param {HANDLE} hEventLog A handle to the event log to be read. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openeventloga">OpenEventLog</a> function returns this handle.
     * @param {Integer} dwReadFlags 
     * @param {Integer} dwRecordOffset The record number of the log-entry at which the read operation should start. This parameter is ignored unless <i>dwReadFlags</i> includes the <b>EVENTLOG_SEEK_READ</b> flag.
     * @param {Pointer} lpBuffer An application-allocated buffer that will receive one or more <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-eventlogrecord">EVENTLOGRECORD</a> structures. This parameter cannot be <b>NULL</b>, even if the <i>nNumberOfBytesToRead</i> parameter is zero. 
     * 
     * 
     * 
     * 
     * The maximum size of this buffer is 0x7ffff bytes.
     * @param {Integer} nNumberOfBytesToRead The size of the <i>lpBuffer</i> buffer, in bytes. This function will read as many log entries as will fit in the buffer; the function will not return partial entries.
     * @param {Pointer<Integer>} pnBytesRead A pointer to a variable that receives the number of bytes read by the function.
     * @param {Pointer<Integer>} pnMinNumberOfBytesNeeded A pointer to a variable that receives the required size of the <i>lpBuffer</i> buffer. This value is valid only this function returns zero and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-readeventlogw
     * @since windows5.0
     */
    static ReadEventLogW(hEventLog, dwReadFlags, dwRecordOffset, lpBuffer, nNumberOfBytesToRead, pnBytesRead, pnMinNumberOfBytesNeeded) {
        hEventLog := hEventLog is Win32Handle ? NumGet(hEventLog, "ptr") : hEventLog

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ReadEventLogW", "ptr", hEventLog, "uint", dwReadFlags, "uint", dwRecordOffset, "ptr", lpBuffer, "uint", nNumberOfBytesToRead, "uint*", pnBytesRead, "uint*", pnMinNumberOfBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes an entry at the end of the specified event log.
     * @param {HANDLE} hEventLog A handle to the event log. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registereventsourcea">RegisterEventSource</a> function returns this handle. 
     * 
     * As of Windows XP with SP2, this parameter cannot be a handle to the <b>Security</b> log. To write an event to the <b>Security</b> log, use the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzreportsecurityevent">AuthzReportSecurityEvent</a> function.
     * @param {Integer} wType 
     * @param {Integer} wCategory The event category. This is source-specific information; the category can have any value. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/EventLog/event-categories">Event Categories</a>.
     * @param {Integer} dwEventID The event identifier. The event identifier specifies the entry in the message file associated with the event source. For more information, see <a href="https://docs.microsoft.com/windows/desktop/EventLog/event-identifiers">Event Identifiers</a>.
     * @param {PSID} lpUserSid A pointer to the current user's security identifier. This parameter can be <b>NULL</b> if the security identifier is not required.
     * @param {Integer} wNumStrings The number of insert strings in the array pointed to by the <i>lpStrings</i> parameter. A value of zero indicates that no strings are present.
     * @param {Integer} dwDataSize The number of bytes of event-specific raw (binary) data to write to the log. If this parameter is zero, no event-specific data is present.
     * @param {Pointer<PSTR>} lpStrings A pointer to a buffer containing an array of null-terminated strings that are merged into the message before Event Viewer displays the string to the user. This parameter must be a valid pointer (or <b>NULL</b>), even if <i>wNumStrings</i> is zero. Each string is limited to 31,839  characters.
     * 
     * <b>Prior to Windows Vista:  </b>Each string is limited to 32K characters.
     * @param {Pointer} lpRawData A pointer to the buffer containing the binary data. This parameter must be a valid pointer (or <b>NULL</b>), even if the <i>dwDataSize</i> parameter is zero.
     * @returns {BOOL} If the function succeeds, the return value is nonzero, indicating that the entry was written to the log.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, which returns one of the following extended error codes.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-reporteventa
     * @since windows5.0
     */
    static ReportEventA(hEventLog, wType, wCategory, dwEventID, lpUserSid, wNumStrings, dwDataSize, lpStrings, lpRawData) {
        hEventLog := hEventLog is Win32Handle ? NumGet(hEventLog, "ptr") : hEventLog

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ReportEventA", "ptr", hEventLog, "ushort", wType, "ushort", wCategory, "uint", dwEventID, "ptr", lpUserSid, "ushort", wNumStrings, "uint", dwDataSize, "ptr", lpStrings, "ptr", lpRawData, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes an entry at the end of the specified event log.
     * @param {HANDLE} hEventLog A handle to the event log. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registereventsourcea">RegisterEventSource</a> function returns this handle. 
     * 
     * As of Windows XP with SP2, this parameter cannot be a handle to the <b>Security</b> log. To write an event to the <b>Security</b> log, use the <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzreportsecurityevent">AuthzReportSecurityEvent</a> function.
     * @param {Integer} wType 
     * @param {Integer} wCategory The event category. This is source-specific information; the category can have any value. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/EventLog/event-categories">Event Categories</a>.
     * @param {Integer} dwEventID The event identifier. The event identifier specifies the entry in the message file associated with the event source. For more information, see <a href="https://docs.microsoft.com/windows/desktop/EventLog/event-identifiers">Event Identifiers</a>.
     * @param {PSID} lpUserSid A pointer to the current user's security identifier. This parameter can be <b>NULL</b> if the security identifier is not required.
     * @param {Integer} wNumStrings The number of insert strings in the array pointed to by the <i>lpStrings</i> parameter. A value of zero indicates that no strings are present.
     * @param {Integer} dwDataSize The number of bytes of event-specific raw (binary) data to write to the log. If this parameter is zero, no event-specific data is present.
     * @param {Pointer<PWSTR>} lpStrings A pointer to a buffer containing an array of null-terminated strings that are merged into the message before Event Viewer displays the string to the user. This parameter must be a valid pointer (or <b>NULL</b>), even if <i>wNumStrings</i> is zero. Each string is limited to 31,839  characters.
     * 
     * <b>Prior to Windows Vista:  </b>Each string is limited to 32K characters.
     * @param {Pointer} lpRawData A pointer to the buffer containing the binary data. This parameter must be a valid pointer (or <b>NULL</b>), even if the <i>dwDataSize</i> parameter is zero.
     * @returns {BOOL} If the function succeeds, the return value is nonzero, indicating that the entry was written to the log.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, which returns one of the following extended error codes.
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
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-reporteventw
     * @since windows5.0
     */
    static ReportEventW(hEventLog, wType, wCategory, dwEventID, lpUserSid, wNumStrings, dwDataSize, lpStrings, lpRawData) {
        hEventLog := hEventLog is Win32Handle ? NumGet(hEventLog, "ptr") : hEventLog

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ReportEventW", "ptr", hEventLog, "ushort", wType, "ushort", wCategory, "uint", dwEventID, "ptr", lpUserSid, "ushort", wNumStrings, "uint", dwDataSize, "ptr", lpStrings, "ptr", lpRawData, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the specified event log.
     * @param {HANDLE} hEventLog A handle to the event log. The 
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
     * @param {Pointer} lpBuffer An application-allocated buffer that receives the event log information. The format of this data depends on the value of the <i>dwInfoLevel</i> parameter.
     * @param {Integer} cbBufSize The size of the <i>lpBuffer</i> buffer, in bytes.
     * @param {Pointer<Integer>} pcbBytesNeeded The function sets this parameter to the required buffer size for the requested information, regardless of whether the function succeeds. Use this value if the function fails with <b>ERROR_INSUFFICIENT_BUFFER</b> to allocate a buffer of the correct size.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-geteventloginformation
     * @since windows5.0
     */
    static GetEventLogInformation(hEventLog, dwInfoLevel, lpBuffer, cbBufSize, pcbBytesNeeded) {
        hEventLog := hEventLog is Win32Handle ? NumGet(hEventLog, "ptr") : hEventLog

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetEventLogInformation", "ptr", hEventLog, "uint", dwInfoLevel, "ptr", lpBuffer, "uint", cbBufSize, "uint*", pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}
