#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class VIDEO_BANK_TYPE extends Win32Enum {

    /**
     * Native name: VideoNotBanked
     * @type {Integer (Int32)}
     */
    static NotBanked => 0

    /**
     * Native name: VideoBanked1RW
     * @type {Integer (Int32)}
     */
    static Banked1RW => 1

    /**
     * Native name: VideoBanked1R1W
     * @type {Integer (Int32)}
     */
    static Banked1R1W => 2

    /**
     * Native name: VideoBanked2RW
     * @type {Integer (Int32)}
     */
    static Banked2RW => 3

    /**
     * @type {Integer (Int32)}
     */
    static NumVideoBankTypes => 4
}
