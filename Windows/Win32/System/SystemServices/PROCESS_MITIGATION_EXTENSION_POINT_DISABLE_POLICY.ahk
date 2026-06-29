#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains process mitigation policy settings for legacy extension point DLLs.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_extension_point_disable_policy
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct PROCESS_MITIGATION_EXTENSION_POINT_DISABLE_POLICY {
    #StructPack 4

    Flags : UInt32


    /**
     * @type {Integer}
     */
    DisableExtensionPoints {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    ReservedFlags {
        get => (this._bitfield >> 1) & 0x7FFFFFFF
        set => this._bitfield := ((value & 0x7FFFFFFF) << 1) | (this._bitfield & ~(0x7FFFFFFF << 1))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 0 })
        this.DeleteProp("__New")
    }
}
