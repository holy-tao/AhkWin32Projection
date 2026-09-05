#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class RPC_C_HTTP_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: RPC_C_HTTP_FLAG_USE_SSL
     * @type {Integer (UInt32)}
     */
    static FLAG_USE_SSL => 1

    /**
     * Native name: RPC_C_HTTP_FLAG_USE_FIRST_AUTH_SCHEME
     * @type {Integer (UInt32)}
     */
    static FLAG_USE_FIRST_AUTH_SCHEME => 2

    /**
     * Native name: RPC_C_HTTP_FLAG_IGNORE_CERT_CN_INVALID
     * @type {Integer (UInt32)}
     */
    static FLAG_IGNORE_CERT_CN_INVALID => 8

    /**
     * Native name: RPC_C_HTTP_FLAG_ENABLE_CERT_REVOCATION_CHECK
     * @type {Integer (UInt32)}
     */
    static FLAG_ENABLE_CERT_REVOCATION_CHECK => 16
}
