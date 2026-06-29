#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SCOPE_ID {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Zone
     * - Level
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Zone {
        get => (this._bitfield >> 0) & 0xFFFFFFF
        set => this._bitfield := ((value & 0xFFFFFFF) << 0) | (this._bitfield & ~(0xFFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Level {
        get => (this._bitfield >> 28) & 0xF
        set => this._bitfield := ((value & 0xF) << 28) | (this._bitfield & ~(0xF << 28))
    }
    static __New() {
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
