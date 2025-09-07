#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.StationsAndDesktops
 * @version v4.0.30319
 */
class DESKTOP_ACCESS_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_DELETE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_READ_CONTROL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_WRITE_DAC => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_WRITE_OWNER => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_SYNCHRONIZE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_READOBJECTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_CREATEWINDOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_CREATEMENU => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_HOOKCONTROL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_JOURNALRECORD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_JOURNALPLAYBACK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_ENUMERATE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_WRITEOBJECTS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_SWITCHDESKTOP => 256
}
