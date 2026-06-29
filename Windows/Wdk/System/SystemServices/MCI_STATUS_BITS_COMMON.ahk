#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct MCI_STATUS_BITS_COMMON {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - McaErrorCode
     * - ModelErrorCode
     * - Reserved
     * - ContextCorrupt
     * - AddressValid
     * - MiscValid
     * - ErrorEnabled
     * - UncorrectedError
     * - StatusOverFlow
     * - Valid
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    McaErrorCode {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    ModelErrorCode {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }

    /**
     * @type {Integer}
     */
    ContextCorrupt {
        get => (this._bitfield >> 57) & 0x1
        set => this._bitfield := ((value & 0x1) << 57) | (this._bitfield & ~(0x1 << 57))
    }

    /**
     * @type {Integer}
     */
    AddressValid {
        get => (this._bitfield >> 58) & 0x1
        set => this._bitfield := ((value & 0x1) << 58) | (this._bitfield & ~(0x1 << 58))
    }

    /**
     * @type {Integer}
     */
    MiscValid {
        get => (this._bitfield >> 59) & 0x1
        set => this._bitfield := ((value & 0x1) << 59) | (this._bitfield & ~(0x1 << 59))
    }

    /**
     * @type {Integer}
     */
    ErrorEnabled {
        get => (this._bitfield >> 60) & 0x1
        set => this._bitfield := ((value & 0x1) << 60) | (this._bitfield & ~(0x1 << 60))
    }

    /**
     * @type {Integer}
     */
    UncorrectedError {
        get => (this._bitfield >> 61) & 0x1
        set => this._bitfield := ((value & 0x1) << 61) | (this._bitfield & ~(0x1 << 61))
    }

    /**
     * @type {Integer}
     */
    StatusOverFlow {
        get => (this._bitfield >> 62) & 0x1
        set => this._bitfield := ((value & 0x1) << 62) | (this._bitfield & ~(0x1 << 62))
    }

    /**
     * @type {Integer}
     */
    Valid {
        get => (this._bitfield >> 63) & 0x1
        set => this._bitfield := ((value & 0x1) << 63) | (this._bitfield & ~(0x1 << 63))
    }
}
