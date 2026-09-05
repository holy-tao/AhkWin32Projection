#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of a state subobject. Use with D3D12_STATE_SUBOBJECT.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_state_subobject_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_STATE_SUBOBJECT_TYPE extends Win32Enum {

    /**
     * Subobject type is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_state_object_config">D3D12_STATE_OBJECT_CONFIG</a>.
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_STATE_OBJECT_CONFIG
     * @type {Integer (Int32)}
     */
    static STATE_OBJECT_CONFIG => 0

    /**
     * Subobject type is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_global_root_signature">D3D12_GLOBAL_ROOT_SIGNATURE</a>.
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_GLOBAL_ROOT_SIGNATURE
     * @type {Integer (Int32)}
     */
    static GLOBAL_ROOT_SIGNATURE => 1

    /**
     * Subobject type is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_local_root_signature">D3D12_LOCAL_ROOT_SIGNATURE</a>.
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_LOCAL_ROOT_SIGNATURE
     * @type {Integer (Int32)}
     */
    static LOCAL_ROOT_SIGNATURE => 2

    /**
     * Subobject type is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_node_mask">D3D12_NODE_MASK</a>.
     * 
     * > [!IMPORTANT]
     * > On some versions of the DirectX Runtime, specifying a node via [**D3D12_NODE_MASK**](/windows/win32/api/d3d12/ns-d3d12-d3d12_node_mask) in a [**D3D12_STATE_SUBOBJECT**](/windows/win32/api/d3d12/ns-d3d12-d3d12_state_subobject) with type **D3D12_STATE_SUBOBJECT_TYPE_NODE_MASK**, the runtime will incorrectly handle a node mask value of `0`, which should use node #1, which will lead to errors when attempting to use the state object later. Specify an explicit node value of 1, or omit the [**D3D12_NODE_MASK**](/windows/win32/api/d3d12/ns-d3d12-d3d12_node_mask) subobject to avoid this issue.
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_NODE_MASK
     * @type {Integer (Int32)}
     */
    static NODE_MASK => 3

    /**
     * Subobject type is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dxil_library_desc">D3D12_DXIL_LIBRARY_DESC</a>.
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_DXIL_LIBRARY
     * @type {Integer (Int32)}
     */
    static DXIL_LIBRARY => 5

    /**
     * Subobject type is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_existing_collection_desc">D3D12_EXISTING_COLLECTION_DESC</a>.
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_EXISTING_COLLECTION
     * @type {Integer (Int32)}
     */
    static EXISTING_COLLECTION => 6

    /**
     * Subobject type is <a href="../d3d12/ns-d3d12-d3d12_subobject_to_exports_association.md">D3D12_SUBOBJECT_TO_EXPORTS_ASSOCIATION</a>.
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_SUBOBJECT_TO_EXPORTS_ASSOCIATION
     * @type {Integer (Int32)}
     */
    static SUBOBJECT_TO_EXPORTS_ASSOCIATION => 7

    /**
     * Subobject type is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dxil_subobject_to_exports_association">D3D12_DXIL_SUBOBJECT_TO_EXPORTS_ASSOCIATION</a>.
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_DXIL_SUBOBJECT_TO_EXPORTS_ASSOCIATION
     * @type {Integer (Int32)}
     */
    static DXIL_SUBOBJECT_TO_EXPORTS_ASSOCIATION => 8

    /**
     * Subobject type is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_shader_config">D3D12_RAYTRACING_SHADER_CONFIG</a>.
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_RAYTRACING_SHADER_CONFIG
     * @type {Integer (Int32)}
     */
    static RAYTRACING_SHADER_CONFIG => 9

    /**
     * Subobject type is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_pipeline_config">D3D12_RAYTRACING_PIPELINE_CONFIG</a>.
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_RAYTRACING_PIPELINE_CONFIG
     * @type {Integer (Int32)}
     */
    static RAYTRACING_PIPELINE_CONFIG => 10

    /**
     * Subobject type is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_hit_group_desc">D3D12_HIT_GROUP_DESC</a>
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_HIT_GROUP
     * @type {Integer (Int32)}
     */
    static HIT_GROUP => 11

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_RAYTRACING_PIPELINE_CONFIG1
     * @type {Integer (Int32)}
     */
    static RAYTRACING_PIPELINE_CONFIG1 => 12

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_WORK_GRAPH
     * @type {Integer (Int32)}
     */
    static WORK_GRAPH => 13

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_STREAM_OUTPUT
     * @type {Integer (Int32)}
     */
    static STREAM_OUTPUT => 14

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_BLEND
     * @type {Integer (Int32)}
     */
    static BLEND => 15

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_SAMPLE_MASK
     * @type {Integer (Int32)}
     */
    static SAMPLE_MASK => 16

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_RASTERIZER
     * @type {Integer (Int32)}
     */
    static RASTERIZER => 17

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_DEPTH_STENCIL
     * @type {Integer (Int32)}
     */
    static DEPTH_STENCIL => 18

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_INPUT_LAYOUT
     * @type {Integer (Int32)}
     */
    static INPUT_LAYOUT => 19

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_IB_STRIP_CUT_VALUE
     * @type {Integer (Int32)}
     */
    static IB_STRIP_CUT_VALUE => 20

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_PRIMITIVE_TOPOLOGY
     * @type {Integer (Int32)}
     */
    static PRIMITIVE_TOPOLOGY => 21

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_RENDER_TARGET_FORMATS
     * @type {Integer (Int32)}
     */
    static RENDER_TARGET_FORMATS => 22

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_DEPTH_STENCIL_FORMAT
     * @type {Integer (Int32)}
     */
    static DEPTH_STENCIL_FORMAT => 23

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_SAMPLE_DESC
     * @type {Integer (Int32)}
     */
    static SAMPLE_DESC => 24

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_FLAGS
     * @type {Integer (Int32)}
     */
    static FLAGS => 26

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_DEPTH_STENCIL1
     * @type {Integer (Int32)}
     */
    static DEPTH_STENCIL1 => 27

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_VIEW_INSTANCING
     * @type {Integer (Int32)}
     */
    static VIEW_INSTANCING => 28

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_GENERIC_PROGRAM
     * @type {Integer (Int32)}
     */
    static GENERIC_PROGRAM => 29

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_DEPTH_STENCIL2
     * @type {Integer (Int32)}
     */
    static DEPTH_STENCIL2 => 30

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_GLOBAL_SERIALIZED_ROOT_SIGNATURE
     * @type {Integer (Int32)}
     */
    static GLOBAL_SERIALIZED_ROOT_SIGNATURE => 31

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_LOCAL_SERIALIZED_ROOT_SIGNATURE
     * @type {Integer (Int32)}
     */
    static LOCAL_SERIALIZED_ROOT_SIGNATURE => 32

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_COMPILER_EXISTING_COLLECTION
     * @type {Integer (Int32)}
     */
    static COMPILER_EXISTING_COLLECTION => 33

    /**
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_EXISTING_COLLECTION_BY_KEY
     * @type {Integer (Int32)}
     */
    static EXISTING_COLLECTION_BY_KEY => 36

    /**
     * The maximum valid subobject type value.
     * Native name: D3D12_STATE_SUBOBJECT_TYPE_MAX_VALID
     * @type {Integer (Int32)}
     */
    static MAX_VALID => 37
}
