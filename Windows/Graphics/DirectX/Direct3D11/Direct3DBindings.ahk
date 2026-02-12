#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This is a Windows Runtime equivalent of the Desktop [D3D11_BIND_FLAG](/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag) enumeration. Identifies the ways in which a resource may be bound to the graphics pipeline.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.directx.direct3d11.direct3dbindings
 * @namespace Windows.Graphics.DirectX.Direct3D11
 * @version WindowsRuntime 1.4
 */
class Direct3DBindings extends Win32BitflagEnum{

    /**
     * Bind a buffer as a vertex buffer to the input-assembler stage.
     * @type {Integer (UInt32)}
     */
    static VertexBuffer => 1

    /**
     * Bind a buffer as an index buffer to the input-assembler stage.
     * @type {Integer (UInt32)}
     */
    static IndexBuffer => 2

    /**
     * Bind a buffer as a constant buffer to a shader stage.
     * @type {Integer (UInt32)}
     */
    static ConstantBuffer => 4

    /**
     * Bind a buffer or texture to a shader stage.
     * @type {Integer (UInt32)}
     */
    static ShaderResource => 8

    /**
     * Bind an output buffer for the stream-output stage.
     * @type {Integer (UInt32)}
     */
    static StreamOutput => 16

    /**
     * Bind a texture as a render target for the output-merger stage.
     * @type {Integer (UInt32)}
     */
    static RenderTarget => 32

    /**
     * Bind a texture as a depth-stencil target for the output-merger stage.
     * @type {Integer (UInt32)}
     */
    static DepthStencil => 64

    /**
     * Bind an unordered access resource.
     * @type {Integer (UInt32)}
     */
    static UnorderedAccess => 128

    /**
     * Set this flag to indicate that a 2D texture is used to receive output from the decoder API.
     * @type {Integer (UInt32)}
     */
    static Decoder => 512

    /**
     * Set this flag to indicate that a 2D texture is used to receive input from the video encoder API.
     * @type {Integer (UInt32)}
     */
    static VideoEncoder => 1024
}
