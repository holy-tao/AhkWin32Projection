#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters that specify a single entry in a list of Logical Block Address (LBA) ranges, for the LBA Range Type Feature in the Set Features command.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_lba_ranget_type_entry
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_LBA_RANGET_TYPE_ENTRY extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * An [NVME_LBA_RANGE_TYPES](ne-nvme-nvme_lba_range_types.md) value that specifies the type of the LBA range.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies attributes for the LBA range. Each bit defines an attribute, as follows:
     * 
     * - Bit 0 - If this bit is set to `1`, the LBA range may be overwritten. If this bit is cleared to `0`, the LBA range should not be overwritten.
     * - Bit 1 - If this bit is set to `1`, the LBA range should be hidden from the OS/EFI/BIOS. If this bit is cleared to `0`, the area should be visible to the OS/EFI/BIOS.
     * - Bits 2-7 - Reserved
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * 
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 2, 14, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * Specifies the 64-bit address of the first logical block that is part of this LBA range.
     * @type {Integer}
     */
    SLBA {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the number of logical blocks that are part of this LBA range. This is a 0s based value.
     * @type {Integer}
     */
    NLB {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A Global Unique Identifier (GUID) that uniquely specifies the type of this LBA range. Well known Types may be defined and are published on the [NVM Express website](https://nvmexpress.org/).
     * @type {Array<Byte>}
     */
    GUID{
        get {
            if(!this.HasProp("__GUIDProxyArray"))
                this.__GUIDProxyArray := Win32FixedArray(this.ptr + 32, 16, Primitive, "char")
            return this.__GUIDProxyArray
        }
    }

    /**
     * 
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 48, 16, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }
}
