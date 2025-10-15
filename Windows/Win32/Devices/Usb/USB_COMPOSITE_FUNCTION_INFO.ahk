#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_COMPOSITE_FUNCTION_INFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * @type {Integer}
     */
    FunctionNumber {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    BaseInterfaceNumber {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    NumberOfInterfaces {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {BOOLEAN}
     */
    FunctionIsIdle{
        get {
            if(!this.HasProp("__FunctionIsIdle"))
                this.__FunctionIsIdle := BOOLEAN(this.ptr + 3)
            return this.__FunctionIsIdle
        }
    }
}
