#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies actions to be taken by WebSocket applications.
 * @see https://learn.microsoft.com/windows/win32/api/websocket/ne-websocket-web_socket_action
 * @namespace Windows.Win32.Networking.WebSocket
 * @version v4.0.30319
 */
class WEB_SOCKET_ACTION extends Win32Enum{

    /**
     * There are no actions to process.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_NO_ACTION => 0

    /**
     * Indicates the application should send the buffers to a network.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_SEND_TO_NETWORK_ACTION => 1

    /**
     * Indicates the operation queued by <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketsend">WebSocketSend</a> is complete. The application context returned by <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcompleteaction">WebSocketCompleteAction</a> for this send operation is no longer needed, therefore it should be freed.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_INDICATE_SEND_COMPLETE_ACTION => 2

    /**
     * Indicates the application should fill the buffers with data from a network.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_RECEIVE_FROM_NETWORK_ACTION => 3

    /**
     * Indicates the operation queued by <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketreceive">WebSocketReceive</a> is complete. The application context returned by <a href="https://docs.microsoft.com/windows/desktop/api/websocket/nf-websocket-websocketcompleteaction">WebSocketCompleteAction</a> for this receive operation is no longer needed, therefore it should be freed.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_INDICATE_RECEIVE_COMPLETE_ACTION => 4
}
