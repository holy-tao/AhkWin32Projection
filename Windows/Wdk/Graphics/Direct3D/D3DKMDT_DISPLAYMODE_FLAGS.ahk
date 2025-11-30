#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_DISPLAYMODE_FLAGS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - ValidatedAgainstMonitorCaps
     * - RoundedFakeMode
     * - Anonymous
     * - ModePruningReason
     * - Stereo
     * - AdvancedScanCapable
     * - PreferredTiming
     * - PhysicalModeSupported
     * - VirtualRefreshRate
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ValidatedAgainstMonitorCaps {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    RoundedFakeMode {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => (this._bitfield1 >> 2) & 0x0
        set => this._bitfield1 := ((value & 0x0) << 2) | (this._bitfield1 & ~(0x0 << 2))
    }

    /**
     * @type {Integer}
     */
    ModePruningReason {
        get => (this._bitfield1 >> 2) & 0xF
        set => this._bitfield1 := ((value & 0xF) << 2) | (this._bitfield1 & ~(0xF << 2))
    }

    /**
     * @type {Integer}
     */
    Stereo {
        get => (this._bitfield1 >> 6) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 6) | (this._bitfield1 & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    AdvancedScanCapable {
        get => (this._bitfield1 >> 7) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 7) | (this._bitfield1 & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    PreferredTiming {
        get => (this._bitfield1 >> 8) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 8) | (this._bitfield1 & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    PhysicalModeSupported {
        get => (this._bitfield1 >> 9) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 9) | (this._bitfield1 & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    VirtualRefreshRate {
        get => (this._bitfield1 >> 10) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 10) | (this._bitfield1 & ~(0x1 << 10))
    }

    /**
     * This bitfield backs the following members:
     * - Reserved
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
