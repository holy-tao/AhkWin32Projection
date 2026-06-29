#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to impose new behavior on handle references that are not valid.
 * @remarks
 * As a general rule, strict handle checking cannot be turned off once it is turned on. Therefore, when calling the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setprocessmitigationpolicy">SetProcessMitigationPolicy</a> function with this policy, the values of the <b>RaiseExceptionOnInvalidHandleReference</b> and <b>HandleExceptionsPermanentlyEnabled</b> substructure members must be the same. It is not possible to enable invalid handle exceptions only temporarily.
 * 
 * The exception to the general rule about strict handle checking always being a permanent state is that debugging tools such as Application Verifier can cause the operating system to enable invalid handle exceptions temporarily. Under those cases, it is possible for the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getprocessmitigationpolicy">GetProcessMitigationPolicy</a> function to return with <b>RaiseExceptionOnInvalidHandleReference</b> set to 1, but <b>HandleExceptionsPermanentlyEnabled</b> set to 0.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_strict_handle_check_policy
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct PROCESS_MITIGATION_STRICT_HANDLE_CHECK_POLICY {
    #StructPack 4

    Flags : UInt32


    /**
     * @type {Integer}
     */
    RaiseExceptionOnInvalidHandleReference {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    HandleExceptionsPermanentlyEnabled {
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
