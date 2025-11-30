#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_XPF_TLB_CHECK extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * This bitfield backs the following members:
     * - TransactionTypeValid
     * - OperationValid
     * - LevelValid
     * - ProcessorContextCorruptValid
     * - UncorrectedValid
     * - PreciseIPValid
     * - RestartableIPValid
     * - OverflowValid
     * - ReservedValid
     * - TransactionType
     * - Operation
     * - Level
     * - ProcessorContextCorrupt
     * - Uncorrected
     * - PreciseIP
     * - RestartableIP
     * - Overflow
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TransactionTypeValid {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    OperationValid {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    LevelValid {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    ProcessorContextCorruptValid {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    UncorrectedValid {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    PreciseIPValid {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    RestartableIPValid {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    OverflowValid {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    ReservedValid {
        get => (this._bitfield >> 8) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
    }

    /**
     * @type {Integer}
     */
    TransactionType {
        get => (this._bitfield >> 16) & 0x3
        set => this._bitfield := ((value & 0x3) << 16) | (this._bitfield & ~(0x3 << 16))
    }

    /**
     * @type {Integer}
     */
    Operation {
        get => (this._bitfield >> 18) & 0xF
        set => this._bitfield := ((value & 0xF) << 18) | (this._bitfield & ~(0xF << 18))
    }

    /**
     * @type {Integer}
     */
    Level {
        get => (this._bitfield >> 22) & 0x7
        set => this._bitfield := ((value & 0x7) << 22) | (this._bitfield & ~(0x7 << 22))
    }

    /**
     * @type {Integer}
     */
    ProcessorContextCorrupt {
        get => (this._bitfield >> 25) & 0x1
        set => this._bitfield := ((value & 0x1) << 25) | (this._bitfield & ~(0x1 << 25))
    }

    /**
     * @type {Integer}
     */
    Uncorrected {
        get => (this._bitfield >> 26) & 0x1
        set => this._bitfield := ((value & 0x1) << 26) | (this._bitfield & ~(0x1 << 26))
    }

    /**
     * @type {Integer}
     */
    PreciseIP {
        get => (this._bitfield >> 27) & 0x1
        set => this._bitfield := ((value & 0x1) << 27) | (this._bitfield & ~(0x1 << 27))
    }

    /**
     * @type {Integer}
     */
    RestartableIP {
        get => (this._bitfield >> 28) & 0x1
        set => this._bitfield := ((value & 0x1) << 28) | (this._bitfield & ~(0x1 << 28))
    }

    /**
     * @type {Integer}
     */
    Overflow {
        get => (this._bitfield >> 29) & 0x1
        set => this._bitfield := ((value & 0x1) << 29) | (this._bitfield & ~(0x1 << 29))
    }

    /**
     * @type {Integer}
     */
    XpfTLBCheck {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
