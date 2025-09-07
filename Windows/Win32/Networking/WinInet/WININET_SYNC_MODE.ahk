#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class WININET_SYNC_MODE{

    /**
     * @type {Integer (Int32)}
     */
    static WININET_SYNC_MODE_NEVER => 0

    /**
     * @type {Integer (Int32)}
     */
    static WININET_SYNC_MODE_ON_EXPIRY => 1

    /**
     * @type {Integer (Int32)}
     */
    static WININET_SYNC_MODE_ONCE_PER_SESSION => 2

    /**
     * @type {Integer (Int32)}
     */
    static WININET_SYNC_MODE_ALWAYS => 3

    /**
     * @type {Integer (Int32)}
     */
    static WININET_SYNC_MODE_AUTOMATIC => 4

    /**
     * @type {Integer (Int32)}
     */
    static WININET_SYNC_MODE_DEFAULT => 4
}
