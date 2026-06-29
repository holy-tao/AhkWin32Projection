#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to impose restrictions on what system calls can be invoked by a process.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_system_call_disable_policy
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct PROCESS_MITIGATION_SYSTEM_CALL_DISABLE_POLICY {
    #StructPack 4

    Flags : UInt32


    /**
     * @type {Integer}
     */
    DisallowWin32kSystemCalls {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    AuditDisallowWin32kSystemCalls {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    DisallowFsctlSystemCalls {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    AuditDisallowFsctlSystemCalls {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    ReservedFlags {
        get => (this._bitfield >> 4) & 0xFFFFFFF
        set => this._bitfield := ((value & 0xFFFFFFF) << 4) | (this._bitfield & ~(0xFFFFFFF << 4))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 0 })
        this.DeleteProp("__New")
    }
}
