#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Kernel
 * @architecture X64
 */
export default struct SLIST_HEADER {
    #StructPack 8


    struct _HeaderX64 {
        /**
         * This bitfield backs the following members:
         * - Depth
         * - Sequence
         */
        _bitfield1 : Int64


        /**
         * @type {Integer}
         */
        Depth {
            get => (this._bitfield1 >> 0) & 0xFFFF
            set => this._bitfield1 := ((value & 0xFFFF) << 0) | (this._bitfield1 & ~(0xFFFF << 0))
        }

        /**
         * @type {Integer}
         */
        Sequence {
            get => (this._bitfield1 >> 16) & 0xFFFFFFFFFFFF
            set => this._bitfield1 := ((value & 0xFFFFFFFFFFFF) << 16) | (this._bitfield1 & ~(0xFFFFFFFFFFFF << 16))
        }
        /**
         * This bitfield backs the following members:
         * - Reserved
         * - NextEntry
         */
        _bitfield2 : Int64


        /**
         * @type {Integer}
         */
        NextEntry {
            get => (this._bitfield2 >> 4) & 0xFFFFFFFFFFFFFFF
            set => this._bitfield2 := ((value & 0xFFFFFFFFFFFFFFF) << 4) | (this._bitfield2 & ~(0xFFFFFFFFFFFFFFF << 4))
        }
    }

    Alignment : Int64

    Region : Int64

    static __New() {
        DefineProp(this.Prototype, 'HeaderX64', { type: SLIST_HEADER._HeaderX64, offset: 0 })
        this.DeleteProp("__New")
    }
}
