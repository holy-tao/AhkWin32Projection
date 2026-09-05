#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of sampler filter reduction.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_sampler_desc">D3D11_SAMPLER_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_filter_reduction_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_FILTER_REDUCTION_TYPE extends Win32Enum {

    /**
     * Indicates standard (default) filter reduction.
     * Native name: D3D11_FILTER_REDUCTION_TYPE_STANDARD
     * @type {Integer (Int32)}
     */
    static STANDARD => 0

    /**
     * Indicates a comparison filter reduction.
     * Native name: D3D11_FILTER_REDUCTION_TYPE_COMPARISON
     * @type {Integer (Int32)}
     */
    static COMPARISON => 1

    /**
     * Indicates minimum filter reduction.
     * Native name: D3D11_FILTER_REDUCTION_TYPE_MINIMUM
     * @type {Integer (Int32)}
     */
    static MINIMUM => 2

    /**
     * Indicates maximum filter reduction.
     * Native name: D3D11_FILTER_REDUCTION_TYPE_MAXIMUM
     * @type {Integer (Int32)}
     */
    static MAXIMUM => 3
}
