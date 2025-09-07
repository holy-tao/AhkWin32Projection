#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIMOUSESTATE2 extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    lX {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    lY {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    lZ {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    rgbButtons{
        get {
            if(!this.HasProp("__rgbButtonsProxyArray"))
                this.__rgbButtonsProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__rgbButtonsProxyArray
        }
    }
}
