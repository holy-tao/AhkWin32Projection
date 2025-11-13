#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_EXTENDED_ATTR extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * @type {Integer}
     */
    EXATTYPE {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    EXATLEN {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Array<Byte>}
     */
    EXATVAL{
        get {
            if(!this.HasProp("__EXATVALProxyArray"))
                this.__EXATVALProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__EXATVALProxyArray
        }
    }
}
