#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_FPB_RID_VECTOR_CONTROL1_REGISTER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - RidDecodeMechanismEnable
     * - Rsvd0
     * - RidVectorGranularity
     * - Rsvd1
     * - RidVectorStart
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    RidDecodeMechanismEnable {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Rsvd0 {
        get => (this._bitfield >> 1) & 0x7
        set => this._bitfield := ((value & 0x7) << 1) | (this._bitfield & ~(0x7 << 1))
    }

    /**
     * @type {Integer}
     */
    RidVectorGranularity {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }

    /**
     * @type {Integer}
     */
    Rsvd1 {
        get => (this._bitfield >> 8) & 0x7FF
        set => this._bitfield := ((value & 0x7FF) << 8) | (this._bitfield & ~(0x7FF << 8))
    }

    /**
     * @type {Integer}
     */
    RidVectorStart {
        get => (this._bitfield >> 19) & 0x1FFF
        set => this._bitfield := ((value & 0x1FFF) << 19) | (this._bitfield & ~(0x1FFF << 19))
    }

    /**
     * @type {Integer}
     */
    AsULONG {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
