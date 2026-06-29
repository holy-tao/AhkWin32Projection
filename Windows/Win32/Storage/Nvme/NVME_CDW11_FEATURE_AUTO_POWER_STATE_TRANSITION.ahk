#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the Autonomous Power State Transition Feature that configures the settings for autonomous power state transitions.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_feature_auto_power_state_transition
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - APSTE
     * - Reserved0
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    APSTE {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 1) & 0x7FFFFFFF
        set => this._bitfield := ((value & 0x7FFFFFFF) << 1) | (this._bitfield & ~(0x7FFFFFFF << 1))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
