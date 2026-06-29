#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides information about a pen flick.
 * @see https://learn.microsoft.com/windows/win32/api/tabflicks/ns-tabflicks-flick_point
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct FLICK_POINT {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - x
     * - y
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    x {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    y {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
}
