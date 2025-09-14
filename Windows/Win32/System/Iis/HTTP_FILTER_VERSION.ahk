#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HTTP_FILTER_VERSION extends Win32Struct
{
    static sizeof => 272

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwServerFilterVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFilterVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<SByte>}
     */
    lpszFilterDesc{
        get {
            if(!this.HasProp("__lpszFilterDescProxyArray"))
                this.__lpszFilterDescProxyArray := Win32FixedArray(this.ptr + 8, 257, Primitive, "char")
            return this.__lpszFilterDescProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }
}
