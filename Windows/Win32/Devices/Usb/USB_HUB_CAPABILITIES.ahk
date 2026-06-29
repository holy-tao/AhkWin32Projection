#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_HUB_CAPABILITIES {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - HubIs2xCapable
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    HubIs2xCapable {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
}
