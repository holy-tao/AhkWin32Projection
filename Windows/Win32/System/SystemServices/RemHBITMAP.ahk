#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class RemHBITMAP extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    data{
        get {
            if(!this.HasProp("__dataProxyArray"))
                this.__dataProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__dataProxyArray
        }
    }
}
