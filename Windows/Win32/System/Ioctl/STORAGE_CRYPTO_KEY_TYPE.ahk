#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_CRYPTO_KEY_TYPE {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - DirectKey
     * - PlatformWrappedKey
     * - PlutonWrappedKey
     * - Reserved
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    DirectKey {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    PlatformWrappedKey {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    PlutonWrappedKey {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUchar', { type: Int8, offset: 0 })
        this.DeleteProp("__New")
    }
}
