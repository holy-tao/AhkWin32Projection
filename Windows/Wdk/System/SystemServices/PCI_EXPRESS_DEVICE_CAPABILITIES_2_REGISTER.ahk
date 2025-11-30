#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_DEVICE_CAPABILITIES_2_REGISTER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - CompletionTimeoutRangesSupported
     * - CompletionTimeoutDisableSupported
     * - AriForwardingSupported
     * - AtomicOpRoutingSupported
     * - AtomicOpCompleterSupported32Bit
     * - AtomicOpCompleterSupported64Bit
     * - CASCompleterSupported128Bit
     * - NoROEnabledPRPRPassing
     * - LTRMechanismSupported
     * - TPHCompleterSupported
     * - Rsvd
     * - OBFFSupported
     * - ExtendedFmtFieldSuported
     * - EndEndTLPPrefixSupported
     * - MaxEndEndTLPPrefixes
     * - Rsvd2
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CompletionTimeoutRangesSupported {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    CompletionTimeoutDisableSupported {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    AriForwardingSupported {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    AtomicOpRoutingSupported {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    AtomicOpCompleterSupported32Bit {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    AtomicOpCompleterSupported64Bit {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    CASCompleterSupported128Bit {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    NoROEnabledPRPRPassing {
        get => (this._bitfield >> 10) & 0x1
        set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
    }

    /**
     * @type {Integer}
     */
    LTRMechanismSupported {
        get => (this._bitfield >> 11) & 0x1
        set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
    }

    /**
     * @type {Integer}
     */
    TPHCompleterSupported {
        get => (this._bitfield >> 12) & 0x3
        set => this._bitfield := ((value & 0x3) << 12) | (this._bitfield & ~(0x3 << 12))
    }

    /**
     * @type {Integer}
     */
    Rsvd {
        get => (this._bitfield >> 14) & 0xF
        set => this._bitfield := ((value & 0xF) << 14) | (this._bitfield & ~(0xF << 14))
    }

    /**
     * @type {Integer}
     */
    OBFFSupported {
        get => (this._bitfield >> 18) & 0x3
        set => this._bitfield := ((value & 0x3) << 18) | (this._bitfield & ~(0x3 << 18))
    }

    /**
     * @type {Integer}
     */
    ExtendedFmtFieldSuported {
        get => (this._bitfield >> 20) & 0x1
        set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
    }

    /**
     * @type {Integer}
     */
    EndEndTLPPrefixSupported {
        get => (this._bitfield >> 21) & 0x1
        set => this._bitfield := ((value & 0x1) << 21) | (this._bitfield & ~(0x1 << 21))
    }

    /**
     * @type {Integer}
     */
    MaxEndEndTLPPrefixes {
        get => (this._bitfield >> 22) & 0x3
        set => this._bitfield := ((value & 0x3) << 22) | (this._bitfield & ~(0x3 << 22))
    }

    /**
     * @type {Integer}
     */
    Rsvd2 {
        get => (this._bitfield >> 24) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
    }

    /**
     * @type {Integer}
     */
    AsULONG {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
