#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_X64_VP_EXECUTION_STATE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - Cpl
     * - Cr0Pe
     * - Cr0Am
     * - EferLma
     * - DebugActive
     * - InterruptionPending
     * - Reserved0
     * - InterruptShadow
     * - Reserved1
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Cpl {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    Cr0Pe {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    Cr0Am {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    EferLma {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    DebugActive {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    InterruptionPending {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 7) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 7) | (this._bitfield & ~(0x1F << 7))
    }

    /**
     * @type {Integer}
     */
    InterruptShadow {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 13) & 0x7
        set => this._bitfield := ((value & 0x7) << 13) | (this._bitfield & ~(0x7 << 13))
    }

    /**
     * @type {Integer}
     */
    AsUINT16 {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }
}
