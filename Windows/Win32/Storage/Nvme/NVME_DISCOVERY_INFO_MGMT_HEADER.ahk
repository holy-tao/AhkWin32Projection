#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_DISCOVERY_INFO_MGMT_HEADER {
    #StructPack 8


    struct _EKTYPE {
        /**
         * This bitfield backs the following members:
         * - NQN
         * - TSAS
         * - TRSVCID
         * - ADRFAM
         * - TRTYPE
         * - PORTID
         * - TRADDR
         * - Reserved
         */
        _bitfield : Int16


        /**
         * @type {Integer}
         */
        NQN {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        TSAS {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        TRSVCID {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        ADRFAM {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        TRTYPE {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        PORTID {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }

        /**
         * @type {Integer}
         */
        TRADDR {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsUshort', { type: UInt16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    TDL : UInt32

    Reserved0 : UInt32

    NUMENT : Int64

    ENTFMT : UInt16

    ETYPE : UInt16

    PORTLCL : Int8

    Reserved1 : Int8

    EKTYPE : NVME_DISCOVERY_INFO_MGMT_HEADER._EKTYPE

    EID : Int8[256]

    ENAME : Int8[256]

    EVER : Int8[64]

    Reserved2 : Int8[424]

}
