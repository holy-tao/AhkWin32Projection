#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_STRING extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    lResult {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulStringSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    argbString{
        get {
            if(!this.HasProp("__argbStringProxyArray"))
                this.__argbStringProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__argbStringProxyArray
        }
    }
}
