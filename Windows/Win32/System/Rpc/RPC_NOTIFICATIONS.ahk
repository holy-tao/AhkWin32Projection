#Requires AutoHotkey v2.0.0 64-bit

/**
 * The RPC_NOTIFICATIONS enumeration specifies the notifications a server can receive from RPC.
 * @see https://learn.microsoft.com/windows/win32/api/rpcasync/ne-rpcasync-rpc_notifications
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_NOTIFICATIONS{

    /**
     * Do not send a notification.
 * 
 * <b>Windows Vista:  </b>Currently, this value is not supported for <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/nf-rpcasync-rpcserversubscribefornotification">RpcServerSubscribeForNotification</a> and <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/nf-rpcasync-rpcserverunsubscribefornotification">RpcServerUnsubscribeForNotification</a>.
     * @type {Integer (Int32)}
     */
    static RpcNotificationCallNone => 0

    /**
     * The client has disconnected.
     * @type {Integer (Int32)}
     */
    static RpcNotificationClientDisconnect => 1

    /**
     * The RPC call has been canceled.
     * @type {Integer (Int32)}
     */
    static RpcNotificationCallCancel => 2
}
