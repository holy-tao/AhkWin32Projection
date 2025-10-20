#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_command_status
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_COMMAND_STATUS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - P
     * - SC
     * - SCT
     * - CRD
     * - M
     * - DNR
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    P {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    SC {
        get => (this._bitfield >> 1) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 1) | (this._bitfield & ~(0xFF << 1))
    }

    /**
     * @type {Integer}
     */
    SCT {
        get => (this._bitfield >> 9) & 0x7
        set => this._bitfield := ((value & 0x7) << 9) | (this._bitfield & ~(0x7 << 9))
    }

    /**
     * @type {Integer}
     */
    CRD {
        get => (this._bitfield >> 12) & 0x3
        set => this._bitfield := ((value & 0x3) << 12) | (this._bitfield & ~(0x3 << 12))
    }

    /**
     * @type {Integer}
     */
    M {
        get => (this._bitfield >> 14) & 0x1
        set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
    }

    /**
     * @type {Integer}
     */
    DNR {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * @type {Integer}
     */
    AsUshort {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }
}
