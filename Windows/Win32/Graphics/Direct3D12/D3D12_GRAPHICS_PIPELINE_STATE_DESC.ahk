#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_SHADER_BYTECODE.ahk
#Include .\D3D12_STREAM_OUTPUT_DESC.ahk
#Include .\D3D12_RENDER_TARGET_BLEND_DESC.ahk
#Include .\D3D12_BLEND_DESC.ahk
#Include .\D3D12_RASTERIZER_DESC.ahk
#Include .\D3D12_DEPTH_STENCILOP_DESC.ahk
#Include .\D3D12_DEPTH_STENCIL_DESC.ahk
#Include .\D3D12_INPUT_LAYOUT_DESC.ahk
#Include ..\Dxgi\Common\DXGI_SAMPLE_DESC.ahk
#Include .\D3D12_CACHED_PIPELINE_STATE.ahk

/**
 * Describes a graphics pipeline state object.
 * @remarks
 * 
  * This structure is used by the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-creategraphicspipelinestate">CreateGraphicsPipelineState</a> method.
  *       
  * 
  * The runtime validates:
  *           
  * 
  * <ul>
  * <li>Whether the linkage between the shader stages is correct.
  *           </li>
  * <li>If the <b>HS</b> and <b>DS</b> members are specified, the <b>PrimitiveTopologyType</b> member for topology type must be set to <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_primitive_topology_type">D3D12_PRIMITIVE_TOPOLOGY_TYPE_PATCH</a>.
  *           </li>
  * <li>Whether sample frequency execution isn't allowed with the center multi-sample anti-aliasing (MSAA) pattern.
  *           </li>
  * <li>Whether anti-aliasing lines aren't allowed with the center MSAA pattern.
  *           </li>
  * <li>
  * If the <b>ForcedSampleCount</b> member of <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_rasterizer_desc">D3D12_RASTERIZER_DESC</a> that <b>RasterizerState</b> specifies isn't zero:
  *               
  * 
  * <ul>
  * <li>Depth/stencil must be disabled.
  *               </li>
  * <li>Pixel shader can't output depth.
  *               </li>
  * <li>Pixel shader can't run at sample frequency.
  *               </li>
  * <li>Render target sample count must be 1.
  *               </li>
  * </ul>
  * </li>
  * <li>Whether blend state is compatible with render target formats.
  *           </li>
  * <li>Whether pixel shader output type is compatible with render target format.
  *           </li>
  * <li>Whether the sample count and quality are supported for the render target/depth stencil formats.
  *           </li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_GRAPHICS_PIPELINE_STATE_DESC extends Win32Struct
{
    static sizeof => 408

    static packingSize => 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12rootsignature">ID3D12RootSignature</a> object.
     * @type {ID3D12RootSignature}
     */
    pRootSignature {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode">D3D12_SHADER_BYTECODE</a> structure that describes the vertex shader.
     * @type {D3D12_SHADER_BYTECODE}
     */
    VS{
        get {
            if(!this.HasProp("__VS"))
                this.__VS := D3D12_SHADER_BYTECODE(8, this)
            return this.__VS
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode">D3D12_SHADER_BYTECODE</a> structure that describes the pixel shader.
     * @type {D3D12_SHADER_BYTECODE}
     */
    PS{
        get {
            if(!this.HasProp("__PS"))
                this.__PS := D3D12_SHADER_BYTECODE(24, this)
            return this.__PS
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode">D3D12_SHADER_BYTECODE</a> structure that describes the domain shader.
     * @type {D3D12_SHADER_BYTECODE}
     */
    DS{
        get {
            if(!this.HasProp("__DS"))
                this.__DS := D3D12_SHADER_BYTECODE(40, this)
            return this.__DS
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode">D3D12_SHADER_BYTECODE</a> structure that describes the hull shader.
     * @type {D3D12_SHADER_BYTECODE}
     */
    HS{
        get {
            if(!this.HasProp("__HS"))
                this.__HS := D3D12_SHADER_BYTECODE(56, this)
            return this.__HS
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode">D3D12_SHADER_BYTECODE</a> structure that describes the geometry shader.
     * @type {D3D12_SHADER_BYTECODE}
     */
    GS{
        get {
            if(!this.HasProp("__GS"))
                this.__GS := D3D12_SHADER_BYTECODE(72, this)
            return this.__GS
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_stream_output_desc">D3D12_STREAM_OUTPUT_DESC</a> structure that describes a streaming output buffer.
     * @type {D3D12_STREAM_OUTPUT_DESC}
     */
    StreamOutput{
        get {
            if(!this.HasProp("__StreamOutput"))
                this.__StreamOutput := D3D12_STREAM_OUTPUT_DESC(88, this)
            return this.__StreamOutput
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_blend_desc">D3D12_BLEND_DESC</a> structure that describes the blend state.
     * @type {D3D12_BLEND_DESC}
     */
    BlendState{
        get {
            if(!this.HasProp("__BlendState"))
                this.__BlendState := D3D12_BLEND_DESC(120, this)
            return this.__BlendState
        }
    }

    /**
     * The sample mask for the blend state.
     * @type {Integer}
     */
    SampleMask {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_rasterizer_desc">D3D12_RASTERIZER_DESC</a> structure that describes the rasterizer state.
     * @type {D3D12_RASTERIZER_DESC}
     */
    RasterizerState{
        get {
            if(!this.HasProp("__RasterizerState"))
                this.__RasterizerState := D3D12_RASTERIZER_DESC(200, this)
            return this.__RasterizerState
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_depth_stencil_desc">D3D12_DEPTH_STENCIL_DESC</a> structure that describes the depth-stencil state.
     * @type {D3D12_DEPTH_STENCIL_DESC}
     */
    DepthStencilState{
        get {
            if(!this.HasProp("__DepthStencilState"))
                this.__DepthStencilState := D3D12_DEPTH_STENCIL_DESC(248, this)
            return this.__DepthStencilState
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_input_layout_desc">D3D12_INPUT_LAYOUT_DESC</a> structure that describes the input-buffer data for the input-assembler stage.
     * @type {D3D12_INPUT_LAYOUT_DESC}
     */
    InputLayout{
        get {
            if(!this.HasProp("__InputLayout"))
                this.__InputLayout := D3D12_INPUT_LAYOUT_DESC(304, this)
            return this.__InputLayout
        }
    }

    /**
     * Specifies the properties of the index buffer in a  <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_index_buffer_strip_cut_value">D3D12_INDEX_BUFFER_STRIP_CUT_VALUE</a> structure.
     * @type {Integer}
     */
    IBStripCutValue {
        get => NumGet(this, 320, "int")
        set => NumPut("int", value, this, 320)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_primitive_topology_type">D3D12_PRIMITIVE_TOPOLOGY_TYPE</a>-typed value for the type of primitive, and ordering of the primitive data.
     * @type {Integer}
     */
    PrimitiveTopologyType {
        get => NumGet(this, 324, "int")
        set => NumPut("int", value, this, 324)
    }

    /**
     * The number of render target formats in the  <b>RTVFormats</b> member.
     * @type {Integer}
     */
    NumRenderTargets {
        get => NumGet(this, 328, "uint")
        set => NumPut("uint", value, this, 328)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed values for the render target formats.
     * @type {Array<Int32>}
     */
    RTVFormats{
        get {
            if(!this.HasProp("__RTVFormatsProxyArray"))
                this.__RTVFormatsProxyArray := Win32FixedArray(this.ptr + 332, 8, Primitive, "int")
            return this.__RTVFormatsProxyArray
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value for the depth-stencil format.
     * @type {Integer}
     */
    DSVFormat {
        get => NumGet(this, 364, "int")
        set => NumPut("int", value, this, 364)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a> structure that specifies multisampling parameters.
     * @type {DXGI_SAMPLE_DESC}
     */
    SampleDesc{
        get {
            if(!this.HasProp("__SampleDesc"))
                this.__SampleDesc := DXGI_SAMPLE_DESC(368, this)
            return this.__SampleDesc
        }
    }

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set bits to identify the nodes (the  device's physical adapters) for which the graphics pipeline state is to apply.
     *             Each bit in the mask corresponds to a single node.
     *             Refer to <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     * @type {Integer}
     */
    NodeMask {
        get => NumGet(this, 376, "uint")
        set => NumPut("uint", value, this, 376)
    }

    /**
     * A cached pipeline state object, as a <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_cached_pipeline_state">D3D12_CACHED_PIPELINE_STATE</a> structure. pCachedBlob and CachedBlobSizeInBytes may be set to NULL and 0 respectively.
     * @type {D3D12_CACHED_PIPELINE_STATE}
     */
    CachedPSO{
        get {
            if(!this.HasProp("__CachedPSO"))
                this.__CachedPSO := D3D12_CACHED_PIPELINE_STATE(384, this)
            return this.__CachedPSO
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_pipeline_state_flags">D3D12_PIPELINE_STATE_FLAGS</a> enumeration constant such as for "tool debug".
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 400, "int")
        set => NumPut("int", value, this, 400)
    }
}
