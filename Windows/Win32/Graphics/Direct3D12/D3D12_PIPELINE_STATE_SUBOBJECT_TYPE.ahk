#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of a sub-object in a pipeline state stream description.
 * @remarks
 * 
 * 
 * 
 * This enum is used in the creation of pipeline state objects using the ID3D12Device1::CreatePipelineState method. The CreatePipelineState method takes a D3D12_PIPELINE_STATE_STREAM_DESC as one of its parameters, this structure in turn describes a bytestream made up of alternating D3D12_PIPELINE_STATE_SUBOBJECT_TYPE enumeration values and their corresponding subobject description structs. This bytestream description can be made a concrete type by defining a structure that has the same alternating pattern of alternating D3D12_PIPELINE_STATE_SUBOBJECT_TYPE enumeration values and their corresponding subobject description structs as members.
 * 
 * 
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_pipeline_state_subobject_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_PIPELINE_STATE_SUBOBJECT_TYPE{

    /**
     * Indicates a root signature subobject type.
     * The corresponding subobject type is **[ID3D12RootSignature](/windows/win32/api/d3d12/nn-d3d12-id3d12rootsignature)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_ROOT_SIGNATURE => 0

    /**
     * Indicates a vertex shader subobject type.
     * The corresponding subobject type is **[D3D12_SHADER_BYTECODE](/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_VS => 1

    /**
     * Indicates a pixel shader subobject type.
     * The corresponding subobject type is **[D3D12_SHADER_BYTECODE](/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_PS => 2

    /**
     * Indicates a domain shader subobject type.
     * The corresponding subobject type is **[D3D12_SHADER_BYTECODE](/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_DS => 3

    /**
     * Indicates a hull shader subobject type.
     * The corresponding subobject type is **[D3D12_SHADER_BYTECODE](/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_HS => 4

    /**
     * Indicates a geometry shader subobject type.
     * The corresponding subobject type is **[D3D12_SHADER_BYTECODE](/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_GS => 5

    /**
     * Indicates a compute shader subobject type.
     * The corresponding subobject type is **[D3D12_SHADER_BYTECODE](/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_CS => 6

    /**
     * Indicates a stream-output subobject type.
     * The corresponding subobject type is **[D3D12_STREAM_OUTPUT_DESC](/windows/win32/api/d3d12/ns-d3d12-d3d12_stream_output_desc)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_STREAM_OUTPUT => 7

    /**
     * Indicates a blend subobject type.
     * The corresponding subobject type is **[D3D12_BLEND_DESC](/windows/win32/api/d3d12/ns-d3d12-d3d12_blend_desc)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_BLEND => 8

    /**
     * Indicates a sample mask subobject type.
     * The corresponding subobject type is **UINT**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_SAMPLE_MASK => 9

    /**
     * Indicates indicates a rasterizer subobject type.
     * The corresponding subobject type is **[D3D12_RASTERIZER_DESC](/windows/win32/api/d3d12/ns-d3d12-d3d12_rasterizer_desc)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_RASTERIZER => 10

    /**
     * Indicates a depth stencil subobject type.
     * The corresponding subobject type is **[D3D12_DEPTH_STENCIL_DESC](/windows/win32/api/d3d12/ns-d3d12-d3d12_depth_stencil_desc)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_DEPTH_STENCIL => 11

    /**
     * Indicates an input layout subobject type.
     * The corresponding subobject type is **[D3D12_INPUT_LAYOUT_DESC](/windows/win32/api/d3d12/ns-d3d12-d3d12_input_layout_desc)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_INPUT_LAYOUT => 12

    /**
     * Indicates an index buffer strip cut value subobject type.
     * The corresponding subobject type is **[D3D12_INDEX_BUFFER_STRIP_CUT_VALUE](/windows/win32/api/d3d12/ne-d3d12-d3d12_index_buffer_strip_cut_value)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_IB_STRIP_CUT_VALUE => 13

    /**
     * Indicates a primitive topology subobject type.
     * The corresponding subobject type is **[D3D12_PRIMITIVE_TOPOLOGY_TYPE](/windows/win32/api/d3d12/ne-d3d12-d3d12_primitive_topology_type)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_PRIMITIVE_TOPOLOGY => 14

    /**
     * Indicates a render target formats subobject type. The corresponding subobject type is **[D3D12_RT_FORMAT_ARRAY](/windows/win32/api/d3d12/ne-d3d12-d3d12_rt_format_array)** structure, which wraps an array of render target formats along with a count of the array elements.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_RENDER_TARGET_FORMATS => 15

    /**
     * Indicates a depth stencil format subobject.
     * The corresponding subobject type is **[DXGI_FORMAT](/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_DEPTH_STENCIL_FORMAT => 16

    /**
     * Indicates a sample description subobject type.
     * The corresponding subobject type is **[DXGI_SAMPLE_DESC](/windows/win32/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_SAMPLE_DESC => 17

    /**
     * Indicates a node mask subobject type.
     * The corresponding subobject type is **[D3D12_NODE_MASK](/windows/win32/api/d3d12/ns-d3d12-d3d12_node_mask)** or **UINT**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_NODE_MASK => 18

    /**
     * Indicates a cached pipeline state object subobject type.
     * The corresponding subobject type is **[D3D12_CACHED_PIPELINE_STATE](/windows/win32/api/d3d12/ns-d3d12-d3d12_cached_pipeline_state)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_CACHED_PSO => 19

    /**
     * Indicates a flags subobject type.
     * The corresponding subobject type is **[D3D12_PIPELINE_STATE_FLAGS](/windows/win32/api/d3d12/ne-d3d12-d3d12_pipeline_state_flags)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_FLAGS => 20

    /**
     * Indicates an expanded depth stencil subobject type. This expansion of the depth stencil subobject supports optional depth bounds checking.
     * The corresponding subobject type is **[D3D12_DEPTH_STENCIL_DESC1](/windows/win32/api/d3d12/ns-d3d12-d3d12_depth_stencil_desc1)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_DEPTH_STENCIL1 => 21

    /**
     * Indicates a view instancing subobject type.
     * The corresponding subobject type is **[D3D12_VIEW_INSTANCING_DESC](/windows/win32/api/d3d12/ns-d3d12-d3d12_view_instancing_desc)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_VIEW_INSTANCING => 22

    /**
     * Indicates an amplification shader subobject type.
     * The corresponding subobject type is **[D3D12_SHADER_BYTECODE](/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_AS => 24

    /**
     * Indicates a mesh shader subobject type.
     * The corresponding subobject type is **[D3D12_SHADER_BYTECODE](/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode)**.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_MS => 25

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_DEPTH_STENCIL2 => 26

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_RASTERIZER1 => 27

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_RASTERIZER2 => 28

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_SERIALIZED_ROOT_SIGNATURE => 29

    /**
     * A sentinel value that marks the exclusive upper-bound of valid values this enumeration represents.
     * @type {Integer (Int32)}
     */
    static D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_MAX_VALID => 30
}
