#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_SANITIZE_STATUS extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - MostRecentSanitizeOperationStatus
     * - NumberCompletedPassesOfOverwrite
     * - GlobalDataErased
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MostRecentSanitizeOperationStatus {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    NumberCompletedPassesOfOverwrite {
        get => (this._bitfield >> 3) & 0xF
        set => this._bitfield := ((value & 0xF) << 3) | (this._bitfield & ~(0xF << 3))
    }

    /**
     * @type {Integer}
     */
    GlobalDataErased {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }
}
