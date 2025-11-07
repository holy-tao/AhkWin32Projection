#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how the pipeline interprets geometry or hull shader input primitives.
 * @remarks
 * 
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_primitive_topology_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_PRIMITIVE_TOPOLOGY_TYPE{

    /**
     * The shader has not been initialized with an input primitive type.
     * @type {Integer (Int32)}
     */
    static D3D12_PRIMITIVE_TOPOLOGY_TYPE_UNDEFINED => 0

    /**
     * Interpret the input primitive as a point.
     * @type {Integer (Int32)}
     */
    static D3D12_PRIMITIVE_TOPOLOGY_TYPE_POINT => 1

    /**
     * Interpret the input primitive as a line.
     * @type {Integer (Int32)}
     */
    static D3D12_PRIMITIVE_TOPOLOGY_TYPE_LINE => 2

    /**
     * Interpret the input primitive as a triangle.
     * @type {Integer (Int32)}
     */
    static D3D12_PRIMITIVE_TOPOLOGY_TYPE_TRIANGLE => 3

    /**
     * Interpret the input primitive as a control point patch.
     * @type {Integer (Int32)}
     */
    static D3D12_PRIMITIVE_TOPOLOGY_TYPE_PATCH => 4
}
