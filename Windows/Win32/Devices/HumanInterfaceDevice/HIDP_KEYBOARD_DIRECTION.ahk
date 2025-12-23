#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class HIDP_KEYBOARD_DIRECTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HidP_Keyboard_Break => 0

    /**
     * @type {Integer (Int32)}
     */
    static HidP_Keyboard_Make => 1
}
