#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters that specify a single entry in a list of Logical Block Address (LBA) ranges, for the LBA Range Type Feature in the Set Features command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_lba_ranget_type_entry
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_LBA_RANGET_TYPE_ENTRY {
    #StructPack 8


    struct _Attributes {
        /**
         * This bitfield backs the following members:
         * - MayOverwritten
         * - Hidden
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        MayOverwritten {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        Hidden {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    }

    /**
     * An [NVME_LBA_RANGE_TYPES](ne-nvme-nvme_lba_range_types.md) value that specifies the type of the LBA range.
     */
    Type : Int8

    /**
     * Specifies attributes for the LBA range. Each bit defines an attribute, as follows:
     * 
     * - Bit 0 - If this bit is set to `1`, the LBA range may be overwritten. If this bit is cleared to `0`, the LBA range should not be overwritten.
     * - Bit 1 - If this bit is set to `1`, the LBA range should be hidden from the OS/EFI/BIOS. If this bit is cleared to `0`, the area should be visible to the OS/EFI/BIOS.
     * - Bits 2-7 - Reserved
     */
    Attributes : NVME_LBA_RANGET_TYPE_ENTRY._Attributes

    Reserved0 : Int8[14]

    /**
     * Specifies the 64-bit address of the first logical block that is part of this LBA range.
     */
    SLBA : Int64

    /**
     * Specifies the number of logical blocks that are part of this LBA range. This is a 0s based value.
     */
    NLB : Int64

    /**
     * A Global Unique Identifier (GUID) that uniquely specifies the type of this LBA range. Well known Types may be defined and are published on the [NVM Express website](https://nvmexpress.org/).
     */
    GUID : Int8[16]

    Reserved1 : Int8[16]

}
