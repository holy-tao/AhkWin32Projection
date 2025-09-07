#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CDROM_TOC_ATIP_DATA_BLOCK.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_TOC_ATIP_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    Length{
        get {
            if(!this.HasProp("__LengthProxyArray"))
                this.__LengthProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__LengthProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Array<CDROM_TOC_ATIP_DATA_BLOCK>}
     */
    Descriptors{
        get {
            if(!this.HasProp("__DescriptorsProxyArray"))
                this.__DescriptorsProxyArray := Win32FixedArray(this.ptr + 8, 8, CDROM_TOC_ATIP_DATA_BLOCK, "")
            return this.__DescriptorsProxyArray
        }
    }
}
