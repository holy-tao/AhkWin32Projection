#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a glyph cluster.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_cluster_metrics
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
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
