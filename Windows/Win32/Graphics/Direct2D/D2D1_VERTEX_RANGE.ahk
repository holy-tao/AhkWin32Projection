#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a range of vertices that are used when rendering less than the full contents of a vertex buffer.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_vertex_range
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_VERTEX_RANGE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The first vertex in the range to process.
     * @type {Integer}
     */
    startVertex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of vertices to use.
     * @type {Integer}
     */
    vertexCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
