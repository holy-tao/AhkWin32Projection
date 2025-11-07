#Requires AutoHotkey v2.0.0 64-bit

/**
 * The RPC_NOTIFICATION_TYPES enumerated type contains values that specify the method of asynchronous notification that a client program will use.
 * @see https://docs.microsoft.com/windows/win32/api//rpcasync/ne-rpcasync-rpc_notification_types
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_NOTIFICATION_TYPES{

    /**
     * The client does not require notification of the completion of an asynchronous remote procedure call.
     * @type {Integer (Int32)}
     */
    static RpcNotificationTypeNone => 0

    /**
     * Notify the client program by signaling an event object. See 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/event-objects">Event Objects</a>.
     * @type {Integer (Int32)}
     */
    static RpcNotificationTypeEvent => 1

    /**
     * Use an asynchronous procedure call to notify the client that the remote procedure call is complete.
     * @type {Integer (Int32)}
     */
    static RpcNotificationTypeApc => 2

    /**
     * Send the asynchronous RPC notification to the client through an I/O completion port.
     * @type {Integer (Int32)}
     */
    static RpcNotificationTypeIoc => 3

    /**
     * Post a notification message to the specified window handle.
     * @type {Integer (Int32)}
     */
    static RpcNotificationTypeHwnd => 4

    /**
     * Invoke a callback function provided by the client program.
     * @type {Integer (Int32)}
     */
    static RpcNotificationTypeCallback => 5
}
