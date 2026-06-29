#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct PROCESSOR_PERFSTATE_POLICY {
    #StructPack 4


    struct _Flags {
        AsBYTE : Int8


        /**
         * @type {Integer}
         */
        NoDomainAccounting {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        IncreasePolicy {
            get => (this._bitfield >> 1) & 0x3
            set => this._bitfield := ((value & 0x3) << 1) | (this._bitfield & ~(0x3 << 1))
        }

        /**
         * @type {Integer}
         */
        DecreasePolicy {
            get => (this._bitfield >> 3) & 0x3
            set => this._bitfield := ((value & 0x3) << 3) | (this._bitfield & ~(0x3 << 3))
        }
        static __New() {
            DefineProp(this.Prototype, '_bitfield', { type: Int8, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Revision : UInt32

    MaxThrottle : Int8

    MinThrottle : Int8

    BusyAdjThreshold : Int8

    Spare : Int8

    TimeCheck : UInt32

    IncreaseTime : UInt32

    DecreaseTime : UInt32

    IncreasePercent : UInt32

    DecreasePercent : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Flags', { type: PROCESSOR_PERFSTATE_POLICY._Flags, offset: 7 })
        this.DeleteProp("__New")
    }
}
