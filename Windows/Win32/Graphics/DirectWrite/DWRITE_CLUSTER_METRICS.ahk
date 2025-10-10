#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a glyph cluster.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ns-dwrite-dwrite_cluster_metrics
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_CLUSTER_METRICS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * The total advance width of all glyphs in the cluster.
     * @type {Float}
     */
    width {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * The number of text positions in the cluster.
     * @type {Integer}
     */
    length {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * This bitfield backs the following members:
     * - canWrapLineAfter
     * - isWhitespace
     * - isNewline
     * - isSoftHyphen
     * - isRightToLeft
     * - padding
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * Indicates whether a line can be broken right after the cluster.
     * @type {Integer}
     */
    canWrapLineAfter {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * Indicates whether the cluster corresponds to a whitespace character.
     * @type {Integer}
     */
    isWhitespace {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * Indicates whether the cluster corresponds to a newline character.
     * @type {Integer}
     */
    isNewline {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * Indicates whether the cluster corresponds to a soft hyphen character.
     * @type {Integer}
     */
    isSoftHyphen {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * Indicates whether the cluster is read from right to left.
     * @type {Integer}
     */
    isRightToLeft {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * Reserved for future use.
     * @type {Integer}
     */
    padding {
        get => (this._bitfield >> 5) & 0x7FF
        set => this._bitfield := ((value & 0x7FF) << 5) | (this._bitfield & ~(0x7FF << 5))
    }
}
