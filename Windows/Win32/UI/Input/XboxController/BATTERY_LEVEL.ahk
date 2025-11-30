#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 * @version v4.0.30319
 */
class BATTERY_LEVEL extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_LEVEL_EMPTY => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_LEVEL_LOW => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_LEVEL_MEDIUM => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_LEVEL_FULL => 0x03
}
