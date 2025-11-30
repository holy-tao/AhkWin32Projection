#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class IO_CAPABILITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IoCaps_DisplayOnly => 0

    /**
     * @type {Integer (Int32)}
     */
    static IoCaps_DisplayYesNo => 1

    /**
     * @type {Integer (Int32)}
     */
    static IoCaps_KeyboardOnly => 2

    /**
     * @type {Integer (Int32)}
     */
    static IoCaps_NoInputNoOutput => 3

    /**
     * @type {Integer (Int32)}
     */
    static IoCaps_Undefined => 255
}
