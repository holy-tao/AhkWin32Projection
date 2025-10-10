#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies how to bind a resource to the pipeline.
 * @remarks
 * 
  * In general, binding flags can be combined using a logical OR (except the constant-buffer flag); however, you should use a single flag to allow the device to optimize the resource usage.
  * 
  * This enumeration is used by a:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_buffer_desc">Buffer description</a> when creating a buffer.</li>
  * <li>Texture description when creating a texture (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture1d_desc">D3D10_TEXTURE1D_DESC</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture2d_desc">D3D10_TEXTURE2D_DESC</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture3d_desc">D3D10_TEXTURE3D_DESC</a>).</li>
  * </ul>
  * A shader-resource buffer is NOT a constant buffer; rather, it is a texture or buffer resource that is bound to a shader, that contains texture or buffer data (it is not limited to a single element type in the buffer). A shader-resource buffer is created with the D3D10_BIND_SHADER_RESOURCE flag and is bound to the pipeline using one of these APIs: <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-gssetshaderresources">ID3D10Device::GSSetShaderResources</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-pssetshaderresources">ID3D10Device::PSSetShaderResources</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-vssetshaderresources">ID3D10Device::VSSetShaderResources</a>. Furthermore, a shader-resource buffer cannot use the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map">D3D10_MAP_WRITE_NO_OVERWRITE</a> flag.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ne-d3d10-d3d10_bind_flag
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_BIND_FLAG{

    /**
     * Bind a buffer as a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">vertex buffer</a> to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage">input-assembler stage</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_BIND_VERTEX_BUFFER => 1

    /**
     * Bind a buffer as an <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">index buffer</a> to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage">input-assembler stage</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_BIND_INDEX_BUFFER => 2

    /**
     * Bind a buffer as a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">constant buffer</a> to a <a href="https://docs.microsoft.com/previous-versions/bb205146(v=vs.85)">shader stage</a>; this flag may NOT be combined with any other bind flag.
     * @type {Integer (Int32)}
     */
    static D3D10_BIND_CONSTANT_BUFFER => 4

    /**
     * Bind a buffer or texture to a <a href="https://docs.microsoft.com/previous-versions/bb205146(v=vs.85)">shader stage</a>; this flag cannot be used with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map">D3D10_MAP_WRITE_NO_OVERWRITE</a> flag.
     * @type {Integer (Int32)}
     */
    static D3D10_BIND_SHADER_RESOURCE => 8

    /**
     * Bind an output buffer for the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-stream-stage">stream-output stage</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_BIND_STREAM_OUTPUT => 16

    /**
     * Bind a texture as a render target for the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger stage</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_BIND_RENDER_TARGET => 32

    /**
     * Bind a texture as a depth-stencil target for the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger stage</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_BIND_DEPTH_STENCIL => 64
}
