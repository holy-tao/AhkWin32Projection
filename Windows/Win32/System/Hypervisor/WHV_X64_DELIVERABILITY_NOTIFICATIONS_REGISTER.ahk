#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - NmiNotification
     * - InterruptNotification
     * - InterruptPriority
     * - Reserved
     * - Sint
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NmiNotification {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    InterruptNotification {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    InterruptPriority {
        get => (this._bitfield >> 2) & 0xF
        set => this._bitfield := ((value & 0xF) << 2) | (this._bitfield & ~(0xF << 2))
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => (this._bitfield >> 6) & 0x3FFFFFFFFFF
        set => this._bitfield := ((value & 0x3FFFFFFFFFF) << 6) | (this._bitfield & ~(0x3FFFFFFFFFF << 6))
    }

    /**
     * @type {Integer}
     */
    Sint {
        get => (this._bitfield >> 48) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 48) | (this._bitfield & ~(0xFFFF << 48))
    }

    /**
     * @type {Integer}
     */
    AsUINT64 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
