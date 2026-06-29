#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_DISCOVERY_HEADER {
    #StructPack 8


    struct _DLPF {
        /**
         * This bitfield backs the following members:
         * - Extended
         * - PortLocal
         * - AllSubsystems
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        Extended {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        PortLocal {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        AllSubsystems {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsUchar', { type: Int8, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    GENCTR : Int64

    NUMREC : Int64

    RECFMT : UInt16

    DLPF : NVME_DISCOVERY_HEADER._DLPF

    Reserved0 : Int8

    TDLPL : UInt32

    Reserved1 : Int8[1000]

}
