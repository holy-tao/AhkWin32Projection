#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVMEOF_FABRICS_RESPONSE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 2

    /**
     * @type {Array<Byte>}
     */
    Specific{
        get {
            if(!this.HasProp("__SpecificProxyArray"))
                this.__SpecificProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__SpecificProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    SQHD {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    CID {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    STS {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }
}
