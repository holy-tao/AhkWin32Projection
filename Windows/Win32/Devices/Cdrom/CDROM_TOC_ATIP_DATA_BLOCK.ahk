#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_TOC_ATIP_DATA_BLOCK {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - CdrwReferenceSpeed
     * - Reserved3
     * - WritePower
     * - True1
     */
    _bitfield1 : Int8


    /**
     * @type {Integer}
     */
    CdrwReferenceSpeed {
        get => (this._bitfield1 >> 0) & 0x7
        set => this._bitfield1 := ((value & 0x7) << 0) | (this._bitfield1 & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved3 {
        get => (this._bitfield1 >> 3) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 3) | (this._bitfield1 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    WritePower {
        get => (this._bitfield1 >> 4) & 0x7
        set => this._bitfield1 := ((value & 0x7) << 4) | (this._bitfield1 & ~(0x7 << 4))
    }

    /**
     * @type {Integer}
     */
    True1 {
        get => (this._bitfield1 >> 7) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 7) | (this._bitfield1 & ~(0x1 << 7))
    }
    /**
     * This bitfield backs the following members:
     * - Reserved4
     * - UnrestrictedUse
     * - Reserved5
     */
    _bitfield2 : Int8


    /**
     * @type {Integer}
     */
    Reserved4 {
        get => (this._bitfield2 >> 0) & 0x3F
        set => this._bitfield2 := ((value & 0x3F) << 0) | (this._bitfield2 & ~(0x3F << 0))
    }

    /**
     * @type {Integer}
     */
    UnrestrictedUse {
        get => (this._bitfield2 >> 6) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 6) | (this._bitfield2 & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    Reserved5 {
        get => (this._bitfield2 >> 7) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 7) | (this._bitfield2 & ~(0x1 << 7))
    }
    /**
     * This bitfield backs the following members:
     * - A3Valid
     * - A2Valid
     * - A1Valid
     * - DiscSubType
     * - IsCdrw
     * - True2
     */
    _bitfield3 : Int8


    /**
     * @type {Integer}
     */
    A3Valid {
        get => (this._bitfield3 >> 0) & 0x1
        set => this._bitfield3 := ((value & 0x1) << 0) | (this._bitfield3 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    A2Valid {
        get => (this._bitfield3 >> 1) & 0x1
        set => this._bitfield3 := ((value & 0x1) << 1) | (this._bitfield3 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    A1Valid {
        get => (this._bitfield3 >> 2) & 0x1
        set => this._bitfield3 := ((value & 0x1) << 2) | (this._bitfield3 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    DiscSubType {
        get => (this._bitfield3 >> 3) & 0x7
        set => this._bitfield3 := ((value & 0x7) << 3) | (this._bitfield3 & ~(0x7 << 3))
    }

    /**
     * @type {Integer}
     */
    IsCdrw {
        get => (this._bitfield3 >> 6) & 0x1
        set => this._bitfield3 := ((value & 0x1) << 6) | (this._bitfield3 & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    True2 {
        get => (this._bitfield3 >> 7) & 0x1
        set => this._bitfield3 := ((value & 0x1) << 7) | (this._bitfield3 & ~(0x1 << 7))
    }
    Reserved7 : Int8

    LeadInMsf : Int8[3]

    Reserved8 : Int8

    LeadOutMsf : Int8[3]

    Reserved9 : Int8

    A1Values : Int8[3]

    Reserved10 : Int8

    A2Values : Int8[3]

    Reserved11 : Int8

    A3Values : Int8[3]

    Reserved12 : Int8

}
