#Requires AutoHotkey v2.0.0 64-bit

/**
 * Values that identify shader parameters that use system-value semantics.
 * @remarks
 * 
  * The <b>D3D_NAME</b> values identify shader parameters that have <a href="https://docs.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_signature_parameter_desc">predefined system-value</a> semantics. These values are used in a shader-signature description. For more information about shader-signature description, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_signature_parameter_desc">D3D11_SIGNATURE_PARAMETER_DESC</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3dcommon/ne-d3dcommon-d3d_name
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_NAME{

    /**
     * This parameter does not use a predefined system-value semantic.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_UNDEFINED => 0

    /**
     * This parameter contains position data.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_POSITION => 1

    /**
     * This parameter contains clip-distance data.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_CLIP_DISTANCE => 2

    /**
     * This parameter contains cull-distance data.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_CULL_DISTANCE => 3

    /**
     * This parameter contains a render-target-array index.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_RENDER_TARGET_ARRAY_INDEX => 4

    /**
     * This parameter contains a viewport-array index.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_VIEWPORT_ARRAY_INDEX => 5

    /**
     * This parameter contains a vertex ID.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_VERTEX_ID => 6

    /**
     * This parameter contains a primitive ID.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_PRIMITIVE_ID => 7

    /**
     * This parameter contains an instance ID.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_INSTANCE_ID => 8

    /**
     * This parameter contains data that identifies whether or not the primitive faces the camera.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_IS_FRONT_FACE => 9

    /**
     * This parameter contains a sampler-array index.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_SAMPLE_INDEX => 10

    /**
     * This parameter contains one of four tessellation factors that correspond to the amount of parts that a quad patch is broken into along the given edge. This flag is used to tessellate a quad patch.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_FINAL_QUAD_EDGE_TESSFACTOR => 11

    /**
     * This parameter contains one of two tessellation factors that correspond to the amount of parts that a quad patch is broken into vertically and horizontally within the patch. This flag is used to tessellate a quad patch.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_FINAL_QUAD_INSIDE_TESSFACTOR => 12

    /**
     * This parameter contains one of three tessellation factors that correspond to the amount of parts that a tri patch is broken into along the given edge. This flag is used to tessellate a tri patch.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_FINAL_TRI_EDGE_TESSFACTOR => 13

    /**
     * This parameter contains the tessellation factor that corresponds to the amount of parts that a tri patch is broken into within the patch. This flag is used to tessellate a tri patch.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_FINAL_TRI_INSIDE_TESSFACTOR => 14

    /**
     * This parameter contains the tessellation factor that corresponds to the number of lines broken into within the patch. This flag is used to tessellate an isolines patch.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_FINAL_LINE_DETAIL_TESSFACTOR => 15

    /**
     * This parameter contains the tessellation factor that corresponds to the number of lines that are created within the patch. This flag is used to tessellate an isolines patch.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_FINAL_LINE_DENSITY_TESSFACTOR => 16

    /**
     * This parameter contains barycentric coordinate data.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_BARYCENTRICS => 23

    /**
     * @type {Integer (Int32)}
     */
    static D3D_NAME_SHADINGRATE => 24

    /**
     * @type {Integer (Int32)}
     */
    static D3D_NAME_CULLPRIMITIVE => 25

    /**
     * This parameter contains render-target data.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_TARGET => 64

    /**
     * This parameter contains depth data.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_DEPTH => 65

    /**
     * This parameter contains alpha-coverage data.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_COVERAGE => 66

    /**
     * This parameter signifies that the value is greater than or equal to a reference value. This flag is used to specify conservative depth for a pixel shader.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_DEPTH_GREATER_EQUAL => 67

    /**
     * This parameter signifies that the value is less than or equal to a reference value. This flag is used to specify conservative depth for a pixel shader.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_DEPTH_LESS_EQUAL => 68

    /**
     * This parameter contains a stencil reference.
 *             See <a href="https://docs.microsoft.com/windows/desktop/direct3d11/shader-specified-stencil-reference-value">Shader Specified Stencil Reference Value</a>.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_STENCIL_REF => 69

    /**
     * This parameter contains inner input coverage data.
 *             See <a href="https://docs.microsoft.com/windows/desktop/direct3d11/conservative-rasterization">Conservative Rasterization</a>.
     * @type {Integer (Int32)}
     */
    static D3D_NAME_INNER_COVERAGE => 70

    /**
     * This parameter does not use a predefined system-value semantic.
     * @type {Integer (Int32)}
     */
    static D3D10_NAME_UNDEFINED => 0

    /**
     * This parameter contains position data.
     * @type {Integer (Int32)}
     */
    static D3D10_NAME_POSITION => 1

    /**
     * This parameter contains clip-distance data.
     * @type {Integer (Int32)}
     */
    static D3D10_NAME_CLIP_DISTANCE => 2

    /**
     * This parameter contains cull-distance data.
     * @type {Integer (Int32)}
     */
    static D3D10_NAME_CULL_DISTANCE => 3

    /**
     * This parameter contains a render-target-array index.
     * @type {Integer (Int32)}
     */
    static D3D10_NAME_RENDER_TARGET_ARRAY_INDEX => 4

    /**
     * This parameter contains a viewport-array index.
     * @type {Integer (Int32)}
     */
    static D3D10_NAME_VIEWPORT_ARRAY_INDEX => 5

    /**
     * This parameter contains a vertex ID.
     * @type {Integer (Int32)}
     */
    static D3D10_NAME_VERTEX_ID => 6

    /**
     * This parameter contains a primitive ID.
     * @type {Integer (Int32)}
     */
    static D3D10_NAME_PRIMITIVE_ID => 7

    /**
     * This parameter contains a instance ID.
     * @type {Integer (Int32)}
     */
    static D3D10_NAME_INSTANCE_ID => 8

    /**
     * This parameter contains data that identifies whether or not the primitive faces the camera.
     * @type {Integer (Int32)}
     */
    static D3D10_NAME_IS_FRONT_FACE => 9

    /**
     * This parameter contains a sampler-array index.
     * @type {Integer (Int32)}
     */
    static D3D10_NAME_SAMPLE_INDEX => 10

    /**
     * This parameter contains render-target data.
     * @type {Integer (Int32)}
     */
    static D3D10_NAME_TARGET => 64

    /**
     * This parameter contains depth data.
     * @type {Integer (Int32)}
     */
    static D3D10_NAME_DEPTH => 65

    /**
     * This parameter contains alpha-coverage data.
     * @type {Integer (Int32)}
     */
    static D3D10_NAME_COVERAGE => 66

    /**
     * This parameter contains one of four tessellation factors that correspond to the amount of parts that a quad patch is broken into along the given edge. This flag is used to tessellate a quad patch.
     * @type {Integer (Int32)}
     */
    static D3D11_NAME_FINAL_QUAD_EDGE_TESSFACTOR => 11

    /**
     * This parameter contains one of two tessellation factors that correspond to the amount of parts that a quad patch is broken into vertically and horizontally within the patch. This flag is used to tessellate a quad patch.
     * @type {Integer (Int32)}
     */
    static D3D11_NAME_FINAL_QUAD_INSIDE_TESSFACTOR => 12

    /**
     * This parameter contains one of three tessellation factors that correspond to the amount of parts that a tri patch is broken into along the given edge. This flag is used to tessellate a tri patch.
     * @type {Integer (Int32)}
     */
    static D3D11_NAME_FINAL_TRI_EDGE_TESSFACTOR => 13

    /**
     * This parameter contains the tessellation factor that corresponds to the amount of parts that a tri patch is broken into within the patch. This flag is used to tessellate a tri patch.
     * @type {Integer (Int32)}
     */
    static D3D11_NAME_FINAL_TRI_INSIDE_TESSFACTOR => 14

    /**
     * This parameter contains the tessellation factor that corresponds to the amount of lines broken into within the patch. This flag is used to tessellate an isolines patch.
     * @type {Integer (Int32)}
     */
    static D3D11_NAME_FINAL_LINE_DETAIL_TESSFACTOR => 15

    /**
     * This parameter contains the tessellation factor that corresponds to the amount of lines that are created within the patch. This flag is used to tessellate an isolines patch.
     * @type {Integer (Int32)}
     */
    static D3D11_NAME_FINAL_LINE_DENSITY_TESSFACTOR => 16

    /**
     * This parameter signifies that the value is greater than or equal to a reference value. This flag is used to specify conservative depth for a pixel shader.
     * @type {Integer (Int32)}
     */
    static D3D11_NAME_DEPTH_GREATER_EQUAL => 67

    /**
     * This parameter signifies that the value is less than or equal to a reference value. This flag is used to specify conservative depth for a pixel shader.
     * @type {Integer (Int32)}
     */
    static D3D11_NAME_DEPTH_LESS_EQUAL => 68

    /**
     * This parameter contains a stencil reference.
 *             See <a href="https://docs.microsoft.com/windows/desktop/direct3d11/shader-specified-stencil-reference-value">Shader Specified Stencil Reference Value</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_NAME_STENCIL_REF => 69

    /**
     * This parameter contains inner input coverage data.
 *             See <a href="https://docs.microsoft.com/windows/desktop/direct3d11/conservative-rasterization">Conservative Rasterization</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_NAME_INNER_COVERAGE => 70

    /**
     * This parameter contains barycentric coordinate data.
     * @type {Integer (Int32)}
     */
    static D3D12_NAME_BARYCENTRICS => 23

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_NAME_SHADINGRATE => 24

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_NAME_CULLPRIMITIVE => 25
}
