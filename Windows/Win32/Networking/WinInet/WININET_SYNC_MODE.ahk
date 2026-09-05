#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class WININET_SYNC_MODE extends Win32Enum {

    /**
     * Native name: WININET_SYNC_MODE_NEVER
     * @type {Integer (Int32)}
     */
    static NEVER => 0

    /**
     * Native name: WININET_SYNC_MODE_ON_EXPIRY
     * @type {Integer (Int32)}
     */
    static ON_EXPIRY => 1

    /**
     * Native name: WININET_SYNC_MODE_ONCE_PER_SESSION
     * @type {Integer (Int32)}
     */
    static ONCE_PER_SESSION => 2

    /**
     * Native name: WININET_SYNC_MODE_ALWAYS
     * @type {Integer (Int32)}
     */
    static ALWAYS => 3

    /**
     * Native name: WININET_SYNC_MODE_AUTOMATIC
     * @type {Integer (Int32)}
     */
    static AUTOMATIC => 4

    /**
     * Native name: WININET_SYNC_MODE_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 4
}
