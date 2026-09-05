#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class INTERNET_STATE extends Win32Enum {

    /**
     * Native name: INTERNET_STATE_CONNECTED
     * @type {Integer (UInt32)}
     */
    static CONNECTED => 1

    /**
     * Native name: INTERNET_STATE_DISCONNECTED
     * @type {Integer (UInt32)}
     */
    static DISCONNECTED => 2

    /**
     * Native name: INTERNET_STATE_DISCONNECTED_BY_USER
     * @type {Integer (UInt32)}
     */
    static DISCONNECTED_BY_USER => 16

    /**
     * Native name: INTERNET_STATE_IDLE
     * @type {Integer (UInt32)}
     */
    static IDLE => 256

    /**
     * Native name: INTERNET_STATE_BUSY
     * @type {Integer (UInt32)}
     */
    static BUSY => 512
}
