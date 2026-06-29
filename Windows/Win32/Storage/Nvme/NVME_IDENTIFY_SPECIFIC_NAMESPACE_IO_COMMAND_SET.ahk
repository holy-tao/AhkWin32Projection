#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_LBA_ZONE_FORMAT.ahk" { NVME_LBA_ZONE_FORMAT }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_IDENTIFY_SPECIFIC_NAMESPACE_IO_COMMAND_SET {
    #StructPack 8


    struct _ZOC {
        /**
         * This bitfield backs the following members:
         * - VariableZoneCapacity
         * - ZoneExcursions
         * - Reserved
         */
        _bitfield : Int16


        /**
         * @type {Integer}
         */
        VariableZoneCapacity {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        ZoneExcursions {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    }

    struct _OZCS {
        /**
         * This bitfield backs the following members:
         * - ReadAcrossZoneBoundaries
         * - Reserved
         */
        _bitfield : Int16


        /**
         * @type {Integer}
         */
        ReadAcrossZoneBoundaries {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    ZOC : NVME_IDENTIFY_SPECIFIC_NAMESPACE_IO_COMMAND_SET._ZOC

    OZCS : NVME_IDENTIFY_SPECIFIC_NAMESPACE_IO_COMMAND_SET._OZCS

    MAR : UInt32

    MOR : UInt32

    RRL : UInt32

    FRL : UInt32

    Reserved0 : Int8[2796]

    LBAEF : NVME_LBA_ZONE_FORMAT[16]

    Reserved1 : Int8[768]

    VS : Int8[256]

}
