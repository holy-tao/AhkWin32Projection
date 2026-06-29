#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKVGPU_ESCAPE_PAUSE {
    #StructPack 8

    Header : IntPtr

    DeviceLuid : IntPtr

    /**
     * This bitfield backs the following members:
     * - GuestVmRunning
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    GuestVmRunning {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'Flags', { type: UInt32, offset: 16 })
        this.DeleteProp("__New")
    }
}
