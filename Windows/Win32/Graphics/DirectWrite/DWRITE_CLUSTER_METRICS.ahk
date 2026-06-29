#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a glyph cluster.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_cluster_metrics
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_CLUSTER_METRICS {
    #StructPack 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * The total advance width of all glyphs in the cluster.
     */
    width : Float32

    /**
     * Type: <b>UINT16</b>
     * 
     * The number of text positions in the cluster.
     */
    length : UInt16

    /**
     * This bitfield backs the following members:
     * - canWrapLineAfter
     * - isWhitespace
     * - isNewline
     * - isSoftHyphen
     * - isRightToLeft
     * - padding
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    canWrapLineAfter {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    isWhitespace {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    isNewline {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    isSoftHyphen {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    isRightToLeft {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    padding {
        get => (this._bitfield >> 5) & 0x7FF
        set => this._bitfield := ((value & 0x7FF) << 5) | (this._bitfield & ~(0x7FF << 5))
    }
}
