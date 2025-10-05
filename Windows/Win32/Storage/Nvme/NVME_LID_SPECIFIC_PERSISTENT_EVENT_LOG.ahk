#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_LID_SPECIFIC_PERSISTENT_EVENT_LOG extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - EstablishContextAndRead512BytesOfHeaderSupported
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
    EstablishContextAndRead512BytesOfHeaderSupported {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => (this._bitfield >> 1) & 0x7FFF
        set => this._bitfield := ((value & 0x7FFF) << 1) | (this._bitfield & ~(0x7FFF << 1))
    }
}
