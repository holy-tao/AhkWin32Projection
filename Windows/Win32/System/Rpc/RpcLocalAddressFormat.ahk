#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the possible local IP address formats supported by RPC.
 * @see https://docs.microsoft.com/windows/win32/api//rpcasync/ne-rpcasync-rpclocaladdressformat
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RpcLocalAddressFormat{

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
