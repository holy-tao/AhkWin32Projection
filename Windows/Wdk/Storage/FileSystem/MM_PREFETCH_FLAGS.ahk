#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct MM_PREFETCH_FLAGS {
    #StructPack 4


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - Priority
         * - RepurposePriority
         * - PriorityProtection
         * - MustBeZero
         * - CannotBeUsedAsFlags
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        Priority {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }

        /**
         * @type {Integer}
         */
        RepurposePriority {
            get => (this._bitfield >> 3) & 0x7
            set => this._bitfield := ((value & 0x7) << 3) | (this._bitfield & ~(0x7 << 3))
        }

        /**
         * @type {Integer}
         */
        PriorityProtection {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }

        /**
         * @type {Integer}
         */
        MustBeZero {
            get => (this._bitfield >> 7) & 0x3
            set => this._bitfield := ((value & 0x3) << 7) | (this._bitfield & ~(0x3 << 7))
        }

        /**
         * @type {Integer}
         */
        CannotBeUsedAsFlags {
            get => (this._bitfield >> 9) & 0x7FFFFF
            set => this._bitfield := ((value & 0x7FFFFF) << 9) | (this._bitfield & ~(0x7FFFFF << 9))
        }
    }

    Flags : MM_PREFETCH_FLAGS._Flags

    static __New() {
        DefineProp(this.Prototype, 'AllFlags', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
