#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_CREATEHWQUEUEFLAGS {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - DisableGpuTimeout
     * - NoBroadcastSignal
     * - NoBroadcastWait
     * - NoKmdAccess
     * - UserModeSubmission
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    DisableGpuTimeout {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    NoBroadcastSignal {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    NoBroadcastWait {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    NoKmdAccess {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    UserModeSubmission {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }
    static __New() {
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
