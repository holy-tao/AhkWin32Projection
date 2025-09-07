#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class VIDEO_BANK_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static VideoNotBanked => 0

    /**
     * @type {Integer (Int32)}
     */
    static VideoBanked1RW => 1

    /**
     * @type {Integer (Int32)}
     */
    static VideoBanked1R1W => 2

    /**
     * @type {Integer (Int32)}
     */
    static VideoBanked2RW => 3

    /**
     * @type {Integer (Int32)}
     */
    static NumVideoBankTypes => 4
}
