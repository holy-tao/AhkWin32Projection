#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The RPC_ASYNC_EVENT enumerated type describes the asynchronous notification events that an RPC application can receive.
 * @see https://learn.microsoft.com/windows/win32/api/rpcasync/ne-rpcasync-rpc_async_event
 * @namespace Windows.Win32.System.Rpc
 */
class RPC_ASYNC_EVENT extends Win32Enum {

    /**
     * The remote procedure call has completely executed.
     * Native name: RpcCallComplete
     * @type {Integer (Int32)}
     */
    static CallComplete => 0

    /**
     * The RPC run-time library finished transmitting some of the data provided by the user. A portion, but not necessarily all of the data being sent, has been transmitted. Only applications using DCE pipes will receive this notification.
     * Native name: RpcSendComplete
     * @type {Integer (Int32)}
     */
    static SendComplete => 1

    /**
     * The RPC run-time library finished receiving data. Only applications using DCE pipes will receive this notification.
     * Native name: RpcReceiveComplete
     * @type {Integer (Int32)}
     */
    static ReceiveComplete => 2

    /**
     * The RPC client has disconnected from the service.
     * Native name: RpcClientDisconnect
     * @type {Integer (Int32)}
     */
    static ClientDisconnect => 3

    /**
     * Windows Vista or later: The RPC client has cancelled the asynchronous procedure call.
     * Native name: RpcClientCancel
     * @type {Integer (Int32)}
     */
    static ClientCancel => 4
}
