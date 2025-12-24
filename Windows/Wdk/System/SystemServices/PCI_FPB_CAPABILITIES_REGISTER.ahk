#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_FPB_CAPABILITIES_REGISTER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - RidDecodeMechanismSupported
     * - MemLowDecodeMechanismSupported
     * - MemHighDecodeMechanismSupported
     * - NumSecDev
     * - RidVectorSizeSupported
     * - Rsvd0
     * - MemLowVectorSizeSupported
     * - Rsvd1
     * - MemHighVectorSizeSupported
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
    RidDecodeMechanismSupported {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    MemLowDecodeMechanismSupported {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    MemHighDecodeMechanismSupported {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    NumSecDev {
        get => (this._bitfield >> 3) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 3) | (this._bitfield & ~(0x1F << 3))
    }

    /**
     * @type {Integer}
     */
    RidVectorSizeSupported {
        get => (this._bitfield >> 8) & 0x7
        set => this._bitfield := ((value & 0x7) << 8) | (this._bitfield & ~(0x7 << 8))
    }

    /**
     * @type {Integer}
     */
    Rsvd0 {
        get => (this._bitfield >> 11) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 11) | (this._bitfield & ~(0x1F << 11))
    }

    /**
     * @type {Integer}
     */
    MemLowVectorSizeSupported {
        get => (this._bitfield >> 16) & 0x7
        set => this._bitfield := ((value & 0x7) << 16) | (this._bitfield & ~(0x7 << 16))
    }

    /**
     * @type {Integer}
     */
    Rsvd1 {
        get => (this._bitfield >> 19) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 19) | (this._bitfield & ~(0x1F << 19))
    }

    /**
     * @type {Integer}
     */
    MemHighVectorSizeSupported {
        get => (this._bitfield >> 24) & 0x7
        set => this._bitfield := ((value & 0x7) << 24) | (this._bitfield & ~(0x7 << 24))
    }

    /**
     * @type {Integer}
     */
    Rsvd2 {
        get => (this._bitfield >> 27) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 27) | (this._bitfield & ~(0x1F << 27))
    }

    /**
     * @type {Integer}
     */
    AsULONG {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
