#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a 64 bit entry specifying information about idle time and power state transition for each of the allowable 32 power states.
 * @remarks
 * This structure is used in the Autonomous Power State Transition Enable (**APSTE**) parameter of the [NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION](ns-nvme-nvme_cdw11_feature_auto_power_state_transition.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_auto_power_state_transition_entry
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_AUTO_POWER_STATE_TRANSITION_ENTRY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - IdleTransitionPowerState
     * - IdleTimePriorToTransition
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Bits 0-2 are reserved.
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * Idle Transition Power State (ITPS) specified in Bits 3-7 is the non-operational power state for the controller to autonomously transition to after there is a continuous period of idle time in the current power state that exceeds the time specified in the **IdleTimePriorToTransition** field.
     * @type {Integer}
     */
    IdleTransitionPowerState {
        get => (this._bitfield >> 3) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 3) | (this._bitfield & ~(0x1F << 3))
    }

    /**
     * Idle Time Prior to Transition (ITPT) specified in Bits 8-31 is the amount of idle time that occurs in this power state prior to transitioning to the Idle Transition Power State. The time is specified in milliseconds. A value of 0h disables the autonomous power state transition feature for this power state.
     * @type {Integer}
     */
    IdleTimePriorToTransition {
        get => (this._bitfield >> 8) & 0xFFFFFF
        set => this._bitfield := ((value & 0xFFFFFF) << 8) | (this._bitfield & ~(0xFFFFFF << 8))
    }

    /**
     * Bits 32-63 are reserved.
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
