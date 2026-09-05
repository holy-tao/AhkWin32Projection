#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of filter reduction.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_sampler_desc">D3D12_SAMPLER_DESC</a> structure. Also, refer to the remarks for <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_filter">D3D12_FILTER</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_filter_reduction_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_FILTER_REDUCTION_TYPE extends Win32Enum {

    /**
     * The filter type is standard.
     * Native name: D3D12_FILTER_REDUCTION_TYPE_STANDARD
     * @type {Integer (Int32)}
     */
    static STANDARD => 0

    /**
     * The filter type is comparison.
     * Native name: D3D12_FILTER_REDUCTION_TYPE_COMPARISON
     * @type {Integer (Int32)}
     */
    static COMPARISON => 1

    /**
     * The filter type is minimum.
     * Native name: D3D12_FILTER_REDUCTION_TYPE_MINIMUM
     * @type {Integer (Int32)}
     */
    static MINIMUM => 2

    /**
     * The filter type is maximum.
     * Native name: D3D12_FILTER_REDUCTION_TYPE_MAXIMUM
     * @type {Integer (Int32)}
     */
    static MAXIMUM => 3
}
