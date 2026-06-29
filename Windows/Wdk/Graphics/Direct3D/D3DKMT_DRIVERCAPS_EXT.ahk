#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_DRIVERCAPS_EXT {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - VirtualModeSupport
     * - Usb4MonitorSupport
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    VirtualModeSupport {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Usb4MonitorSupport {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
    static __New() {
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
