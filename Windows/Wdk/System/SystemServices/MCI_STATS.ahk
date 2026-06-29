#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct MCI_STATS {
    #StructPack 8


    struct _MciStats {
        McaCod : UInt16

        MsCod : UInt16

        /**
         * This bitfield backs the following members:
         * - OtherInfo
         * - Damage
         * - AddressValid
         * - MiscValid
         * - Enabled
         * - UnCorrected
         * - OverFlow
         * - Valid
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        OtherInfo {
            get => (this._bitfield >> 0) & 0x1FFFFFF
            set => this._bitfield := ((value & 0x1FFFFFF) << 0) | (this._bitfield & ~(0x1FFFFFF << 0))
        }

        /**
         * @type {Integer}
         */
        Damage {
            get => (this._bitfield >> 25) & 0x1
            set => this._bitfield := ((value & 0x1) << 25) | (this._bitfield & ~(0x1 << 25))
        }

        /**
         * @type {Integer}
         */
        AddressValid {
            get => (this._bitfield >> 26) & 0x1
            set => this._bitfield := ((value & 0x1) << 26) | (this._bitfield & ~(0x1 << 26))
        }

        /**
         * @type {Integer}
         */
        MiscValid {
            get => (this._bitfield >> 27) & 0x1
            set => this._bitfield := ((value & 0x1) << 27) | (this._bitfield & ~(0x1 << 27))
        }

        /**
         * @type {Integer}
         */
        Enabled {
            get => (this._bitfield >> 28) & 0x1
            set => this._bitfield := ((value & 0x1) << 28) | (this._bitfield & ~(0x1 << 28))
        }

        /**
         * @type {Integer}
         */
        UnCorrected {
            get => (this._bitfield >> 29) & 0x1
            set => this._bitfield := ((value & 0x1) << 29) | (this._bitfield & ~(0x1 << 29))
        }

        /**
         * @type {Integer}
         */
        OverFlow {
            get => (this._bitfield >> 30) & 0x1
            set => this._bitfield := ((value & 0x1) << 30) | (this._bitfield & ~(0x1 << 30))
        }

        /**
         * @type {Integer}
         */
        Valid {
            get => (this._bitfield >> 31) & 0x1
            set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
        }
    }

    MciStats : MCI_STATS._MciStats

    static __New() {
        DefineProp(this.Prototype, 'QuadPart', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
