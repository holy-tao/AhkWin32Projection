#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVCACHE_PRIORITY_LEVEL_DESCRIPTOR.ahk" { NVCACHE_PRIORITY_LEVEL_DESCRIPTOR }
#Import ".\NVCACHE_STATUS.ahk" { NVCACHE_STATUS }
#Import ".\NVCACHE_TYPE.ahk" { NVCACHE_TYPE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct HYBRID_INFORMATION {
    #StructPack 8


    struct _Attributes {
        /**
         * This bitfield backs the following members:
         * - WriteCacheChangeable
         * - WriteThroughIoSupported
         * - FlushCacheSupported
         * - Removable
         * - ReservedBits
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        WriteCacheChangeable {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        WriteThroughIoSupported {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        FlushCacheSupported {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        Removable {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        ReservedBits {
            get => (this._bitfield >> 4) & 0xFFFFFFF
            set => this._bitfield := ((value & 0xFFFFFFF) << 4) | (this._bitfield & ~(0xFFFFFFF << 4))
        }
    }

    struct _Priorities {

        struct _SupportedCommands {
            /**
             * This bitfield backs the following members:
             * - CacheDisable
             * - SetDirtyThreshold
             * - PriorityDemoteBySize
             * - PriorityChangeByLbaRange
             * - Evict
             * - ReservedBits
             */
            _bitfield : Int32


            /**
             * @type {Integer}
             */
            CacheDisable {
                get => (this._bitfield >> 0) & 0x1
                set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
            }

            /**
             * @type {Integer}
             */
            SetDirtyThreshold {
                get => (this._bitfield >> 1) & 0x1
                set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
            }

            /**
             * @type {Integer}
             */
            PriorityDemoteBySize {
                get => (this._bitfield >> 2) & 0x1
                set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
            }

            /**
             * @type {Integer}
             */
            PriorityChangeByLbaRange {
                get => (this._bitfield >> 3) & 0x1
                set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
            }

            /**
             * @type {Integer}
             */
            Evict {
                get => (this._bitfield >> 4) & 0x1
                set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
            }

            /**
             * @type {Integer}
             */
            ReservedBits {
                get => (this._bitfield >> 5) & 0x7FFFFFF
                set => this._bitfield := ((value & 0x7FFFFFF) << 5) | (this._bitfield & ~(0x7FFFFFF << 5))
            }
            MaxEvictCommands : UInt32

            MaxLbaRangeCountForEvict : UInt32

            MaxLbaRangeCountForChangeLba : UInt32

        }

        PriorityLevelCount : Int8

        MaxPriorityBehavior : BOOLEAN

        OptimalWriteGranularity : Int8

        Reserved : Int8

        DirtyThresholdLow : UInt32

        DirtyThresholdHigh : UInt32

        SupportedCommands : HYBRID_INFORMATION._Priorities._SupportedCommands

        Priority : NVCACHE_PRIORITY_LEVEL_DESCRIPTOR[1]

    }

    Version : UInt32

    Size : UInt32

    HybridSupported : BOOLEAN

    Status : NVCACHE_STATUS

    CacheTypeEffective : NVCACHE_TYPE

    CacheTypeDefault : NVCACHE_TYPE

    FractionBase : UInt32

    CacheSize : Int64

    Attributes : HYBRID_INFORMATION._Attributes

    Priorities : HYBRID_INFORMATION._Priorities

}
