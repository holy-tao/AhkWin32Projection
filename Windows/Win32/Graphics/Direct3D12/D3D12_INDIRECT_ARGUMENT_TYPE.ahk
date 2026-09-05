#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of the indirect parameter.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_indirect_argument_desc">D3D12_INDIRECT_ARGUMENT_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_indirect_argument_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_INDIRECT_ARGUMENT_TYPE extends Win32Enum {

    /**
     * Indicates the type is a Draw call.
     * Native name: D3D12_INDIRECT_ARGUMENT_TYPE_DRAW
     * @type {Integer (Int32)}
     */
    static DRAW => 0

    /**
     * Indicates the type is a DrawIndexed call.
     * Native name: D3D12_INDIRECT_ARGUMENT_TYPE_DRAW_INDEXED
     * @type {Integer (Int32)}
     */
    static DRAW_INDEXED => 1

    /**
     * Indicates the type is a Dispatch call.
     * Native name: D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH
     * @type {Integer (Int32)}
     */
    static DISPATCH => 2

    /**
     * Indicates the type is a vertex buffer view.
     * Native name: D3D12_INDIRECT_ARGUMENT_TYPE_VERTEX_BUFFER_VIEW
     * @type {Integer (Int32)}
     */
    static VERTEX_BUFFER_VIEW => 3

    /**
     * Indicates the type is an index buffer view.
     * Native name: D3D12_INDIRECT_ARGUMENT_TYPE_INDEX_BUFFER_VIEW
     * @type {Integer (Int32)}
     */
    static INDEX_BUFFER_VIEW => 4

    /**
     * Indicates the type is a constant.
     * Native name: D3D12_INDIRECT_ARGUMENT_TYPE_CONSTANT
     * @type {Integer (Int32)}
     */
    static CONSTANT => 5

    /**
     * Indicates the type is a constant buffer view (CBV).
     * Native name: D3D12_INDIRECT_ARGUMENT_TYPE_CONSTANT_BUFFER_VIEW
     * @type {Integer (Int32)}
     */
    static CONSTANT_BUFFER_VIEW => 6

    /**
     * Indicates the type is a shader resource view (SRV).
     * Native name: D3D12_INDIRECT_ARGUMENT_TYPE_SHADER_RESOURCE_VIEW
     * @type {Integer (Int32)}
     */
    static SHADER_RESOURCE_VIEW => 7

    /**
     * Indicates the type is an unordered access view (UAV).
     * Native name: D3D12_INDIRECT_ARGUMENT_TYPE_UNORDERED_ACCESS_VIEW
     * @type {Integer (Int32)}
     */
    static UNORDERED_ACCESS_VIEW => 8

    /**
     * Native name: D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH_RAYS
     * @type {Integer (Int32)}
     */
    static DISPATCH_RAYS => 9

    /**
     * Native name: D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH_MESH
     * @type {Integer (Int32)}
     */
    static DISPATCH_MESH => 10

    /**
     * Native name: D3D12_INDIRECT_ARGUMENT_TYPE_INCREMENTING_CONSTANT
     * @type {Integer (Int32)}
     */
    static INCREMENTING_CONSTANT => 11
}
