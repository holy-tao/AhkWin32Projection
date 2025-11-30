#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class MCI_STATUS_AMD_BITS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - McaErrorCode
     * - ModelErrorCode
     * - ImplementationSpecific2
     * - Poison
     * - Deferred
     * - ImplementationSpecific1
     * - ContextCorrupt
     * - AddressValid
     * - MiscValid
     * - ErrorEnabled
     * - UncorrectedError
     * - StatusOverFlow
     * - Valid
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
    ImplementationSpecific2 {
        get => (this._bitfield >> 32) & 0x7FF
        set => this._bitfield := ((value & 0x7FF) << 32) | (this._bitfield & ~(0x7FF << 32))
    }

    /**
     * @type {Integer}
     */
    Poison {
        get => (this._bitfield >> 43) & 0x1
        set => this._bitfield := ((value & 0x1) << 43) | (this._bitfield & ~(0x1 << 43))
    }

    /**
     * @type {Integer}
     */
    Deferred {
        get => (this._bitfield >> 44) & 0x1
        set => this._bitfield := ((value & 0x1) << 44) | (this._bitfield & ~(0x1 << 44))
    }

    /**
     * @type {Integer}
     */
    ImplementationSpecific1 {
        get => (this._bitfield >> 45) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 45) | (this._bitfield & ~(0xFFF << 45))
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
