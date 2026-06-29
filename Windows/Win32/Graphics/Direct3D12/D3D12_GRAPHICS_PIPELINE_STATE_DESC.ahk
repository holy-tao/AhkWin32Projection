#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_LOGIC_OP.ahk" { D3D12_LOGIC_OP }
#Import ".\D3D12_SHADER_BYTECODE.ahk" { D3D12_SHADER_BYTECODE }
#Import ".\D3D12_STENCIL_OP.ahk" { D3D12_STENCIL_OP }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_PIPELINE_STATE_FLAGS.ahk" { D3D12_PIPELINE_STATE_FLAGS }
#Import ".\D3D12_SO_DECLARATION_ENTRY.ahk" { D3D12_SO_DECLARATION_ENTRY }
#Import "..\Dxgi\Common\DXGI_SAMPLE_DESC.ahk" { DXGI_SAMPLE_DESC }
#Import ".\D3D12_COMPARISON_FUNC.ahk" { D3D12_COMPARISON_FUNC }
#Import ".\D3D12_PRIMITIVE_TOPOLOGY_TYPE.ahk" { D3D12_PRIMITIVE_TOPOLOGY_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_DEPTH_STENCIL_DESC.ahk" { D3D12_DEPTH_STENCIL_DESC }
#Import ".\D3D12_RENDER_TARGET_BLEND_DESC.ahk" { D3D12_RENDER_TARGET_BLEND_DESC }
#Import ".\D3D12_DEPTH_WRITE_MASK.ahk" { D3D12_DEPTH_WRITE_MASK }
#Import ".\D3D12_CULL_MODE.ahk" { D3D12_CULL_MODE }
#Import ".\D3D12_INDEX_BUFFER_STRIP_CUT_VALUE.ahk" { D3D12_INDEX_BUFFER_STRIP_CUT_VALUE }
#Import ".\D3D12_FILL_MODE.ahk" { D3D12_FILL_MODE }
#Import ".\D3D12_RASTERIZER_DESC.ahk" { D3D12_RASTERIZER_DESC }
#Import ".\ID3D12RootSignature.ahk" { ID3D12RootSignature }
#Import ".\D3D12_STREAM_OUTPUT_DESC.ahk" { D3D12_STREAM_OUTPUT_DESC }
#Import ".\D3D12_INPUT_LAYOUT_DESC.ahk" { D3D12_INPUT_LAYOUT_DESC }
#Import ".\D3D12_INPUT_ELEMENT_DESC.ahk" { D3D12_INPUT_ELEMENT_DESC }
#Import ".\D3D12_CONSERVATIVE_RASTERIZATION_MODE.ahk" { D3D12_CONSERVATIVE_RASTERIZATION_MODE }
#Import ".\D3D12_CACHED_PIPELINE_STATE.ahk" { D3D12_CACHED_PIPELINE_STATE }
#Import ".\D3D12_BLEND.ahk" { D3D12_BLEND }
#Import ".\D3D12_DEPTH_STENCILOP_DESC.ahk" { D3D12_DEPTH_STENCILOP_DESC }
#Import ".\D3D12_BLEND_OP.ahk" { D3D12_BLEND_OP }
#Import ".\D3D12_BLEND_DESC.ahk" { D3D12_BLEND_DESC }

/**
 * Describes a graphics pipeline state object.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_GRAPHICS_PIPELINE_STATE_DESC {
    #StructPack 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12rootsignature">ID3D12RootSignature</a> object.
     */
    pRootSignature : ID3D12RootSignature

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode">D3D12_SHADER_BYTECODE</a> structure that describes the vertex shader.
     */
    VS : D3D12_SHADER_BYTECODE

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode">D3D12_SHADER_BYTECODE</a> structure that describes the pixel shader.
     */
    PS : D3D12_SHADER_BYTECODE

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode">D3D12_SHADER_BYTECODE</a> structure that describes the domain shader.
     */
    DS : D3D12_SHADER_BYTECODE

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode">D3D12_SHADER_BYTECODE</a> structure that describes the hull shader.
     */
    HS : D3D12_SHADER_BYTECODE

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode">D3D12_SHADER_BYTECODE</a> structure that describes the geometry shader.
     */
    GS : D3D12_SHADER_BYTECODE

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_stream_output_desc">D3D12_STREAM_OUTPUT_DESC</a> structure that describes a streaming output buffer.
     */
    StreamOutput : D3D12_STREAM_OUTPUT_DESC

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_blend_desc">D3D12_BLEND_DESC</a> structure that describes the blend state.
     */
    BlendState : D3D12_BLEND_DESC

    /**
     * The sample mask for the blend state.
     */
    SampleMask : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_rasterizer_desc">D3D12_RASTERIZER_DESC</a> structure that describes the rasterizer state.
     */
    RasterizerState : D3D12_RASTERIZER_DESC

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_depth_stencil_desc">D3D12_DEPTH_STENCIL_DESC</a> structure that describes the depth-stencil state.
     */
    DepthStencilState : D3D12_DEPTH_STENCIL_DESC

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_input_layout_desc">D3D12_INPUT_LAYOUT_DESC</a> structure that describes the input-buffer data for the input-assembler stage.
     */
    InputLayout : D3D12_INPUT_LAYOUT_DESC

    /**
     * Specifies the properties of the index buffer in a  <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_index_buffer_strip_cut_value">D3D12_INDEX_BUFFER_STRIP_CUT_VALUE</a> structure.
     */
    IBStripCutValue : D3D12_INDEX_BUFFER_STRIP_CUT_VALUE

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_primitive_topology_type">D3D12_PRIMITIVE_TOPOLOGY_TYPE</a>-typed value for the type of primitive, and ordering of the primitive data.
     */
    PrimitiveTopologyType : D3D12_PRIMITIVE_TOPOLOGY_TYPE

    /**
     * The number of render target formats in the  <b>RTVFormats</b> member.
     */
    NumRenderTargets : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed values for the render target formats.
     */
    RTVFormats : DXGI_FORMAT[8]

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value for the depth-stencil format.
     */
    DSVFormat : DXGI_FORMAT

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a> structure that specifies multisampling parameters.
     */
    SampleDesc : DXGI_SAMPLE_DESC

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set bits to identify the nodes (the  device's physical adapters) for which the graphics pipeline state is to apply.
     *             Each bit in the mask corresponds to a single node.
     *             Refer to <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     */
    NodeMask : UInt32

    /**
     * A cached pipeline state object, as a <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_cached_pipeline_state">D3D12_CACHED_PIPELINE_STATE</a> structure. pCachedBlob and CachedBlobSizeInBytes may be set to NULL and 0 respectively.
     */
    CachedPSO : D3D12_CACHED_PIPELINE_STATE

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_pipeline_state_flags">D3D12_PIPELINE_STATE_FLAGS</a> enumeration constant such as for "tool debug".
     */
    Flags : D3D12_PIPELINE_STATE_FLAGS

}
