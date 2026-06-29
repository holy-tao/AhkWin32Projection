#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains process mitigation policy settings for the ???.
 * @remarks
 * The [GetProcessMitigationPolicy](../processthreadsapi/nf-processthreadsapi-getprocessmitigationpolicy.md)  and [SetProcessMitigationPolicy](../processthreadsapi/nf-processthreadsapi-setprocessmitigationpolicy.md)  functions use this structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-process-mitigation-redirection-trust-policy
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct PROCESS_MITIGATION_REDIRECTION_TRUST_POLICY {
    #StructPack 4

    Flags : UInt32


    /**
     * @type {Integer}
     */
    EnforceRedirectionTrust {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    AuditRedirectionTrust {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    ReservedFlags {
        get => (this._bitfield >> 2) & 0x3FFFFFFF
        set => this._bitfield := ((value & 0x3FFFFFFF) << 2) | (this._bitfield & ~(0x3FFFFFFF << 2))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 0 })
        this.DeleteProp("__New")
    }
}
