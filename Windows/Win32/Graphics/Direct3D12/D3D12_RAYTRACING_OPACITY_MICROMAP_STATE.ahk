#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_OPACITY_MICROMAP_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_OPACITY_MICROMAP_STATE_TRANSPARENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_OPACITY_MICROMAP_STATE_OPAQUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_OPACITY_MICROMAP_STATE_UNKNOWN_TRANSPARENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_OPACITY_MICROMAP_STATE_UNKNOWN_OPAQUE => 3
}
