#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_STATE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATE_CONNECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATE_DISCONNECTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATE_DISCONNECTED_BY_USER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATE_IDLE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATE_BUSY => 512
}
