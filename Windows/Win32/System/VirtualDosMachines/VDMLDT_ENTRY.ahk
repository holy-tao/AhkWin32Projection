#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 * @architecture X64, Arm64
 */
export default struct VDMLDT_ENTRY {
    #StructPack 4


    struct _HighWord {

        struct _Bytes {
            BaseMid : Int8

            Flags1 : Int8

            Flags2 : Int8

            BaseHi : Int8

        }

        struct _Bits {
            /**
             * This bitfield backs the following members:
             * - BaseMid
             * - Type
             * - Dpl
             * - Pres
             * - LimitHi
             * - Sys
             * - Reserved_0
             * - Default_Big
             * - Granularity
             * - BaseHi
             */
            _bitfield : Int32


            /**
             * @type {Integer}
             */
            BaseMid {
                get => (this._bitfield >> 0) & 0xFF
                set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
            }

            /**
             * @type {Integer}
             */
            Type {
                get => (this._bitfield >> 8) & 0x1F
                set => this._bitfield := ((value & 0x1F) << 8) | (this._bitfield & ~(0x1F << 8))
            }

            /**
             * @type {Integer}
             */
            Dpl {
                get => (this._bitfield >> 13) & 0x3
                set => this._bitfield := ((value & 0x3) << 13) | (this._bitfield & ~(0x3 << 13))
            }

            /**
             * @type {Integer}
             */
            Pres {
                get => (this._bitfield >> 15) & 0x1
                set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
            }

            /**
             * @type {Integer}
             */
            LimitHi {
                get => (this._bitfield >> 16) & 0xF
                set => this._bitfield := ((value & 0xF) << 16) | (this._bitfield & ~(0xF << 16))
            }

            /**
             * @type {Integer}
             */
            Sys {
                get => (this._bitfield >> 20) & 0x1
                set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
            }

            /**
             * @type {Integer}
             */
            Reserved_0 {
                get => (this._bitfield >> 21) & 0x1
                set => this._bitfield := ((value & 0x1) << 21) | (this._bitfield & ~(0x1 << 21))
            }

            /**
             * @type {Integer}
             */
            Default_Big {
                get => (this._bitfield >> 22) & 0x1
                set => this._bitfield := ((value & 0x1) << 22) | (this._bitfield & ~(0x1 << 22))
            }

            /**
             * @type {Integer}
             */
            Granularity {
                get => (this._bitfield >> 23) & 0x1
                set => this._bitfield := ((value & 0x1) << 23) | (this._bitfield & ~(0x1 << 23))
            }

            /**
             * @type {Integer}
             */
            BaseHi {
                get => (this._bitfield >> 24) & 0xFF
                set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
            }
        }

        Bytes : VDMLDT_ENTRY._HighWord._Bytes

        static __New() {
            DefineProp(this.Prototype, 'Bits', { type: VDMLDT_ENTRY._HighWord._Bits, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    LimitLow : UInt16

    BaseLow : UInt16

    HighWord : VDMLDT_ENTRY._HighWord

}
