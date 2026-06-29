#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_SEGMENT_INFORMATION {
    #StructPack 8


    struct _PowerFlags {
        /**
         * This bitfield backs the following members:
         * - PreservedDuringStandby
         * - PreservedDuringHibernate
         * - PartiallyPreservedDuringHibernate
         * - Reserved
         */
        _bitfield : Int64


        /**
         * @type {Integer}
         */
        PreservedDuringStandby {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        PreservedDuringHibernate {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        PartiallyPreservedDuringHibernate {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    }

    struct _SegmentProperties {
        /**
         * This bitfield backs the following members:
         * - SystemMemory
         * - PopulatedByReservedDDRByFirmware
         * - SegmentType
         * - Reserved
         */
        _bitfield : Int64


        /**
         * @type {Integer}
         */
        SystemMemory {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        PopulatedByReservedDDRByFirmware {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        SegmentType {
            get => (this._bitfield >> 2) & 0xF
            set => this._bitfield := ((value & 0xF) << 2) | (this._bitfield & ~(0xF << 2))
        }
    }

    CommitLimit : Int64

    BytesCommitted : Int64

    BytesResident : Int64

    Memory : IntPtr

    Aperture : UInt32

    TotalBytesEvictedByPriority : Int64[5]

    SystemMemoryEndAddress : Int64

    PowerFlags : D3DKMT_QUERYSTATISTICS_SEGMENT_INFORMATION._PowerFlags

    SegmentProperties : D3DKMT_QUERYSTATISTICS_SEGMENT_INFORMATION._SegmentProperties

    Reserved : Int64[5]

}
