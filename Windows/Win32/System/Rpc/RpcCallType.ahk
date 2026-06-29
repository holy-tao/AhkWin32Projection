#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the set of RPC call types.
 * @see https://learn.microsoft.com/windows/win32/api/rpcasync/ne-rpcasync-rpccalltype
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RpcCallType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The remote procedure call is invalid.
     * @type {Integer (Int32)}
     */
    static rctInvalid => 0

    /**
     * The remote procedure call has no special properties.
     * @type {Integer (Int32)}
     */
    static rctNormal => 1

    /**
     * The remote procedure call is used for "training" RPC.
     * @type {Integer (Int32)}
     */
    static rctTraining => 2

    /**
     * The remote procedure call has guaranteed execution.
     * @type {Integer (Int32)}
     */
    static rctGuaranteed => 3
}
