#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the device state.
 * @remarks
 * 
 * A state-block mask indicates the device states that a pass or a technique changes.  The <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-d3d10stateblockmaskenablecapture">D3D10StateBlockMaskEnableCapture</a> function provides a convenient way of setting a range of bitmasks for the array members of <b>D3D10_STATE_BLOCK_MASK</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/ns-d3d10effect-d3d10_state_block_mask
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_STATE_BLOCK_MASK extends Win32Struct
{
    static sizeof => 76

    static packingSize => 1

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the vertex shader state.
     * @type {Integer}
     */
    VS {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of vertex-shader samplers.  The array is a multi-byte bitmask where each bit represents one sampler slot.
     * @type {Array<Byte>}
     */
    VSSamplers{
        get {
            if(!this.HasProp("__VSSamplersProxyArray"))
                this.__VSSamplersProxyArray := Win32FixedArray(this.ptr + 1, 2, Primitive, "char")
            return this.__VSSamplersProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of vertex-shader resources. The array is a multi-byte bitmask where each bit represents one resource slot.
     * @type {Array<Byte>}
     */
    VSShaderResources{
        get {
            if(!this.HasProp("__VSShaderResourcesProxyArray"))
                this.__VSShaderResourcesProxyArray := Win32FixedArray(this.ptr + 3, 16, Primitive, "char")
            return this.__VSShaderResourcesProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of vertex-shader constant buffers. The array is a multi-byte bitmask where each bit represents one constant buffer slot.
     * @type {Array<Byte>}
     */
    VSConstantBuffers{
        get {
            if(!this.HasProp("__VSConstantBuffersProxyArray"))
                this.__VSConstantBuffersProxyArray := Win32FixedArray(this.ptr + 19, 2, Primitive, "char")
            return this.__VSConstantBuffersProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the geometry shader state.
     * @type {Integer}
     */
    GS {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of geometry-shader samplers. The array is a multi-byte bitmask where each bit represents one sampler slot.
     * @type {Array<Byte>}
     */
    GSSamplers{
        get {
            if(!this.HasProp("__GSSamplersProxyArray"))
                this.__GSSamplersProxyArray := Win32FixedArray(this.ptr + 22, 2, Primitive, "char")
            return this.__GSSamplersProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of geometry-shader resources. The array is a multi-byte bitmask where each bit represents one resource slot.
     * @type {Array<Byte>}
     */
    GSShaderResources{
        get {
            if(!this.HasProp("__GSShaderResourcesProxyArray"))
                this.__GSShaderResourcesProxyArray := Win32FixedArray(this.ptr + 24, 16, Primitive, "char")
            return this.__GSShaderResourcesProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of geometry-shader constant buffers. The array is a multi-byte bitmask where each bit represents one buffer slot.
     * @type {Array<Byte>}
     */
    GSConstantBuffers{
        get {
            if(!this.HasProp("__GSConstantBuffersProxyArray"))
                this.__GSConstantBuffersProxyArray := Win32FixedArray(this.ptr + 40, 2, Primitive, "char")
            return this.__GSConstantBuffersProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the pixel shader state.
     * @type {Integer}
     */
    PS {
        get => NumGet(this, 42, "char")
        set => NumPut("char", value, this, 42)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of pixel-shader samplers. The array is a multi-byte bitmask where each bit represents one sampler slot.
     * @type {Array<Byte>}
     */
    PSSamplers{
        get {
            if(!this.HasProp("__PSSamplersProxyArray"))
                this.__PSSamplersProxyArray := Win32FixedArray(this.ptr + 43, 2, Primitive, "char")
            return this.__PSSamplersProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of pixel-shader resources. The array is a multi-byte bitmask where each bit represents one resource slot.
     * @type {Array<Byte>}
     */
    PSShaderResources{
        get {
            if(!this.HasProp("__PSShaderResourcesProxyArray"))
                this.__PSShaderResourcesProxyArray := Win32FixedArray(this.ptr + 45, 16, Primitive, "char")
            return this.__PSShaderResourcesProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of pixel-shader constant buffers. The array is a multi-byte bitmask where each bit represents one constant buffer slot.
     * @type {Array<Byte>}
     */
    PSConstantBuffers{
        get {
            if(!this.HasProp("__PSConstantBuffersProxyArray"))
                this.__PSConstantBuffersProxyArray := Win32FixedArray(this.ptr + 61, 2, Primitive, "char")
            return this.__PSConstantBuffersProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Array of vertex buffers. The array is a multi-byte bitmask where each bit represents one resource slot.
     * @type {Array<Byte>}
     */
    IAVertexBuffers{
        get {
            if(!this.HasProp("__IAVertexBuffersProxyArray"))
                this.__IAVertexBuffersProxyArray := Win32FixedArray(this.ptr + 63, 2, Primitive, "char")
            return this.__IAVertexBuffersProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the index buffer state.
     * @type {Integer}
     */
    IAIndexBuffer {
        get => NumGet(this, 65, "char")
        set => NumPut("char", value, this, 65)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the input layout state.
     * @type {Integer}
     */
    IAInputLayout {
        get => NumGet(this, 66, "char")
        set => NumPut("char", value, this, 66)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the primitive topology state.
     * @type {Integer}
     */
    IAPrimitiveTopology {
        get => NumGet(this, 67, "char")
        set => NumPut("char", value, this, 67)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the render targets states.
     * @type {Integer}
     */
    OMRenderTargets {
        get => NumGet(this, 68, "char")
        set => NumPut("char", value, this, 68)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the depth-stencil state.
     * @type {Integer}
     */
    OMDepthStencilState {
        get => NumGet(this, 69, "char")
        set => NumPut("char", value, this, 69)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the blend state.
     * @type {Integer}
     */
    OMBlendState {
        get => NumGet(this, 70, "char")
        set => NumPut("char", value, this, 70)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the viewports states.
     * @type {Integer}
     */
    RSViewports {
        get => NumGet(this, 71, "char")
        set => NumPut("char", value, this, 71)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the scissor rectangles states.
     * @type {Integer}
     */
    RSScissorRects {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the rasterizer state.
     * @type {Integer}
     */
    RSRasterizerState {
        get => NumGet(this, 73, "char")
        set => NumPut("char", value, this, 73)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the stream-out buffers states.
     * @type {Integer}
     */
    SOBuffers {
        get => NumGet(this, 74, "char")
        set => NumPut("char", value, this, 74)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Boolean value indicating whether to save the predication state.
     * @type {Integer}
     */
    Predication {
        get => NumGet(this, 75, "char")
        set => NumPut("char", value, this, 75)
    }
}
