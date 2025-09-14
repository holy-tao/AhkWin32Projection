#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Cabinets
 * @version v4.0.30319
 */
class FDISPILLFILE extends Win32Struct
{
    static sizeof => 6

    static packingSize => 1

    /**
     * @type {Array<SByte>}
     */
    ach{
        get {
            if(!this.HasProp("__achProxyArray"))
                this.__achProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "char")
            return this.__achProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    cbFile {
        get => NumGet(this, 2, "int")
        set => NumPut("int", value, this, 2)
    }
}
