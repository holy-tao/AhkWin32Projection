#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Kernel
 */
export default struct RTL_BALANCED_NODE {
    #StructPack 8

    Children : RTL_BALANCED_NODE.Ptr[2]

    /**
     * This bitfield backs the following members:
     * - Red
     * - Balance
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    Red {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Balance {
        get => (this._bitfield >> 1) & 0x3
        set => this._bitfield := ((value & 0x3) << 1) | (this._bitfield & ~(0x3 << 1))
    }
    static __New() {
        DefineProp(this.Prototype, 'Left', { type: RTL_BALANCED_NODE.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'Right', { type: RTL_BALANCED_NODE.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'ParentValue', { type: IntPtr, offset: 16 })
        this.DeleteProp("__New")
    }
}
