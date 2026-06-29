#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the protection level for video content.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-protection-flags
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNEL_PROTECTION_FLAGS {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - ProtectionEnabled
     * - OverlayOrFullscreenRequired
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    ProtectionEnabled {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    OverlayOrFullscreenRequired {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
    static __New() {
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
