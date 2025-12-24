#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_ERROR_SOURCE_ID extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - CorrectableSourceIdFun
     * - CorrectableSourceIdDev
     * - CorrectableSourceIdBus
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CorrectableSourceIdFun {
        get => (this._bitfield1 >> 0) & 0x7
        set => this._bitfield1 := ((value & 0x7) << 0) | (this._bitfield1 & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    CorrectableSourceIdDev {
        get => (this._bitfield1 >> 3) & 0x1F
        set => this._bitfield1 := ((value & 0x1F) << 3) | (this._bitfield1 & ~(0x1F << 3))
    }

    /**
     * @type {Integer}
     */
    CorrectableSourceIdBus {
        get => (this._bitfield1 >> 8) & 0xFF
        set => this._bitfield1 := ((value & 0xFF) << 8) | (this._bitfield1 & ~(0xFF << 8))
    }

    /**
     * This bitfield backs the following members:
     * - UncorrectableSourceIdFun
     * - UncorrectableSourceIdDev
     * - UncorrectableSourceIdBus
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    UncorrectableSourceIdFun {
        get => (this._bitfield2 >> 0) & 0x7
        set => this._bitfield2 := ((value & 0x7) << 0) | (this._bitfield2 & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    UncorrectableSourceIdDev {
        get => (this._bitfield2 >> 3) & 0x1F
        set => this._bitfield2 := ((value & 0x1F) << 3) | (this._bitfield2 & ~(0x1F << 3))
    }

    /**
     * @type {Integer}
     */
    UncorrectableSourceIdBus {
        get => (this._bitfield2 >> 8) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 8) | (this._bitfield2 & ~(0xFF << 8))
    }

    /**
     * @type {Integer}
     */
    AsULONG {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
