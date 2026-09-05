#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.StationsAndDesktops
 */
class DESKTOP_ACCESS_FLAGS extends Win32Enum {

    /**
     * Native name: DESKTOP_DELETE
     * @type {Integer (UInt32)}
     */
    static DELETE => 65536

    /**
     * Native name: DESKTOP_READ_CONTROL
     * @type {Integer (UInt32)}
     */
    static READ_CONTROL => 131072

    /**
     * Native name: DESKTOP_WRITE_DAC
     * @type {Integer (UInt32)}
     */
    static WRITE_DAC => 262144

    /**
     * Native name: DESKTOP_WRITE_OWNER
     * @type {Integer (UInt32)}
     */
    static WRITE_OWNER => 524288

    /**
     * Native name: DESKTOP_SYNCHRONIZE
     * @type {Integer (UInt32)}
     */
    static SYNCHRONIZE => 1048576

    /**
     * Native name: DESKTOP_READOBJECTS
     * @type {Integer (UInt32)}
     */
    static READOBJECTS => 1

    /**
     * Native name: DESKTOP_CREATEWINDOW
     * @type {Integer (UInt32)}
     */
    static CREATEWINDOW => 2

    /**
     * Native name: DESKTOP_CREATEMENU
     * @type {Integer (UInt32)}
     */
    static CREATEMENU => 4

    /**
     * Native name: DESKTOP_HOOKCONTROL
     * @type {Integer (UInt32)}
     */
    static HOOKCONTROL => 8

    /**
     * Native name: DESKTOP_JOURNALRECORD
     * @type {Integer (UInt32)}
     */
    static JOURNALRECORD => 16

    /**
     * Native name: DESKTOP_JOURNALPLAYBACK
     * @type {Integer (UInt32)}
     */
    static JOURNALPLAYBACK => 32

    /**
     * Native name: DESKTOP_ENUMERATE
     * @type {Integer (UInt32)}
     */
    static ENUMERATE => 64

    /**
     * Native name: DESKTOP_WRITEOBJECTS
     * @type {Integer (UInt32)}
     */
    static WRITEOBJECTS => 128

    /**
     * Native name: DESKTOP_SWITCHDESKTOP
     * @type {Integer (UInt32)}
     */
    static SWITCHDESKTOP => 256
}
