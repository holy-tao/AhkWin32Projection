#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the action types returned by WebSocketGetAction.
 * @see https://docs.microsoft.com/windows/win32/api//websocket/ne-websocket-web_socket_action_queue
 * @namespace Windows.Win32.Networking.WebSocket
 * @version v4.0.30319
 */
class WEB_SOCKET_ACTION_QUEUE{

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketgetaction">WebSocketGetAction</a> will return only send-related actions.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_SEND_ACTION_QUEUE => 1

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketgetaction">WebSocketGetAction</a> will return receive-related actions as well as internal send actions (reply to a ping frame).
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_RECEIVE_ACTION_QUEUE => 2

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketgetaction">WebSocketGetAction</a> will return all actions.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_ALL_ACTION_QUEUE => 3
}
