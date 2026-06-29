#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct NV_SEP_CACHE_PARAMETER {
    #StructPack 4


    struct _Flags {

        struct _CacheFlags {
            /**
             * This bitfield backs the following members:
             * - WriteCacheEnabled
             * - WriteCacheChangeable
             * - WriteThroughIOSupported
             * - FlushCacheSupported
             * - ReservedBits
             */
            _bitfield : Int8


            /**
             * @type {Integer}
             */
            WriteCacheEnabled {
                get => (this._bitfield >> 0) & 0x1
                set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
            }

            /**
             * @type {Integer}
             */
            WriteCacheChangeable {
                get => (this._bitfield >> 1) & 0x1
                set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
            }

            /**
             * @type {Integer}
             */
            WriteThroughIOSupported {
                get => (this._bitfield >> 2) & 0x1
                set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
            }

            /**
             * @type {Integer}
             */
            FlushCacheSupported {
                get => (this._bitfield >> 3) & 0x1
                set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
            }

            /**
             * @type {Integer}
             */
            ReservedBits {
                get => (this._bitfield >> 4) & 0xF
                set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
            }
        }

        CacheFlags : NV_SEP_CACHE_PARAMETER._Flags._CacheFlags

        static __New() {
            DefineProp(this.Prototype, 'CacheFlagsSet', { type: Int8, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Version : UInt32

    Size : UInt32

    Flags : NV_SEP_CACHE_PARAMETER._Flags

    WriteCacheType : Int8

    WriteCacheTypeEffective : Int8

    ParameterReserve1 : Int8[3]

}
