#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class Mpeg2TableSampleHdr extends Win32Struct
{
    static sizeof => 8

    static packingSize => 1

    /**
     * @type {Integer}
     */
    SectionCount {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 1, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<Int32>}
     */
    SectionOffsets{
        get {
            if(!this.HasProp("__SectionOffsetsProxyArray"))
                this.__SectionOffsetsProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "int")
            return this.__SectionOffsetsProxyArray
        }
    }
}
