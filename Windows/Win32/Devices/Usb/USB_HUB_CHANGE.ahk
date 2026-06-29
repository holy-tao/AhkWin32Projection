#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_HUB_CHANGE {
    #StructPack 1

    AsUshort16 : UInt16


    /**
     * @type {Integer}
     */
    LocalPowerChange {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    OverCurrentChange {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int16, offset: 0 })
        this.DeleteProp("__New")
    }
}
