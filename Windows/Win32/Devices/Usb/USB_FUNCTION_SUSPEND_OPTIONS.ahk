#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_FUNCTION_SUSPEND_OPTIONS {
    #StructPack 1

    AsUchar : Int8


    /**
     * @type {Integer}
     */
    PowerState {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    RemoteWakeEnabled {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int8, offset: 0 })
        this.DeleteProp("__New")
    }
}
