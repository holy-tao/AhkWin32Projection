#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_HOST_METADATA_ELEMENT_DESCRIPTOR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    EVAL{
        get {
            if(!this.HasProp("__EVALProxyArray"))
                this.__EVALProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__EVALProxyArray
        }
    }
}
