#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of a state object. Use with D3D12_STATE_OBJECT_DESC.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_state_object_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_STATE_OBJECT_TYPE{

    /**
     * Collection state object.
     * @type {Integer (Int32)}
     */
    static D3D12_STATE_OBJECT_TYPE_COLLECTION => 0

    /**
     * Raytracing pipeline state object.
     * @type {Integer (Int32)}
     */
    static D3D12_STATE_OBJECT_TYPE_RAYTRACING_PIPELINE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_STATE_OBJECT_TYPE_EXECUTABLE => 4
}
