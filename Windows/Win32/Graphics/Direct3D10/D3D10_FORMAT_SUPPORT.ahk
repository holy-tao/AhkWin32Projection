#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Which resources are supported for a given format and given device (see ID3D10Device::CheckFormatSupport).
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ne-d3d10-d3d10_format_support
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
class D3D10_FORMAT_SUPPORT extends Win32Enum {

    /**
     * Buffer resources supported.
     * Native name: D3D10_FORMAT_SUPPORT_BUFFER
     * @type {Integer (Int32)}
     */
    static BUFFER => 1

    /**
     * Vertex buffers supported.
     * Native name: D3D10_FORMAT_SUPPORT_IA_VERTEX_BUFFER
     * @type {Integer (Int32)}
     */
    static IA_VERTEX_BUFFER => 2

    /**
     * Index buffers supported.
     * Native name: D3D10_FORMAT_SUPPORT_IA_INDEX_BUFFER
     * @type {Integer (Int32)}
     */
    static IA_INDEX_BUFFER => 4

    /**
     * Streaming output buffers supported.
     * Native name: D3D10_FORMAT_SUPPORT_SO_BUFFER
     * @type {Integer (Int32)}
     */
    static SO_BUFFER => 8

    /**
     * 1D texture resources supported.
     * Native name: D3D10_FORMAT_SUPPORT_TEXTURE1D
     * @type {Integer (Int32)}
     */
    static TEXTURE1D => 16

    /**
     * 2D texture resources supported.
     * Native name: D3D10_FORMAT_SUPPORT_TEXTURE2D
     * @type {Integer (Int32)}
     */
    static TEXTURE2D => 32

    /**
     * 3D texture resources supported.
     * Native name: D3D10_FORMAT_SUPPORT_TEXTURE3D
     * @type {Integer (Int32)}
     */
    static TEXTURE3D => 64

    /**
     * Cube texture resources supported.
     * Native name: D3D10_FORMAT_SUPPORT_TEXTURECUBE
     * @type {Integer (Int32)}
     */
    static TEXTURECUBE => 128

    /**
     * The intrinsic HLSL function <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-load">load</a> is supported.
     * Native name: D3D10_FORMAT_SUPPORT_SHADER_LOAD
     * @type {Integer (Int32)}
     */
    static SHADER_LOAD => 256

    /**
     * The intrinsic HLSL functions <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-sample">Sample</a> supported.
     * Native name: D3D10_FORMAT_SUPPORT_SHADER_SAMPLE
     * @type {Integer (Int32)}
     */
    static SHADER_SAMPLE => 512

    /**
     * The intrinsic HLSL functions <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-samplecmp">SampleCmp</a> 
     *         and <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-samplecmplevelzero">SampleCmpLevelZero</a> are supported.
     * Native name: D3D10_FORMAT_SUPPORT_SHADER_SAMPLE_COMPARISON
     * @type {Integer (Int32)}
     */
    static SHADER_SAMPLE_COMPARISON => 1024

    /**
     * Reserved.
     * Native name: D3D10_FORMAT_SUPPORT_SHADER_SAMPLE_MONO_TEXT
     * @type {Integer (Int32)}
     */
    static SHADER_SAMPLE_MONO_TEXT => 2048

    /**
     * Mipmaps are supported.
     * Native name: D3D10_FORMAT_SUPPORT_MIP
     * @type {Integer (Int32)}
     */
    static MIP => 4096

    /**
     * Automatic generation of mipmaps is supported.
     * Native name: D3D10_FORMAT_SUPPORT_MIP_AUTOGEN
     * @type {Integer (Int32)}
     */
    static MIP_AUTOGEN => 8192

    /**
     * Rendertargets are supported.
     * Native name: D3D10_FORMAT_SUPPORT_RENDER_TARGET
     * @type {Integer (Int32)}
     */
    static RENDER_TARGET => 16384

    /**
     * Render target blend operations supported.
     * Native name: D3D10_FORMAT_SUPPORT_BLENDABLE
     * @type {Integer (Int32)}
     */
    static BLENDABLE => 32768

    /**
     * Depth stencils supported.
     * Native name: D3D10_FORMAT_SUPPORT_DEPTH_STENCIL
     * @type {Integer (Int32)}
     */
    static DEPTH_STENCIL => 65536

    /**
     * CPU locking supported.
     * Native name: D3D10_FORMAT_SUPPORT_CPU_LOCKABLE
     * @type {Integer (Int32)}
     */
    static CPU_LOCKABLE => 131072

    /**
     * Multisampling resolution supported.
     * Native name: D3D10_FORMAT_SUPPORT_MULTISAMPLE_RESOLVE
     * @type {Integer (Int32)}
     */
    static MULTISAMPLE_RESOLVE => 262144

    /**
     * Format can be displayed on screen.
     * Native name: D3D10_FORMAT_SUPPORT_DISPLAY
     * @type {Integer (Int32)}
     */
    static DISPLAY => 524288

    /**
     * Format cannot be cast to another format.
     * Native name: D3D10_FORMAT_SUPPORT_CAST_WITHIN_BIT_LAYOUT
     * @type {Integer (Int32)}
     */
    static CAST_WITHIN_BIT_LAYOUT => 1048576

    /**
     * Format can be used as a multisampled rendertarget.
     * Native name: D3D10_FORMAT_SUPPORT_MULTISAMPLE_RENDERTARGET
     * @type {Integer (Int32)}
     */
    static MULTISAMPLE_RENDERTARGET => 2097152

    /**
     * Format can be used as a multisampled texture and read into a shader with the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-load">load</a> function.
     * Native name: D3D10_FORMAT_SUPPORT_MULTISAMPLE_LOAD
     * @type {Integer (Int32)}
     */
    static MULTISAMPLE_LOAD => 4194304

    /**
     * Format can be used with the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-gather">gather</a> function. This value is available in DirectX 10.1 or higher.
     * Native name: D3D10_FORMAT_SUPPORT_SHADER_GATHER
     * @type {Integer (Int32)}
     */
    static SHADER_GATHER => 8388608

    /**
     * Native name: D3D10_FORMAT_SUPPORT_BACK_BUFFER_CAST
     * @type {Integer (Int32)}
     */
    static BACK_BUFFER_CAST => 16777216
}
