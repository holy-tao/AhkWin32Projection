#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.Networking.WebSocket
 * @version v4.0.30319
 */
class WebSocket {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static WEB_SOCKET_MAX_CLOSE_REASON_LENGTH => 123
;@endregion Constants

;@region Methods
    /**
     * Creates a client-side WebSocket session handle.
     * @param {Pointer<WEB_SOCKET_PROPERTY>} pProperties Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_property">PWEB_SOCKET_PROPERTY</a></b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_property">WEB_SOCKET_PROPERTY</a> structures that contain WebSocket session-related properties.
     * @param {Integer} ulPropertyCount Type: <b>ULONG</b>
     * 
     * Number of properties in <i>pProperties</i>.
     * @param {Pointer<WEB_SOCKET_HANDLE>} phWebSocket Type: <b><a href="https://docs.microsoft.com/windows/desktop/WebSock/web-socket-protocol-component-api-data-types">WEB_SOCKET_HANDLE</a>*</b>
     * 
     * On successful output, pointer to a  newly allocated client-side WebSocket session handle.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the function succeeds, it returns <b>S_OK</b>.
     * 
     * If the function fails, it returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//websocket/nf-websocket-websocketcreateclienthandle
     * @since windows8.0
     */
    static WebSocketCreateClientHandle(pProperties, ulPropertyCount, phWebSocket) {
        result := DllCall("websocket.dll\WebSocketCreateClientHandle", "ptr", pProperties, "uint", ulPropertyCount, "ptr", phWebSocket, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Begins the client-side handshake.
     * @param {WEB_SOCKET_HANDLE} hWebSocket Type: <b><a href="https://docs.microsoft.com/windows/desktop/WebSock/web-socket-protocol-component-api-data-types">WEB_SOCKET_HANDLE</a></b>
     * 
     *  WebSocket session handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcreateclienthandle">WebSocketCreateClientHandle</a>.
     * @param {Pointer<PSTR>} pszSubprotocols Type: <b>PCSTR*</b>
     * 
     * Pointer to an array of sub-protocols chosen by the application. Once the client-server handshake is complete, the application must use the sub-protocol returned by <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketendclienthandshake">WebSocketEndClientHandshake</a>. Must contain one subprotocol per entry.
     * @param {Integer} ulSubprotocolCount Type: <b>ULONG</b>
     * 
     * Number of sub-protocols in <i>pszSubprotocols</i>.
     * @param {Pointer<PSTR>} pszExtensions Type: <b>PCSTR*</b>
     * 
     * Pointer to an array of extensions chosen by the application. Once the client-server handshake is complete, the application must use the extension returned by <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketendclienthandshake">WebSocketEndClientHandshake</a>. Must contain one extension per entry.
     * @param {Integer} ulExtensionCount Type: <b>ULONG</b>
     * 
     * Number of extensions in <i>pszExtensions</i>.
     * @param {Pointer<WEB_SOCKET_HTTP_HEADER>} pInitialHeaders Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_http_header">PWEB_SOCKET_HTTP_HEADER</a></b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_http_header">WEB_SOCKET_HTTP_HEADER</a> structures that contain the request headers to be sent by the application. The array must include the <i>Host HTTP</i> header as defined in <a href="http://tools.ietf.org/html/rfc2616">RFC 2616</a>.
     * @param {Integer} ulInitialHeaderCount Type: <b>ULONG</b>
     * 
     * Number of request headers in <i>pInitialHeaders</i>.
     * @param {Pointer<WEB_SOCKET_HTTP_HEADER>} pAdditionalHeaders Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_http_header">PWEB_SOCKET_HTTP_HEADER</a></b>
     * 
     * On successful output, pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_http_header">WEB_SOCKET_HTTP_HEADER</a> structures that contain the request headers to be sent by the application. If any of these headers were specified in <i>pInitialHeaders</i>, the header must be replaced.
     * @param {Pointer<UInt32>} pulAdditionalHeaderCount Type: <b>ULONG*</b>
     * 
     * On successful output, number of response headers in <i>pAdditionalHeaders</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the function succeeds, it returns <b>S_OK</b>.
     * 
     * If the function fails, it returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//websocket/nf-websocket-websocketbeginclienthandshake
     * @since windows8.0
     */
    static WebSocketBeginClientHandshake(hWebSocket, pszSubprotocols, ulSubprotocolCount, pszExtensions, ulExtensionCount, pInitialHeaders, ulInitialHeaderCount, pAdditionalHeaders, pulAdditionalHeaderCount) {
        hWebSocket := hWebSocket is Win32Handle ? NumGet(hWebSocket, "ptr") : hWebSocket

        result := DllCall("websocket.dll\WebSocketBeginClientHandshake", "ptr", hWebSocket, "ptr", pszSubprotocols, "uint", ulSubprotocolCount, "ptr", pszExtensions, "uint", ulExtensionCount, "ptr", pInitialHeaders, "uint", ulInitialHeaderCount, "ptr", pAdditionalHeaders, "uint*", pulAdditionalHeaderCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Completes the client-side handshake.
     * @param {WEB_SOCKET_HANDLE} hWebSocket Type: <b><a href="https://docs.microsoft.com/windows/desktop/WebSock/web-socket-protocol-component-api-data-types">WEB_SOCKET_HANDLE</a></b>
     * 
     *  WebSocket session handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcreateclienthandle">WebSocketCreateClientHandle</a>.
     * @param {Pointer<WEB_SOCKET_HTTP_HEADER>} pResponseHeaders Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_http_header">PWEB_SOCKET_HTTP_HEADER</a></b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_http_header">WEB_SOCKET_HTTP_HEADER</a> structures that contain the response headers received by the application.
     * @param {Integer} ulReponseHeaderCount Type: <b>ULONG</b>
     * 
     * Number of response headers in <i>pResponseHeaders</i>.
     * @param {Pointer<UInt32>} pulSelectedExtensions Type: <b>ULONG*</b>
     * 
     * On input, pointer to an array allocated by the application. On successful output, pointer to an array of numbers that represent the extensions chosen by the server during the client-server handshake. These number are the zero-based indices into the extensions array passed to  <i>pszExtensions</i> in <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketbeginclienthandshake">WebSocketBeginClientHandshake</a>.
     * @param {Pointer<UInt32>} pulSelectedExtensionCount Type: <b>ULONG*</b>
     * 
     * On input, number of extensions allocated in <i>pulSelectedExtensions</i>. This must be at least equal to the number passed to <i>ulExtensionCount</i> in <b>WebSocketEndClientHandshake</b>. On successful output, number of extensions returned in <i>pulSelectedExtensions</i>.
     * @param {Pointer<UInt32>} pulSelectedSubprotocol Type: <b>ULONG*</b>
     * 
     * On successful output, pointer to a number that represents the sub-protocol chosen by the server during the client-server handshake. This number is the zero-based index into the sub-protocols array passed to  <i>pszSubprotocols</i> in <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketbeginclienthandshake">WebSocketBeginClientHandshake</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the function succeeds, it returns <b>S_OK</b>.
     * 
     * If the function fails, it returns one of the following or a <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALID_PROTOCOL_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Protocol data had an invalid format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNSUPPORTED_SUBPROTOCOL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Server does not accept any of the sub-protocols specified by the application.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNSUPPORTED_EXTENSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Server does not accept extensions specified by the application.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//websocket/nf-websocket-websocketendclienthandshake
     * @since windows8.0
     */
    static WebSocketEndClientHandshake(hWebSocket, pResponseHeaders, ulReponseHeaderCount, pulSelectedExtensions, pulSelectedExtensionCount, pulSelectedSubprotocol) {
        hWebSocket := hWebSocket is Win32Handle ? NumGet(hWebSocket, "ptr") : hWebSocket

        result := DllCall("websocket.dll\WebSocketEndClientHandshake", "ptr", hWebSocket, "ptr", pResponseHeaders, "uint", ulReponseHeaderCount, "uint*", pulSelectedExtensions, "uint*", pulSelectedExtensionCount, "uint*", pulSelectedSubprotocol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a server-side WebSocket session handle.
     * @param {Pointer<WEB_SOCKET_PROPERTY>} pProperties Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_property">PWEB_SOCKET_PROPERTY</a></b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_property">WEB_SOCKET_PROPERTY</a> structures that contain WebSocket session-related properties.
     * @param {Integer} ulPropertyCount Type: <b>ULONG</b>
     * 
     * Number of properties in <i>pProperties</i>.
     * @param {Pointer<WEB_SOCKET_HANDLE>} phWebSocket Type: <b><a href="https://docs.microsoft.com/windows/desktop/WebSock/web-socket-protocol-component-api-data-types">WEB_SOCKET_HANDLE</a>*</b>
     * 
     * On successful output, pointer to a newly allocated server-side WebSocket session handle.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the function succeeds, it returns <b>S_OK</b>.
     * 
     * If the function fails, it returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//websocket/nf-websocket-websocketcreateserverhandle
     * @since windows8.0
     */
    static WebSocketCreateServerHandle(pProperties, ulPropertyCount, phWebSocket) {
        result := DllCall("websocket.dll\WebSocketCreateServerHandle", "ptr", pProperties, "uint", ulPropertyCount, "ptr", phWebSocket, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Begins the server-side handshake.
     * @param {WEB_SOCKET_HANDLE} hWebSocket Type: <b><a href="https://docs.microsoft.com/windows/desktop/WebSock/web-socket-protocol-component-api-data-types">WEB_SOCKET_HANDLE</a></b>
     * 
     *  WebSocket session handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcreateserverhandle">WebSocketCreateServerHandle</a>.
     * @param {PSTR} pszSubprotocolSelected Type: <b>PCSTR</b>
     * 
     * A pointer to a sub-protocol value chosen by the application. Must contain one subprotocol.
     * @param {Pointer<PSTR>} pszExtensionSelected Type: <b>PCSTR*</b>
     * 
     * A pointer to a list of extensions chosen by the application. Must contain one extension per entry.
     * @param {Integer} ulExtensionSelectedCount Type: <b>ULONG</b>
     * 
     * Number of extensions in <i>pszExtensionSelected</i>.
     * @param {Pointer<WEB_SOCKET_HTTP_HEADER>} pRequestHeaders Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_http_header">PWEB_SOCKET_HTTP_HEADER</a></b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_http_header">WEB_SOCKET_HTTP_HEADER</a> structures that contain the request headers received by the application.
     * @param {Integer} ulRequestHeaderCount Type: <b>ULONG</b>
     * 
     * Number of request headers in <i>pRequestHeaders</i>.
     * @param {Pointer<WEB_SOCKET_HTTP_HEADER>} pResponseHeaders Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_http_header">PWEB_SOCKET_HTTP_HEADER</a>*</b>
     * 
     * On successful output, a pointer to an array or <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_http_header">WEB_SOCKET_HTTP_HEADER</a> structures that contain the response headers to be sent by the application.
     * @param {Pointer<UInt32>} pulResponseHeaderCount Type: <b>ULONG*</b>
     * 
     * On successful output, number of response headers in <i>pResponseHeaders</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the function succeeds, it returns <b>S_OK</b>.
     * 
     * If the function fails, it returns one of the following or a <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALID_PROTOCOL_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Protocol data had an invalid format.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//websocket/nf-websocket-websocketbeginserverhandshake
     * @since windows8.0
     */
    static WebSocketBeginServerHandshake(hWebSocket, pszSubprotocolSelected, pszExtensionSelected, ulExtensionSelectedCount, pRequestHeaders, ulRequestHeaderCount, pResponseHeaders, pulResponseHeaderCount) {
        pszSubprotocolSelected := pszSubprotocolSelected is String ? StrPtr(pszSubprotocolSelected) : pszSubprotocolSelected
        hWebSocket := hWebSocket is Win32Handle ? NumGet(hWebSocket, "ptr") : hWebSocket

        result := DllCall("websocket.dll\WebSocketBeginServerHandshake", "ptr", hWebSocket, "ptr", pszSubprotocolSelected, "ptr", pszExtensionSelected, "uint", ulExtensionSelectedCount, "ptr", pRequestHeaders, "uint", ulRequestHeaderCount, "ptr", pResponseHeaders, "uint*", pulResponseHeaderCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Completes the server-side handshake.
     * @param {WEB_SOCKET_HANDLE} hWebSocket Type: <b><a href="https://docs.microsoft.com/windows/desktop/WebSock/web-socket-protocol-component-api-data-types">WEB_SOCKET_HANDLE</a></b>
     * 
     *  WebSocket session handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcreateserverhandle">WebSocketCreateServerHandle</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the function succeeds, it returns <b>S_OK</b>.
     * 
     * If the function fails, it returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//websocket/nf-websocket-websocketendserverhandshake
     * @since windows8.0
     */
    static WebSocketEndServerHandshake(hWebSocket) {
        hWebSocket := hWebSocket is Win32Handle ? NumGet(hWebSocket, "ptr") : hWebSocket

        result := DllCall("websocket.dll\WebSocketEndServerHandshake", "ptr", hWebSocket, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds a send operation to the protocol component operation queue.
     * @param {WEB_SOCKET_HANDLE} hWebSocket Type: <b><a href="https://docs.microsoft.com/windows/desktop/WebSock/web-socket-protocol-component-api-data-types">WEB_SOCKET_HANDLE</a></b>
     * 
     * WebSocket session handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcreateclienthandle">WebSocketCreateClientHandle</a> or <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcreateserverhandle">WebSocketCreateServerHandle</a>.
     * @param {Integer} BufferType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/websocket/ne-websocket-web_socket_buffer_type">WEB_SOCKET_BUFFER_TYPE</a></b>
     * 
     * The type of WebSocket buffer data to send in <i>pBuffer</i>.
     * @param {Pointer<WEB_SOCKET_BUFFER>} pBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_buffer">WEB_SOCKET_BUFFER</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_buffer">WEB_SOCKET_BUFFER</a> structures that contains WebSocket buffer data to send. If <i>BufferType</i> is <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ne-websocket-web_socket_buffer_type">WEB_SOCKET_PING_PONG_BUFFER_TYPE</a> or <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ne-websocket-web_socket_buffer_type">WEB_SOCKET_UNSOLICITED_PONG_BUFFER_TYPE</a>, <i>pBuffer</i> must be <b>NULL</b>.
     * 
     * <div class="alert"><b>Note</b>  Once <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ne-websocket-web_socket_property_type">WEB_SOCKET_INDICATE_SEND_COMPLETE</a> is returned by <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketgetaction">WebSocketGetAction</a> for this action, the memory pointer to by <i>pBuffer</i> can be reclaimed.</div>
     * <div> </div>
     * @param {Pointer<Void>} Context Type: <b>PVOID</b>
     * 
     * A pointer to an application context handle that will be returned by a subsequent call to  <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketgetaction">WebSocketGetAction</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the function succeeds, it returns <b>S_OK</b>.
     * 
     * If the function fails, it returns one of the following or a <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALID_PROTOCOL_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Protocol performed an invalid operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//websocket/nf-websocket-websocketsend
     * @since windows8.0
     */
    static WebSocketSend(hWebSocket, BufferType, pBuffer, Context) {
        hWebSocket := hWebSocket is Win32Handle ? NumGet(hWebSocket, "ptr") : hWebSocket

        result := DllCall("websocket.dll\WebSocketSend", "ptr", hWebSocket, "int", BufferType, "ptr", pBuffer, "ptr", Context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds a receive operation to the protocol component operation queue.
     * @param {WEB_SOCKET_HANDLE} hWebSocket Type: <b><a href="https://docs.microsoft.com/windows/desktop/WebSock/web-socket-protocol-component-api-data-types">WEB_SOCKET_HANDLE</a></b>
     * 
     * WebSocket session handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcreateclienthandle">WebSocketCreateClientHandle</a> or <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcreateserverhandle">WebSocketCreateServerHandle</a>.
     * @param {Pointer<WEB_SOCKET_BUFFER>} pBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_buffer">WEB_SOCKET_BUFFER</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_buffer">WEB_SOCKET_BUFFER</a> structures that WebSocket data will be written to when it is returned by <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketgetaction">WebSocketGetAction</a>. If <b>NULL</b>, <b>WebSocketGetAction</b> will return an internal buffer that enables zero-copy scenarios.
     * 
     * <div class="alert"><b>Note</b>  Once <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ne-websocket-web_socket_property_type">WEB_SOCKET_INDICATE_RECEIVE_COMPLETE</a> is returned by <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketgetaction">WebSocketGetAction</a> for this action, the memory pointer to by <i>pBuffer</i> can be reclaimed.</div>
     * <div> </div>
     * @param {Pointer<Void>} pvContext Type: <b>PVOID</b>
     * 
     * A pointer to an application context handle that will be returned by a subsequent call to  <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketgetaction">WebSocketGetAction</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the function succeeds, it returns <b>S_OK</b>.
     * 
     * If the function fails, it returns one of the following or a <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALID_PROTOCOL_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Protocol performed an invalid operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//websocket/nf-websocket-websocketreceive
     * @since windows8.0
     */
    static WebSocketReceive(hWebSocket, pBuffer, pvContext) {
        hWebSocket := hWebSocket is Win32Handle ? NumGet(hWebSocket, "ptr") : hWebSocket

        result := DllCall("websocket.dll\WebSocketReceive", "ptr", hWebSocket, "ptr", pBuffer, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns an action from a call to WebSocketSend, WebSocketReceive or WebSocketCompleteAction.
     * @param {WEB_SOCKET_HANDLE} hWebSocket Type: <b><a href="https://docs.microsoft.com/windows/desktop/WebSock/web-socket-protocol-component-api-data-types">WEB_SOCKET_HANDLE</a></b>
     * 
     * WebSocket session handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcreateclienthandle">WebSocketCreateClientHandle</a> or <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcreateserverhandle">WebSocketCreateServerHandle</a>.
     * @param {Integer} eActionQueue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/websocket/ne-websocket-web_socket_action_queue">WEB_SOCKET_ACTION_QUEUE</a></b>
     * 
     * Enumeration that specifies whether to query the send queue, the receive queue, or both.
     * @param {Pointer<WEB_SOCKET_BUFFER>} pDataBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_buffer">WEB_SOCKET_BUFFER</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_buffer">WEB_SOCKET_BUFFER</a> structures that contain WebSocket buffer data.
     * 
     * <div class="alert"><b>Note</b>  Do not allocate or deallocate memory for <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_buffer">WEB_SOCKET_BUFFER</a> structures, because they will be overwritten by <b>WebSocketGetAction</b>. The memory for buffers returned by <b>WebSocketGetAction</b> are managed by the library.</div>
     * <div> </div>
     * @param {Pointer<UInt32>} pulDataBufferCount Type: <b>ULONG*</b>
     * 
     * On input, pointer to a value that specifies the number of elements in <i>pDataBuffers</i>. On successful output, number of elements that were actually returned in <i>pDataBuffers</i>.
     * @param {Pointer<Int32>} pAction Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/websocket/ne-websocket-web_socket_action">WEB_SOCKET_ACTION</a>*</b>
     * 
     * On successful output, pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ne-websocket-web_socket_action">WEB_SOCKET_ACTION</a> enumeration that specifies the action returned from the query to the queue defines in <i>eActionQueue</i>.
     * @param {Pointer<Int32>} pBufferType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/websocket/ne-websocket-web_socket_buffer_type">WEB_SOCKET_BUFFER_TYPE</a>*</b>
     * 
     * On successful output, pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ne-websocket-web_socket_buffer_type">WEB_SOCKET_BUFFER_TYPE</a> enumeration that specifies the type of Web Socket buffer data returned in <i>pDataBuffers</i>.
     * @param {Pointer<Void>} pvApplicationContext Type: <b>PVOID*</b>
     * 
     * On successful output, pointer to an application context handle. The context returned here was initially passed to <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketsend">WebSocketSend</a> or <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketreceive">WebSocketReceive</a>. <i>pvApplicationContext</i> is not set if <i>pAction</i> is <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ne-websocket-web_socket_action">WEB_SOCKET_NO_ACTION</a> or <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ne-websocket-web_socket_action">WEB_SOCKET_SEND_TO_NETWORK_ACTION</a> when sending a pong in response to receiving a ping.
     * @param {Pointer<Void>} pvActionContext Type: <b>PVOID*</b>
     * 
     * On successful output, pointer to an action context handle. This handle is passed into a subsequent call <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcompleteaction">WebSocketCompleteAction</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the function succeeds, it returns <b>S_OK</b>.
     * 
     * If the function fails, it returns one of the following or a <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALID_PROTOCOL_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Protocol data had invalid format. This is only returned for receive operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALID_PROTOCOL_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Protocol performed invalid operations. This is only returned for receive operations.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//websocket/nf-websocket-websocketgetaction
     * @since windows8.0
     */
    static WebSocketGetAction(hWebSocket, eActionQueue, pDataBuffers, pulDataBufferCount, pAction, pBufferType, pvApplicationContext, pvActionContext) {
        hWebSocket := hWebSocket is Win32Handle ? NumGet(hWebSocket, "ptr") : hWebSocket

        result := DllCall("websocket.dll\WebSocketGetAction", "ptr", hWebSocket, "int", eActionQueue, "ptr", pDataBuffers, "uint*", pulDataBufferCount, "int*", pAction, "int*", pBufferType, "ptr", pvApplicationContext, "ptr", pvActionContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Completes an action started by WebSocketGetAction.
     * @param {WEB_SOCKET_HANDLE} hWebSocket Type: <b><a href="https://docs.microsoft.com/windows/desktop/WebSock/web-socket-protocol-component-api-data-types">WEB_SOCKET_HANDLE</a></b>
     * 
     * WebSocket session handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcreateclienthandle">WebSocketCreateClientHandle</a> or <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcreateserverhandle">WebSocketCreateServerHandle</a>.
     * @param {Pointer<Void>} pvActionContext Type: <b>PVOID</b>
     * 
     * Pointer to an action context handle that was returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketgetaction">WebSocketGetAction</a>.
     * @param {Integer} ulBytesTransferred Type: <b>ULONG</b>
     * 
     * Number of bytes transferred for the <a href="https://docs.microsoft.com/windows/desktop/api/websocket/ne-websocket-web_socket_action">WEB_SOCKET_SEND_TO_NETWORK_ACTION</a> or <b>WEB_SOCKET_RECEIVE_FROM_NETWORK_ACTION</b> actions. This value must be 0 for all other actions.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//websocket/nf-websocket-websocketcompleteaction
     * @since windows8.0
     */
    static WebSocketCompleteAction(hWebSocket, pvActionContext, ulBytesTransferred) {
        hWebSocket := hWebSocket is Win32Handle ? NumGet(hWebSocket, "ptr") : hWebSocket

        DllCall("websocket.dll\WebSocketCompleteAction", "ptr", hWebSocket, "ptr", pvActionContext, "uint", ulBytesTransferred)
    }

    /**
     * Aborts a WebSocket session handle created by WebSocketCreateClientHandle or WebSocketCreateServerHandle.
     * @param {WEB_SOCKET_HANDLE} hWebSocket Type: <b><a href="https://docs.microsoft.com/windows/desktop/WebSock/web-socket-protocol-component-api-data-types">WEB_SOCKET_HANDLE</a></b>
     * 
     *  WebSocket session handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcreateclienthandle">WebSocketCreateClientHandle</a> or <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcreateserverhandle">WebSocketCreateServerHandle</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//websocket/nf-websocket-websocketaborthandle
     * @since windows8.0
     */
    static WebSocketAbortHandle(hWebSocket) {
        hWebSocket := hWebSocket is Win32Handle ? NumGet(hWebSocket, "ptr") : hWebSocket

        DllCall("websocket.dll\WebSocketAbortHandle", "ptr", hWebSocket)
    }

    /**
     * Deletes a WebSocket session handle created by WebSocketCreateClientHandle or WebSocketCreateServerHandle.
     * @param {WEB_SOCKET_HANDLE} hWebSocket Type: <b><a href="https://docs.microsoft.com/windows/desktop/WebSock/web-socket-protocol-component-api-data-types">WEB_SOCKET_HANDLE</a></b>
     * 
     * WebSocket session handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcreateclienthandle">WebSocketCreateClientHandle</a> or <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcreateserverhandle">WebSocketCreateServerHandle</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//websocket/nf-websocket-websocketdeletehandle
     * @since windows8.0
     */
    static WebSocketDeleteHandle(hWebSocket) {
        hWebSocket := hWebSocket is Win32Handle ? NumGet(hWebSocket, "ptr") : hWebSocket

        DllCall("websocket.dll\WebSocketDeleteHandle", "ptr", hWebSocket)
    }

    /**
     * Gets a single WebSocket property.
     * @param {Integer} eType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/websocket/ns-websocket-web_socket_property">WEB_SOCKET_PROPERTY</a></b>
     * 
     * A WebSocket property.
     * @param {Pointer<Void>} pvValue Type: <b>PVOID</b>
     * 
     * A pointer to the property value. The pointer must have an alignment compatible with the type of the property.
     * @param {Pointer<UInt32>} ulSize Type: <b>ULONG*</b>
     * 
     * The size, in bytes, of the property pointed to by <b>pvValue</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the function succeeds, it returns <b>S_OK</b>.
     * 
     * If the function fails, it returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//websocket/nf-websocket-websocketgetglobalproperty
     * @since windows8.0
     */
    static WebSocketGetGlobalProperty(eType, pvValue, ulSize) {
        result := DllCall("websocket.dll\WebSocketGetGlobalProperty", "int", eType, "ptr", pvValue, "uint*", ulSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
