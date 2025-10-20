#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw10_security_send_receive
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW10_SECURITY_SEND_RECEIVE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - SPSP
     * - SECP
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    SPSP {
        get => (this._bitfield >> 8) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 8) | (this._bitfield & ~(0xFFFF << 8))
    }

    /**
     * @type {Integer}
     */
    SECP {
        get => (this._bitfield >> 24) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
    }

    /**
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
