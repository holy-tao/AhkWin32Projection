#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 */
class BATTERY_DEVTYPE extends Win32Enum {

    /**
     * Native name: BATTERY_DEVTYPE_GAMEPAD
     * @type {Integer (Byte)}
     */
    static GAMEPAD => 0x00

    /**
     * Native name: BATTERY_DEVTYPE_HEADSET
     * @type {Integer (Byte)}
     */
    static HEADSET => 0x01
}
