#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This data structure provides the status of process policies that are related to the mitigation of side channels. This can include side channel attacks involving speculative execution and page combining.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_side_channel_isolation_policy
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct PROCESS_MITIGATION_SIDE_CHANNEL_ISOLATION_POLICY {
    #StructPack 4

    Flags : UInt32


    /**
     * @type {Integer}
     */
    SmtBranchTargetIsolation {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    IsolateSecurityDomain {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    DisablePageCombine {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    SpeculativeStoreBypassDisable {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    RestrictCoreSharing {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    ReservedFlags {
        get => (this._bitfield >> 5) & 0x7FFFFFF
        set => this._bitfield := ((value & 0x7FFFFFF) << 5) | (this._bitfield & ~(0x7FFFFFF << 5))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 0 })
        this.DeleteProp("__New")
    }
}
