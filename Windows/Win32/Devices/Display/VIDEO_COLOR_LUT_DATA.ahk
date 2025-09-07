#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class VIDEO_COLOR_LUT_DATA extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    LutDataFormat {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    LutData{
        get {
            if(!this.HasProp("__LutDataProxyArray"))
                this.__LutDataProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__LutDataProxyArray
        }
    }
}
