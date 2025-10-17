#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_FID_SUPPORTED_AND_EFFECTS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - FSUPP
     * - UDCC
     * - NCC
     * - NIC
     * - CCC
     * - Reserved
     * - UUIDSelectionSupported
     * - FSPNamespace
     * - FSPController
     * - FSPNVMSet
     * - FSPEnduranceGroup
     * - FSPDomain
     * - FSPNVMSubsystem
     * - FSPReserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    FSUPP {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    UDCC {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    NCC {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    NIC {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    CCC {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    UUIDSelectionSupported {
        get => (this._bitfield >> 19) & 0x1
        set => this._bitfield := ((value & 0x1) << 19) | (this._bitfield & ~(0x1 << 19))
    }

    /**
     * @type {Integer}
     */
    FSPNamespace {
        get => (this._bitfield >> 20) & 0x1
        set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
    }

    /**
     * @type {Integer}
     */
    FSPController {
        get => (this._bitfield >> 21) & 0x1
        set => this._bitfield := ((value & 0x1) << 21) | (this._bitfield & ~(0x1 << 21))
    }

    /**
     * @type {Integer}
     */
    FSPNVMSet {
        get => (this._bitfield >> 22) & 0x1
        set => this._bitfield := ((value & 0x1) << 22) | (this._bitfield & ~(0x1 << 22))
    }

    /**
     * @type {Integer}
     */
    FSPEnduranceGroup {
        get => (this._bitfield >> 23) & 0x1
        set => this._bitfield := ((value & 0x1) << 23) | (this._bitfield & ~(0x1 << 23))
    }

    /**
     * @type {Integer}
     */
    FSPDomain {
        get => (this._bitfield >> 24) & 0x1
        set => this._bitfield := ((value & 0x1) << 24) | (this._bitfield & ~(0x1 << 24))
    }

    /**
     * @type {Integer}
     */
    FSPNVMSubsystem {
        get => (this._bitfield >> 25) & 0x1
        set => this._bitfield := ((value & 0x1) << 25) | (this._bitfield & ~(0x1 << 25))
    }

    /**
     * @type {Integer}
     */
    FSPReserved {
        get => (this._bitfield >> 26) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 26) | (this._bitfield & ~(0x3F << 26))
    }
}
