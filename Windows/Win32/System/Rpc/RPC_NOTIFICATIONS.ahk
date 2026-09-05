#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The RPC_NOTIFICATIONS enumeration specifies the notifications a server can receive from RPC.
 * @see https://learn.microsoft.com/windows/win32/api/rpcasync/ne-rpcasync-rpc_notifications
 * @namespace Windows.Win32.System.Rpc
 */
class RPC_NOTIFICATIONS extends Win32Enum {

    /**
     * Do not send a notification.
     * 
     * <b>Windows Vista:  </b>Currently, this value is not supported for <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/nf-rpcasync-rpcserversubscribefornotification">RpcServerSubscribeForNotification</a> and <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/nf-rpcasync-rpcserverunsubscribefornotification">RpcServerUnsubscribeForNotification</a>.
     * Native name: RpcNotificationCallNone
     * @type {Integer (Int32)}
     */
    static NotificationCallNone => 0

    /**
     * The client has disconnected.
     * Native name: RpcNotificationClientDisconnect
     * @type {Integer (Int32)}
     */
    static NotificationClientDisconnect => 1

    /**
     * The RPC call has been canceled.
     * Native name: RpcNotificationCallCancel
     * @type {Integer (Int32)}
     */
    static NotificationCallCancel => 2
}
