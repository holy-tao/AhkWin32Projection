#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 * @version v4.0.30319
 */
class BATTERY_DEVTYPE extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_DEVTYPE_GAMEPAD => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_DEVTYPE_HEADSET => 0x01
}
