#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct PROCESS_MITIGATION_SYSTEM_CALL_FILTER_POLICY {
    #StructPack 4

    Flags : UInt32


    /**
     * @type {Integer}
     */
    FilterId {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
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
