#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_VIDPN_TARGET_MODE {
    #StructPack 8

    Id : UInt32

    VideoSignalInfo : IntPtr

    WireFormatAndPreference : IntPtr


    /**
     * @type {Integer}
     */
    Preference {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => (this._bitfield >> 2) & 0x3FFFFFFF
        set => this._bitfield := ((value & 0x3FFFFFFF) << 2) | (this._bitfield & ~(0x3FFFFFFF << 2))
    }
    MinimumVSyncFreq : IntPtr

    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 16 })
        this.DeleteProp("__New")
    }
}
