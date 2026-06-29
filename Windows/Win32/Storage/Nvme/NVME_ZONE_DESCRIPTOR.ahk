#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_ZONE_DESCRIPTOR {
    #StructPack 8


    struct _ZA {
        /**
         * This bitfield backs the following members:
         * - ZFC
         * - FZR
         * - RZR
         * - Reserved
         * - ZDEV
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        ZFC {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        FZR {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        RZR {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        ZDEV {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    }

    /**
     * This bitfield backs the following members:
     * - ZT
     * - Reserved1
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    ZT {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }
    /**
     * This bitfield backs the following members:
     * - Reserved2
     * - ZS
     */
    _bitfield1 : Int8


    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield1 >> 0) & 0xF
        set => this._bitfield1 := ((value & 0xF) << 0) | (this._bitfield1 & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    ZS {
        get => (this._bitfield1 >> 4) & 0xF
        set => this._bitfield1 := ((value & 0xF) << 4) | (this._bitfield1 & ~(0xF << 4))
    }
    ZA : NVME_ZONE_DESCRIPTOR._ZA

    Reserved3 : Int8[5]

    ZCAP : Int64

    ZSLBA : Int64

    WritePointer : Int64

    Reserved4 : Int8[32]

}
