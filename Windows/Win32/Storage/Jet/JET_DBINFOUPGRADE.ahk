#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_DBINFOUPGRADE Structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-dbinfoupgrade-structure
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_DBINFOUPGRADE {
    #StructPack 4

    cbStruct : UInt32

    cbFilesizeLow : UInt32

    cbFilesizeHigh : UInt32

    cbFreeSpaceRequiredLow : UInt32

    cbFreeSpaceRequiredHigh : UInt32

    csecToUpgrade : UInt32

    ulFlags : UInt32


    /**
     * @type {Integer}
     */
    fUpgradable {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    fAlreadyUpgraded {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 24 })
        this.DeleteProp("__New")
    }
}
