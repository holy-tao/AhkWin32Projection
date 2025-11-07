#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a vertex shader and the input element description to define the input layout.
 * @remarks
 * 
 * The vertex shader will be loaded by the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createvertexbuffer">CreateVertexBuffer</a> call that accepts the vertex buffer properties.
 * 
 * This structure does not need to be specified if one of the standard vertex shaders is used.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/ns-d2d1effectauthor-d2d1_custom_vertex_buffer_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_CUSTOM_VERTEX_BUFFER_PROPERTIES extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A pointer to the buffer.
     * @type {Pointer<Integer>}
     */
    shaderBufferWithInputSignature {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size of the buffer.
     * @type {Integer}
     */
    shaderBufferSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An array of input assembler stage data types.
     * @type {Pointer<D2D1_INPUT_ELEMENT_DESC>}
     */
    inputElements {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The number of input elements in the vertex shader.
     * @type {Integer}
     */
    elementCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The vertex stride.
     * @type {Integer}
     */
    stride {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
