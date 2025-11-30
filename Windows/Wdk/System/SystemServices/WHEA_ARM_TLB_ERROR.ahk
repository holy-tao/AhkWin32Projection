#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_ARM_TLB_ERROR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<WHEA_ARM_TLB_ERROR_VALID_BITS>}
     */
    ValidationBit {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - TransactionType
     * - Operation
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    TransactionType {
        get => (this._bitfield1 >> 0) & 0x3
        set => this._bitfield1 := ((value & 0x3) << 0) | (this._bitfield1 & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    Operation {
        get => (this._bitfield1 >> 2) & 0xF
        set => this._bitfield1 := ((value & 0xF) << 2) | (this._bitfield1 & ~(0xF << 2))
    }

    /**
     * This bitfield backs the following members:
     * - Level
     * - ProcessorContextCorrupt
     * - Corrected
     * - PrecisePC
     * - RestartablePC
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    Level {
        get => (this._bitfield2 >> 0) & 0x7
        set => this._bitfield2 := ((value & 0x7) << 0) | (this._bitfield2 & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    ProcessorContextCorrupt {
        get => (this._bitfield2 >> 3) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 3) | (this._bitfield2 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    Corrected {
        get => (this._bitfield2 >> 4) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 4) | (this._bitfield2 & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    PrecisePC {
        get => (this._bitfield2 >> 5) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 5) | (this._bitfield2 & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    RestartablePC {
        get => (this._bitfield2 >> 6) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 6) | (this._bitfield2 & ~(0x1 << 6))
    }

    /**
     * This bitfield backs the following members:
     * - Reserved
     * @type {Integer}
     */
    _bitfield3 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
