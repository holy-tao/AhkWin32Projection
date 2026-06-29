#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the device state.
 * @remarks
 * A state-block mask indicates the device states that a pass or a technique changes.  The <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-d3d10stateblockmaskenablecapture">D3D10StateBlockMaskEnableCapture</a> function provides a convenient way of setting a range of bitmasks for the array members of <b>D3D10_STATE_BLOCK_MASK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_STATE_BLOCK_MASK {
    #StructPack 1

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the vertex shader state.
     */
    VS : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of vertex-shader samplers.  The array is a multi-byte bitmask where each bit represents one sampler slot.
     */
    VSSamplers : Int8[2]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of vertex-shader resources. The array is a multi-byte bitmask where each bit represents one resource slot.
     */
    VSShaderResources : Int8[16]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of vertex-shader constant buffers. The array is a multi-byte bitmask where each bit represents one constant buffer slot.
     */
    VSConstantBuffers : Int8[2]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the geometry shader state.
     */
    GS : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of geometry-shader samplers. The array is a multi-byte bitmask where each bit represents one sampler slot.
     */
    GSSamplers : Int8[2]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of geometry-shader resources. The array is a multi-byte bitmask where each bit represents one resource slot.
     */
    GSShaderResources : Int8[16]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of geometry-shader constant buffers. The array is a multi-byte bitmask where each bit represents one buffer slot.
     */
    GSConstantBuffers : Int8[2]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the pixel shader state.
     */
    PS : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of pixel-shader samplers. The array is a multi-byte bitmask where each bit represents one sampler slot.
     */
    PSSamplers : Int8[2]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of pixel-shader resources. The array is a multi-byte bitmask where each bit represents one resource slot.
     */
    PSShaderResources : Int8[16]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of pixel-shader constant buffers. The array is a multi-byte bitmask where each bit represents one constant buffer slot.
     */
    PSConstantBuffers : Int8[2]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of vertex buffers. The array is a multi-byte bitmask where each bit represents one resource slot.
     */
    IAVertexBuffers : Int8[2]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the index buffer state.
     */
    IAIndexBuffer : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the input layout state.
     */
    IAInputLayout : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the primitive topology state.
     */
    IAPrimitiveTopology : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the render targets states.
     */
    OMRenderTargets : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the depth-stencil state.
     */
    OMDepthStencilState : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the blend state.
     */
    OMBlendState : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the viewports states.
     */
    RSViewports : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the scissor rectangles states.
     */
    RSScissorRects : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the rasterizer state.
     */
    RSRasterizerState : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the stream-out buffers states.
     */
    SOBuffers : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the predication state.
     */
    Predication : Int8

}
