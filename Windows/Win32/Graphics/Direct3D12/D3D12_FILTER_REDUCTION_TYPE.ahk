#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of filter reduction.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_sampler_desc">D3D12_SAMPLER_DESC</a> structure. Also, refer to the remarks for <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_filter">D3D12_FILTER</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_filter_reduction_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FILTER_REDUCTION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The filter type is standard.
     * @type {Integer (Int32)}
     */
    static D3D12_FILTER_REDUCTION_TYPE_STANDARD => 0

    /**
     * The filter type is comparison.
     * @type {Integer (Int32)}
     */
    static D3D12_FILTER_REDUCTION_TYPE_COMPARISON => 1

    /**
     * The filter type is minimum.
     * @type {Integer (Int32)}
     */
    static D3D12_FILTER_REDUCTION_TYPE_MINIMUM => 2

    /**
     * The filter type is maximum.
     * @type {Integer (Int32)}
     */
    static D3D12_FILTER_REDUCTION_TYPE_MAXIMUM => 3
}
