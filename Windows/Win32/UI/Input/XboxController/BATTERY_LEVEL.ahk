#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 */
class BATTERY_LEVEL extends Win32Enum {

    /**
     * Native name: BATTERY_LEVEL_EMPTY
     * @type {Integer (Byte)}
     */
    static EMPTY => 0x00

    /**
     * Native name: BATTERY_LEVEL_LOW
     * @type {Integer (Byte)}
     */
    static LOW => 0x01

    /**
     * Native name: BATTERY_LEVEL_MEDIUM
     * @type {Integer (Byte)}
     */
    static MEDIUM => 0x02

    /**
     * Native name: BATTERY_LEVEL_FULL
     * @type {Integer (Byte)}
     */
    static FULL => 0x03
}
