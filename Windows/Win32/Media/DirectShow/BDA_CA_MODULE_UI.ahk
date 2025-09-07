#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_CA_MODULE_UI extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ulFormat {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulbcDesc {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<UInt32>}
     */
    ulDesc{
        get {
            if(!this.HasProp("__ulDescProxyArray"))
                this.__ulDescProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "uint")
            return this.__ulDescProxyArray
        }
    }
}
