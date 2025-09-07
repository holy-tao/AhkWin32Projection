#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of the indirect parameter.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_indirect_argument_desc">D3D12_INDIRECT_ARGUMENT_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_indirect_argument_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_INDIRECT_ARGUMENT_TYPE{

    /**
     * Indicates the type is a Draw call.
     * @type {Integer (Int32)}
     */
    static D3D12_INDIRECT_ARGUMENT_TYPE_DRAW => 0

    /**
     * Indicates the type is a DrawIndexed call.
     * @type {Integer (Int32)}
     */
    static D3D12_INDIRECT_ARGUMENT_TYPE_DRAW_INDEXED => 1

    /**
     * Indicates the type is a Dispatch call.
     * @type {Integer (Int32)}
     */
    static D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH => 2

    /**
     * Indicates the type is a vertex buffer view.
     * @type {Integer (Int32)}
     */
    static D3D12_INDIRECT_ARGUMENT_TYPE_VERTEX_BUFFER_VIEW => 3

    /**
     * Indicates the type is an index buffer view.
     * @type {Integer (Int32)}
     */
    static D3D12_INDIRECT_ARGUMENT_TYPE_INDEX_BUFFER_VIEW => 4

    /**
     * Indicates the type is a constant.
     * @type {Integer (Int32)}
     */
    static D3D12_INDIRECT_ARGUMENT_TYPE_CONSTANT => 5

    /**
     * Indicates the type is a constant buffer view (CBV).
     * @type {Integer (Int32)}
     */
    static D3D12_INDIRECT_ARGUMENT_TYPE_CONSTANT_BUFFER_VIEW => 6

    /**
     * Indicates the type is a shader resource view (SRV).
     * @type {Integer (Int32)}
     */
    static D3D12_INDIRECT_ARGUMENT_TYPE_SHADER_RESOURCE_VIEW => 7

    /**
     * Indicates the type is an unordered access view (UAV).
     * @type {Integer (Int32)}
     */
    static D3D12_INDIRECT_ARGUMENT_TYPE_UNORDERED_ACCESS_VIEW => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH_RAYS => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH_MESH => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_INDIRECT_ARGUMENT_TYPE_INCREMENTING_CONSTANT => 11
}
