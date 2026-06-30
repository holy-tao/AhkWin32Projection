#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\GPIOBUTTONS_BUTTON_TYPE.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
class INPUT_BUTTON_ENABLE_INFO extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {GPIOBUTTONS_BUTTON_TYPE}
     */
    ButtonType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    Enabled {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }
}
