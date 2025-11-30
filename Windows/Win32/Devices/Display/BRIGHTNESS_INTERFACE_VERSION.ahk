#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class BRIGHTNESS_INTERFACE_VERSION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BRIGHTNESS_INTERFACE_VERSION_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static BRIGHTNESS_INTERFACE_VERSION_2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static BRIGHTNESS_INTERFACE_VERSION_3 => 3
}
