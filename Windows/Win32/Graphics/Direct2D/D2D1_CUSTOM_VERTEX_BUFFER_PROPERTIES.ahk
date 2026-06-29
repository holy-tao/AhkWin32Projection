#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_INPUT_ELEMENT_DESC.ahk" { D2D1_INPUT_ELEMENT_DESC }

/**
 * Defines a vertex shader and the input element description to define the input layout.
 * @remarks
 * The vertex shader will be loaded by the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createvertexbuffer">CreateVertexBuffer</a> call that accepts the vertex buffer properties.
 * 
 * This structure does not need to be specified if one of the standard vertex shaders is used.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_custom_vertex_buffer_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_CUSTOM_VERTEX_BUFFER_PROPERTIES {
    #StructPack 8

    /**
     * A pointer to the buffer.
     */
    shaderBufferWithInputSignature : IntPtr

    /**
     * The size of the buffer.
     */
    shaderBufferSize : UInt32

    /**
     * An array of input assembler stage data types.
     */
    inputElements : D2D1_INPUT_ELEMENT_DESC.Ptr

    /**
     * The number of input elements in the vertex shader.
     */
    elementCount : UInt32

    /**
     * The vertex stride.
     */
    stride : UInt32

}
