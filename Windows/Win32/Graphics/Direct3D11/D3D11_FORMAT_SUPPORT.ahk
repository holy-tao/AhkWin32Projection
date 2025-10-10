#Requires AutoHotkey v2.0.0 64-bit

/**
 * Which resources are supported for a given format and given device (see ID3D11Device::CheckFormatSupport and ID3D11Device::CheckFeatureSupport).
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_format_support
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FORMAT_SUPPORT{

    /**
     * Buffer resources supported.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_BUFFER => 1

    /**
     * Vertex buffers supported.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_IA_VERTEX_BUFFER => 2

    /**
     * Index buffers supported.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_IA_INDEX_BUFFER => 4

    /**
     * Streaming output buffers supported.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_SO_BUFFER => 8

    /**
     * 1D texture resources supported.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_TEXTURE1D => 16

    /**
     * 2D texture resources supported.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_TEXTURE2D => 32

    /**
     * 3D texture resources supported.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_TEXTURE3D => 64

    /**
     * Cube texture resources supported.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_TEXTURECUBE => 128

    /**
     * The HLSL <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-load">Load</a> function for texture objects is supported.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_SHADER_LOAD => 256

    /**
     * The HLSL <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-sample">Sample</a> function for texture objects is supported.
 * 
 * <div class="alert"><b>Note</b>  If the device supports the format as a resource (1D, 2D, 3D, or cube map) but doesn't support this option, the resource can still use the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-sample">Sample</a> method but must use only the point filtering sampler state to perform the sample.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_SHADER_SAMPLE => 512

    /**
     * The HLSL <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-samplecmp">SampleCmp</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-samplecmplevelzero">SampleCmpLevelZero</a> functions for texture objects are supported.
 * 
 * <div class="alert"><b>Note</b>  Windows 8 and later might provide limited support for these functions on Direct3D <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature levels</a> 9_1, 9_2, and 9_3. For more info, see <a href="https://docs.microsoft.com/previous-versions/windows/apps/jj262110(v=win.10)">Implementing shadow buffers for Direct3D feature level 9</a>.
 * </div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_SHADER_SAMPLE_COMPARISON => 1024

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_SHADER_SAMPLE_MONO_TEXT => 2048

    /**
     * Mipmaps are supported.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_MIP => 4096

    /**
     * Automatic generation of mipmaps is supported.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_MIP_AUTOGEN => 8192

    /**
     * Render targets are supported.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_RENDER_TARGET => 16384

    /**
     * Blend operations supported.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_BLENDABLE => 32768

    /**
     * Depth stencils supported.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_DEPTH_STENCIL => 65536

    /**
     * CPU locking supported.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_CPU_LOCKABLE => 131072

    /**
     * Multisample antialiasing (MSAA) resolve operations are supported. For more info, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-resolvesubresource">ID3D11DeviceContex::ResolveSubresource</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_MULTISAMPLE_RESOLVE => 262144

    /**
     * Format can be displayed on screen.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_DISPLAY => 524288

    /**
     * Format cannot be cast to another format.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_CAST_WITHIN_BIT_LAYOUT => 1048576

    /**
     * Format can be used as a multisampled rendertarget.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_MULTISAMPLE_RENDERTARGET => 2097152

    /**
     * Format can be used as a multisampled texture and read into a shader with the HLSL load function.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_MULTISAMPLE_LOAD => 4194304

    /**
     * Format can be used with the HLSL gather function. This value is available in DirectX 10.1 or higher.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_SHADER_GATHER => 8388608

    /**
     * Format supports casting when the resource is a back buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_BACK_BUFFER_CAST => 16777216

    /**
     * Format can be used for an unordered access view.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_TYPED_UNORDERED_ACCESS_VIEW => 33554432

    /**
     * Format can be used with the HLSL gather with comparison function.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_SHADER_GATHER_COMPARISON => 67108864

    /**
     * Format can be used with the decoder output.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_DECODER_OUTPUT => 134217728

    /**
     * Format can be used with the video processor output.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_VIDEO_PROCESSOR_OUTPUT => 268435456

    /**
     * Format can be used with the video processor input.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_VIDEO_PROCESSOR_INPUT => 536870912

    /**
     * Format can be used with the video encoder.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT_VIDEO_ENCODER => 1073741824
}
