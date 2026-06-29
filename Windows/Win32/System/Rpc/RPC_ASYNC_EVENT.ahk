#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RPC_ASYNC_EVENT enumerated type describes the asynchronous notification events that an RPC application can receive.
 * @see https://learn.microsoft.com/windows/win32/api/rpcasync/ne-rpcasync-rpc_async_event
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_ASYNC_EVENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
