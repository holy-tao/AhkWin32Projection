#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class INTERNET_CONNECTION extends Win32BitflagEnum {

    /**
     * Native name: INTERNET_CONNECTION_CONFIGURED
     * @type {Integer (UInt32)}
     */
    static CONFIGURED => 64

    /**
     * Native name: INTERNET_CONNECTION_LAN
     * @type {Integer (UInt32)}
     */
    static LAN => 2

    /**
     * Native name: INTERNET_CONNECTION_MODEM
     * @type {Integer (UInt32)}
     */
    static MODEM => 1

    /**
     * Native name: INTERNET_CONNECTION_MODEM_BUSY
     * @type {Integer (UInt32)}
     */
    static MODEM_BUSY => 8

    /**
     * Native name: INTERNET_CONNECTION_OFFLINE
     * @type {Integer (UInt32)}
     */
    static OFFLINE => 32

    /**
     * Native name: INTERNET_CONNECTION_PROXY
     * @type {Integer (UInt32)}
     */
    static PROXY => 4

    /**
     * Native name: INTERNET_RAS_INSTALLED
     * @type {Integer (UInt32)}
     */
    static RAS_INSTALLED => 16
}
