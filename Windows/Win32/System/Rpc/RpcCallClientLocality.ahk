#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the set of possible RPC client localities.
 * @see https://learn.microsoft.com/windows/win32/api/rpcasync/ne-rpcasync-rpccallclientlocality
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RpcCallClientLocality {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The RPC client locality is invalid.
     * @type {Integer (Int32)}
     */
    static rcclInvalid => 0

    /**
     * The RPC client is local.
     * @type {Integer (Int32)}
     */
    static rcclLocal => 1

    /**
     * The RPC client is remote.
     * @type {Integer (Int32)}
     */
    static rcclRemote => 2

    /**
     * The RPC client has an unknown locality.
     * @type {Integer (Int32)}
     */
    static rcclClientUnknownLocality => 3
}
