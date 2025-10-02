#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB4_HRD_DEBUG_READ_CONFIGURATION_SPACE_OUTPUT extends Win32Struct
{
    static sizeof => 244

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Usb4Status {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Array<UInt32>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 4, 60, Primitive, "uint")
            return this.__DataProxyArray
        }
    }
}
