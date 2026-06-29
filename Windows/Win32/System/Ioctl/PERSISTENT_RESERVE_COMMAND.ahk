#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct PERSISTENT_RESERVE_COMMAND {
    #StructPack 4


    struct _PR_IN {
        /**
         * This bitfield backs the following members:
         * - ServiceAction
         * - Reserved1
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        ServiceAction {
            get => (this._bitfield >> 0) & 0x1F
            set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
        }

        /**
         * @type {Integer}
         */
        Reserved1 {
            get => (this._bitfield >> 5) & 0x7
            set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
        }
        AllocationLength : UInt16

    }

    struct _PR_OUT {
        /**
         * This bitfield backs the following members:
         * - ServiceAction
         * - Reserved1
         */
        _bitfield1 : Int8


        /**
         * @type {Integer}
         */
        ServiceAction {
            get => (this._bitfield1 >> 0) & 0x1F
            set => this._bitfield1 := ((value & 0x1F) << 0) | (this._bitfield1 & ~(0x1F << 0))
        }

        /**
         * @type {Integer}
         */
        Reserved1 {
            get => (this._bitfield1 >> 5) & 0x7
            set => this._bitfield1 := ((value & 0x7) << 5) | (this._bitfield1 & ~(0x7 << 5))
        }
        /**
         * This bitfield backs the following members:
         * - Type
         * - Scope
         */
        _bitfield2 : Int8


        /**
         * @type {Integer}
         */
        Type {
            get => (this._bitfield2 >> 0) & 0xF
            set => this._bitfield2 := ((value & 0xF) << 0) | (this._bitfield2 & ~(0xF << 0))
        }

        /**
         * @type {Integer}
         */
        Scope {
            get => (this._bitfield2 >> 4) & 0xF
            set => this._bitfield2 := ((value & 0xF) << 4) | (this._bitfield2 & ~(0xF << 4))
        }
        ParameterList : Int8[1]

    }

    Version : UInt32

    Size : UInt32

    PR_IN : PERSISTENT_RESERVE_COMMAND._PR_IN

    static __New() {
        DefineProp(this.Prototype, 'PR_OUT', { type: PERSISTENT_RESERVE_COMMAND._PR_OUT, offset: 8 })
        this.DeleteProp("__New")
    }
}
