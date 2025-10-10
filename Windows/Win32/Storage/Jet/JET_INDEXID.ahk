#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_INDEXID extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    rgbIndexId{
        get {
            if(!this.HasProp("__rgbIndexIdProxyArray"))
                this.__rgbIndexIdProxyArray := Win32FixedArray(this.ptr + 4, 16, Primitive, "char")
            return this.__rgbIndexIdProxyArray
        }
    }
}
