#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_SLOT_CAPABILITIES_REGISTER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - AttentionButtonPresent
     * - PowerControllerPresent
     * - MRLSensorPresent
     * - AttentionIndicatorPresent
     * - PowerIndicatorPresent
     * - HotPlugSurprise
     * - HotPlugCapable
     * - SlotPowerLimit
     * - SlotPowerLimitScale
     * - ElectromechanicalLockPresent
     * - NoCommandCompletedSupport
     * - PhysicalSlotNumber
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AttentionButtonPresent {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    PowerControllerPresent {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    MRLSensorPresent {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    AttentionIndicatorPresent {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    PowerIndicatorPresent {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    HotPlugSurprise {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    HotPlugCapable {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    SlotPowerLimit {
        get => (this._bitfield >> 7) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 7) | (this._bitfield & ~(0xFF << 7))
    }

    /**
     * @type {Integer}
     */
    SlotPowerLimitScale {
        get => (this._bitfield >> 15) & 0x3
        set => this._bitfield := ((value & 0x3) << 15) | (this._bitfield & ~(0x3 << 15))
    }

    /**
     * @type {Integer}
     */
    ElectromechanicalLockPresent {
        get => (this._bitfield >> 17) & 0x1
        set => this._bitfield := ((value & 0x1) << 17) | (this._bitfield & ~(0x1 << 17))
    }

    /**
     * @type {Integer}
     */
    NoCommandCompletedSupport {
        get => (this._bitfield >> 18) & 0x1
        set => this._bitfield := ((value & 0x1) << 18) | (this._bitfield & ~(0x1 << 18))
    }

    /**
     * @type {Integer}
     */
    PhysicalSlotNumber {
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
