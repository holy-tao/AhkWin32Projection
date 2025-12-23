#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the properties of a vertex buffer that are standard for all vertex shader definitions.
 * @remarks
 * If <b>usage</b> is dynamic, the system might return a system memory buffer and copy these vertices into the rendering vertex buffer for each element.
 * 
 * If the initialization data is not specified, the buffer will be uninitialized.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_vertex_buffer_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_VERTEX_BUFFER_PROPERTIES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The number of inputs to the vertex shader.
     * @type {Integer}
     */
    inputCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates how frequently the vertex buffer is likely to be updated.
     * @type {Integer}
     */
    usage {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The initial contents of the vertex buffer.
     * @type {Pointer<Integer>}
     */
    data {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size of the vertex buffer, in bytes.
     * @type {Integer}
     */
    byteWidth {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
