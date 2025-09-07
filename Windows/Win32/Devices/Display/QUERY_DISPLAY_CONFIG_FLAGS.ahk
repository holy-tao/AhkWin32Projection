#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class QUERY_DISPLAY_CONFIG_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static QDC_ALL_PATHS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QDC_ONLY_ACTIVE_PATHS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static QDC_DATABASE_CURRENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static QDC_VIRTUAL_MODE_AWARE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static QDC_INCLUDE_HMD => 32

    /**
     * @type {Integer (UInt32)}
     */
    static QDC_VIRTUAL_REFRESH_RATE_AWARE => 64
}
