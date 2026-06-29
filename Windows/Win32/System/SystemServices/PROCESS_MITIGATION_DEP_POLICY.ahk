#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Contains process mitigation policy settings for data execution prevention (DEP).
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_dep_policy
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct PROCESS_MITIGATION_DEP_POLICY {
    #StructPack 4

    Flags : UInt32


    /**
     * @type {Integer}
     */
    Enable {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    DisableAtlThunkEmulation {
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
    /**
     * DEP is permanently enabled and cannot be disabled if this field is set to TRUE.
     */
    Permanent : BOOLEAN

    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 0 })
        this.DeleteProp("__New")
    }
}
