#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The RPC_NOTIFICATION_TYPES enumerated type contains values that specify the method of asynchronous notification that a client program will use.
 * @see https://learn.microsoft.com/windows/win32/api/rpcasync/ne-rpcasync-rpc_notification_types
 * @namespace Windows.Win32.System.Rpc
 */
class RPC_NOTIFICATION_TYPES extends Win32Enum {

    /**
     * The client does not require notification of the completion of an asynchronous remote procedure call.
     * Native name: RpcNotificationTypeNone
     * @type {Integer (Int32)}
     */
    static TypeNone => 0

    /**
     * Notify the client program by signaling an event object. See 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/event-objects">Event Objects</a>.
     * Native name: RpcNotificationTypeEvent
     * @type {Integer (Int32)}
     */
    static TypeEvent => 1

    /**
     * Use an asynchronous procedure call to notify the client that the remote procedure call is complete.
     * Native name: RpcNotificationTypeApc
     * @type {Integer (Int32)}
     */
    static TypeApc => 2

    /**
     * Send the asynchronous RPC notification to the client through an I/O completion port.
     * Native name: RpcNotificationTypeIoc
     * @type {Integer (Int32)}
     */
    static TypeIoc => 3

    /**
     * Post a notification message to the specified window handle.
     * Native name: RpcNotificationTypeHwnd
     * @type {Integer (Int32)}
     */
    static TypeHwnd => 4

    /**
     * Invoke a callback function provided by the client program.
     * Native name: RpcNotificationTypeCallback
     * @type {Integer (Int32)}
     */
    static TypeCallback => 5
}
