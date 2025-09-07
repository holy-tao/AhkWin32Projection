#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_DVDCOPY_TITLEKEY extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    KeyFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UInt32>}
     */
    ReservedNT{
        get {
            if(!this.HasProp("__ReservedNTProxyArray"))
                this.__ReservedNTProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "uint")
            return this.__ReservedNTProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    TitleKey{
        get {
            if(!this.HasProp("__TitleKeyProxyArray"))
                this.__TitleKeyProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__TitleKeyProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 18, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
