#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Jet
 * @charset ANSI
 */
export default struct JET_CONVERT_A {
    #StructPack 8

    szOldDll : IntPtr

    fFlags : UInt32


    /**
     * @type {Integer}
     */
    fSchemaChangesOnly {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 8 })
        this.DeleteProp("__New")
    }
}
