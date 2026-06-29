#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the possible local IP address formats supported by RPC.
 * @see https://learn.microsoft.com/windows/win32/api/rpcasync/ne-rpcasync-rpclocaladdressformat
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RpcLocalAddressFormat {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The address format is not supported.
     * @type {Integer (Int32)}
     */
    static rlafInvalid => 0

    /**
     * The address format is IP version 4.
     * @type {Integer (Int32)}
     */
    static rlafIPv4 => 1

    /**
     * The address format is IP version 6.
     * @type {Integer (Int32)}
     */
    static rlafIPv6 => 2
}
