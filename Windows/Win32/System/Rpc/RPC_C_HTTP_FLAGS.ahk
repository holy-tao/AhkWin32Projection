#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_C_HTTP_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_HTTP_FLAG_USE_SSL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_HTTP_FLAG_USE_FIRST_AUTH_SCHEME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_HTTP_FLAG_IGNORE_CERT_CN_INVALID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_HTTP_FLAG_ENABLE_CERT_REVOCATION_CHECK => 16
}
