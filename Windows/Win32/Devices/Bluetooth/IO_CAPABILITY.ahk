#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
class IO_CAPABILITY extends Win32Enum {

    /**
     * Native name: IoCaps_DisplayOnly
     * @type {Integer (Int32)}
     */
    static Caps_DisplayOnly => 0

    /**
     * Native name: IoCaps_DisplayYesNo
     * @type {Integer (Int32)}
     */
    static Caps_DisplayYesNo => 1

    /**
     * Native name: IoCaps_KeyboardOnly
     * @type {Integer (Int32)}
     */
    static Caps_KeyboardOnly => 2

    /**
     * Native name: IoCaps_NoInputNoOutput
     * @type {Integer (Int32)}
     */
    static Caps_NoInputNoOutput => 3

    /**
     * Native name: IoCaps_Undefined
     * @type {Integer (Int32)}
     */
    static Caps_Undefined => 255
}
