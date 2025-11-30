#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class MCI_STATUS_INTEL_BITS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - McaErrorCode
     * - ModelErrorCode
     * - OtherInfo
     * - FirmwareUpdateError
     * - CorrectedErrorCount
     * - ThresholdErrorStatus
     * - ActionRequired
     * - Signalling
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
    OtherInfo {
        get => (this._bitfield >> 32) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 32) | (this._bitfield & ~(0x1F << 32))
    }

    /**
     * @type {Integer}
     */
    FirmwareUpdateError {
        get => (this._bitfield >> 37) & 0x1
        set => this._bitfield := ((value & 0x1) << 37) | (this._bitfield & ~(0x1 << 37))
    }

    /**
     * @type {Integer}
     */
    CorrectedErrorCount {
        get => (this._bitfield >> 38) & 0x7FFF
        set => this._bitfield := ((value & 0x7FFF) << 38) | (this._bitfield & ~(0x7FFF << 38))
    }

    /**
     * @type {Integer}
     */
    ThresholdErrorStatus {
        get => (this._bitfield >> 53) & 0x3
        set => this._bitfield := ((value & 0x3) << 53) | (this._bitfield & ~(0x3 << 53))
    }

    /**
     * @type {Integer}
     */
    ActionRequired {
        get => (this._bitfield >> 55) & 0x1
        set => this._bitfield := ((value & 0x1) << 55) | (this._bitfield & ~(0x1 << 55))
    }

    /**
     * @type {Integer}
     */
    Signalling {
        get => (this._bitfield >> 56) & 0x1
        set => this._bitfield := ((value & 0x1) << 56) | (this._bitfield & ~(0x1 << 56))
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
