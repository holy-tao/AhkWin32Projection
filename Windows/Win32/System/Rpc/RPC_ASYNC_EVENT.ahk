#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The RPC_ASYNC_EVENT enumerated type describes the asynchronous notification events that an RPC application can receive.
 * @see https://docs.microsoft.com/windows/win32/api//rpcasync/ne-rpcasync-rpc_async_event
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_ASYNC_EVENT extends Win32Enum{

    /**
     * The remote procedure call has completely executed.
     * @type {Integer (Int32)}
     */
    static RpcCallComplete => 0

    /**
     * The RPC run-time library finished transmitting some of the data provided by the user. A portion, but not necessarily all of the data being sent, has been transmitted. Only applications using DCE pipes will receive this notification.
     * @type {Integer (Int32)}
     */
    static RpcSendComplete => 1

    /**
     * The RPC run-time library finished receiving data. Only applications using DCE pipes will receive this notification.
     * @type {Integer (Int32)}
     */
    static RpcReceiveComplete => 2

    /**
     * The RPC client has disconnected from the service.
     * @type {Integer (Int32)}
     */
    static RpcClientDisconnect => 3

    /**
     * Windows Vista or later: The RPC client has cancelled the asynchronous procedure call.
     * @type {Integer (Int32)}
     */
    static RpcClientCancel => 4
}
