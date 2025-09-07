#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NET_REMOTE_COMPUTER_SUPPORTS_OPTIONS{

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORTS_REMOTE_ADMIN_PROTOCOL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORTS_RPC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORTS_SAM_PROTOCOL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORTS_UNICODE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORTS_LOCAL => 32
}
