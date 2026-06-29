#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a range of vertices that are used when rendering less than the full contents of a vertex buffer.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_vertex_range
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_VERTEX_RANGE {
    #StructPack 4

    /**
     * The first vertex in the range to process.
     */
    startVertex : UInt32

    /**
     * The number of vertices to use.
     */
    vertexCount : UInt32

}
