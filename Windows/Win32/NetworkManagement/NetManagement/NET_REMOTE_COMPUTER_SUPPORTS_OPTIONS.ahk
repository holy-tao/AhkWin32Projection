#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class NET_REMOTE_COMPUTER_SUPPORTS_OPTIONS extends Win32Enum {

    /**
     * Native name: SUPPORTS_REMOTE_ADMIN_PROTOCOL
     * @type {Integer (UInt32)}
     */
    static REMOTE_ADMIN_PROTOCOL => 2

    /**
     * Native name: SUPPORTS_RPC
     * @type {Integer (UInt32)}
     */
    static RPC => 4

    /**
     * Native name: SUPPORTS_SAM_PROTOCOL
     * @type {Integer (UInt32)}
     */
    static SAM_PROTOCOL => 8

    /**
     * Native name: SUPPORTS_UNICODE
     * @type {Integer (UInt32)}
     */
    static UNICODE => 16

    /**
     * Native name: SUPPORTS_LOCAL
     * @type {Integer (UInt32)}
     */
    static LOCAL => 32
}
