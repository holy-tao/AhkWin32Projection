#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_RAYTRACING_OPACITY_MICROMAP_SPECIAL_INDEX extends Win32Enum {

    /**
     * Native name: D3D12_RAYTRACING_OPACITY_MICROMAP_SPECIAL_INDEX_FULLY_TRANSPARENT
     * @type {Integer (Int32)}
     */
    static FULLY_TRANSPARENT => -1

    /**
     * Native name: D3D12_RAYTRACING_OPACITY_MICROMAP_SPECIAL_INDEX_FULLY_OPAQUE
     * @type {Integer (Int32)}
     */
    static FULLY_OPAQUE => -2

    /**
     * Native name: D3D12_RAYTRACING_OPACITY_MICROMAP_SPECIAL_INDEX_FULLY_UNKNOWN_TRANSPARENT
     * @type {Integer (Int32)}
     */
    static FULLY_UNKNOWN_TRANSPARENT => -3

    /**
     * Native name: D3D12_RAYTRACING_OPACITY_MICROMAP_SPECIAL_INDEX_FULLY_UNKNOWN_OPAQUE
     * @type {Integer (Int32)}
     */
    static FULLY_UNKNOWN_OPAQUE => -4
}
