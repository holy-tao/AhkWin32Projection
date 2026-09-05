#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a state object. Use with D3D12_STATE_OBJECT_DESC.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_state_object_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_STATE_OBJECT_TYPE extends Win32Enum {

    /**
     * Collection state object.
     * Native name: D3D12_STATE_OBJECT_TYPE_COLLECTION
     * @type {Integer (Int32)}
     */
    static COLLECTION => 0

    /**
     * Raytracing pipeline state object.
     * Native name: D3D12_STATE_OBJECT_TYPE_RAYTRACING_PIPELINE
     * @type {Integer (Int32)}
     */
    static RAYTRACING_PIPELINE => 3

    /**
     * Native name: D3D12_STATE_OBJECT_TYPE_EXECUTABLE
     * @type {Integer (Int32)}
     */
    static EXECUTABLE => 4
}
