#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class INPUT_BUTTON_ENABLE_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ButtonType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    Enabled{
        get {
            if(!this.HasProp("__Enabled"))
                this.__Enabled := BOOLEAN(this.ptr + 4)
            return this.__Enabled
        }
    }
}
