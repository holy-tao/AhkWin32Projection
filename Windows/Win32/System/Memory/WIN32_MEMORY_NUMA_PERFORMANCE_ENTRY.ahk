#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Memory
 */
export default struct WIN32_MEMORY_NUMA_PERFORMANCE_ENTRY {
    #StructPack 8


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - MinTransferSizeToAchieveValues
         * - NonSequentialTransfers
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        MinTransferSizeToAchieveValues {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        NonSequentialTransfers {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    }

    InitiatorNodeNumber : UInt32

    TargetNodeNumber : UInt32

    DataType : Int8

    Flags : WIN32_MEMORY_NUMA_PERFORMANCE_ENTRY._Flags

    MinTransferSizeInBytes : Int64

    EntryValue : Int64

}
