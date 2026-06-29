#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a 64 bit entry specifying information about idle time and power state transition for each of the allowable 32 power states.
 * @remarks
 * This structure is used in the Autonomous Power State Transition Enable (**APSTE**) parameter of the [NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION](ns-nvme-nvme_cdw11_feature_auto_power_state_transition.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_auto_power_state_transition_entry
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_AUTO_POWER_STATE_TRANSITION_ENTRY {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - IdleTransitionPowerState
     * - IdleTimePriorToTransition
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    IdleTransitionPowerState {
        get => (this._bitfield >> 3) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 3) | (this._bitfield & ~(0x1F << 3))
    }

    /**
     * @type {Integer}
     */
    IdleTimePriorToTransition {
        get => (this._bitfield >> 8) & 0xFFFFFF
        set => this._bitfield := ((value & 0xFFFFFF) << 8) | (this._bitfield & ~(0xFFFFFF << 8))
    }
    /**
     * Bits 32-63 are reserved.
     */
    Reserved1 : UInt32

}
