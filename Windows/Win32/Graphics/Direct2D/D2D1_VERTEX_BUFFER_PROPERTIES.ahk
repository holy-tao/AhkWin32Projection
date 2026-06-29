#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_VERTEX_USAGE.ahk" { D2D1_VERTEX_USAGE }

/**
 * Defines the properties of a vertex buffer that are standard for all vertex shader definitions.
 * @remarks
 * If <b>usage</b> is dynamic, the system might return a system memory buffer and copy these vertices into the rendering vertex buffer for each element.
 * 
 * If the initialization data is not specified, the buffer will be uninitialized.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_vertex_buffer_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_VERTEX_BUFFER_PROPERTIES {
    #StructPack 8

    /**
     * The number of inputs to the vertex shader.
     */
    inputCount : UInt32

    /**
     * Indicates how frequently the vertex buffer is likely to be updated.
     */
    usage : D2D1_VERTEX_USAGE

    /**
     * The initial contents of the vertex buffer.
     */
    data : IntPtr

    /**
     * The size of the vertex buffer, in bytes.
     */
    byteWidth : UInt32

}
