#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_RAYTRACING_OPACITY_MICROMAP_STATE extends Win32Enum {

    /**
     * Native name: D3D12_RAYTRACING_OPACITY_MICROMAP_STATE_TRANSPARENT
     * @type {Integer (Int32)}
     */
    static TRANSPARENT => 0

    /**
     * Native name: D3D12_RAYTRACING_OPACITY_MICROMAP_STATE_OPAQUE
     * @type {Integer (Int32)}
     */
    static OPAQUE => 1

    /**
     * Native name: D3D12_RAYTRACING_OPACITY_MICROMAP_STATE_UNKNOWN_TRANSPARENT
     * @type {Integer (Int32)}
     */
    static UNKNOWN_TRANSPARENT => 2

    /**
     * Native name: D3D12_RAYTRACING_OPACITY_MICROMAP_STATE_UNKNOWN_OPAQUE
     * @type {Integer (Int32)}
     */
    static UNKNOWN_OPAQUE => 3
}
