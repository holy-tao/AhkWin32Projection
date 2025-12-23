#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies how to bind a resource to the pipeline. (D3D11_BIND_FLAG)
 * @remarks
 * In general, binding flags can be combined using a bitwise OR (except the constant-buffer flag); however, you should use a single flag to allow the device to optimize the resource usage.
 * 
 * This enumeration is used by a:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_buffer_desc">Buffer description</a> when creating a buffer.</li>
 * <li>Texture description when creating a texture (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture1d_desc">D3D11_TEXTURE1D_DESC</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture2d_desc">D3D11_TEXTURE2D_DESC</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture3d_desc">D3D11_TEXTURE3D_DESC</a>).</li>
 * </ul>
 * A shader-resource buffer is NOT a constant buffer; rather, it is a texture or buffer resource that is bound to a shader, that contains texture or buffer data (it is not limited to a single element type in the buffer). A shader-resource buffer is created with the D3D11_BIND_SHADER_RESOURCE flag and is bound to the pipeline using one of these APIs: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gssetshaderresources">ID3D11DeviceContext::GSSetShaderResources</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-pssetshaderresources">ID3D11DeviceContext::PSSetShaderResources</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vssetshaderresources">ID3D11DeviceContext::VSSetShaderResources</a>. Furthermore, a shader-resource buffer cannot use the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_map">D3D11_MAP_WRITE_NO_OVERWRITE</a> flag.
 * 
 * <div class="alert"><b>Note</b>  The Direct3D 11.1 runtime, which is available starting with Windows 8, enables  mapping dynamic constant buffers and shader resource views (SRVs) of dynamic buffers with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_map">D3D11_MAP_WRITE_NO_OVERWRITE</a>.  The Direct3D 11 and earlier runtimes limited mapping to vertex or index buffers. To determine if a Direct3D device supports these features, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-checkfeaturesupport">ID3D11Device::CheckFeatureSupport</a> with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_feature">D3D11_FEATURE_D3D11_OPTIONS</a>. <b>CheckFeatureSupport</b> fills members of a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options">D3D11_FEATURE_DATA_D3D11_OPTIONS</a> structure with the device's features. The relevant members here are <b>MapNoOverwriteOnDynamicConstantBuffer</b> and <b>MapNoOverwriteOnDynamicBufferSRV</b>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_bind_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_BIND_FLAG extends Win32BitflagEnum{

    /**
     * Bind a buffer as a vertex buffer to the input-assembler stage.
     * @type {Integer (Int32)}
     */
    static D3D11_BIND_VERTEX_BUFFER => 1

    /**
     * Bind a buffer as an index buffer to the input-assembler stage.
     * @type {Integer (Int32)}
     */
    static D3D11_BIND_INDEX_BUFFER => 2

    /**
     * Bind a buffer as a constant buffer to a shader stage; this flag may NOT be combined with any other bind flag.
     * @type {Integer (Int32)}
     */
    static D3D11_BIND_CONSTANT_BUFFER => 4

    /**
     * Bind a buffer or texture to a shader stage; this flag cannot be used with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_map">D3D11_MAP_WRITE_NO_OVERWRITE</a> flag.
     * 
     * <div class="alert"><b>Note</b>  The Direct3D 11.1 runtime, which is available starting with Windows 8, enables  mapping dynamic constant buffers and shader resource views (SRVs) of dynamic buffers with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_map">D3D11_MAP_WRITE_NO_OVERWRITE</a>.  The Direct3D 11 and earlier runtimes limited mapping to vertex or index buffers. To determine if a Direct3D device supports these features, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-checkfeaturesupport">ID3D11Device::CheckFeatureSupport</a> with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_feature">D3D11_FEATURE_D3D11_OPTIONS</a>. <b>CheckFeatureSupport</b> fills members of a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options">D3D11_FEATURE_DATA_D3D11_OPTIONS</a> structure with the device's features. The relevant members here are <b>MapNoOverwriteOnDynamicConstantBuffer</b> and <b>MapNoOverwriteOnDynamicBufferSRV</b>.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D11_BIND_SHADER_RESOURCE => 8

    /**
     * Bind an output buffer for the stream-output stage.
     * @type {Integer (Int32)}
     */
    static D3D11_BIND_STREAM_OUTPUT => 16

    /**
     * Bind a texture as a render target for the output-merger stage.
     * @type {Integer (Int32)}
     */
    static D3D11_BIND_RENDER_TARGET => 32

    /**
     * Bind a texture as a depth-stencil target for the output-merger stage.
     * @type {Integer (Int32)}
     */
    static D3D11_BIND_DEPTH_STENCIL => 64

    /**
     * Bind an <a href="https://docs.microsoft.com/windows/desktop/direct3d11/direct3d-11-advanced-stages-cs-resources">unordered access</a> resource.
     * @type {Integer (Int32)}
     */
    static D3D11_BIND_UNORDERED_ACCESS => 128

    /**
     * Set this flag to indicate that a  <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-textures-intro">2D texture</a> is used to receive output from the decoder API. The common way to create resources for a decoder output is by calling the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createtexture2d">ID3D11Device::CreateTexture2D</a> method to create an array of 2D  textures. However, you cannot use texture arrays that are created with this flag in calls to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createshaderresourceview">ID3D11Device::CreateShaderResourceView</a>.
     * 
     * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_BIND_DECODER => 512

    /**
     * Set this flag to indicate that a  <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-textures-intro">2D texture</a> is used to receive input from the video encoder API. The common way to create resources for a video encoder is by calling the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createtexture2d">ID3D11Device::CreateTexture2D</a> method to create an array of 2D  textures. However, you cannot use texture arrays that are created with this flag in calls to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createshaderresourceview">ID3D11Device::CreateShaderResourceView</a>.
     * 
     * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_BIND_VIDEO_ENCODER => 1024
}
