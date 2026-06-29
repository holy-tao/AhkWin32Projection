#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PANEL_SET_BRIGHTNESS_STATE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Smooth
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Smooth {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
