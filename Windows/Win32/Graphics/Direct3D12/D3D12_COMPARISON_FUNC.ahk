#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies comparison options.
 * @remarks
 * A comparison option determines how the runtime compares source (new) data against destination (existing) data before storing the new data. The comparison option is declared in a description before an object is created. The API allows you to set a comparison option for <ul>
 * <li>a depth-stencil buffer (<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencil_desc">D3D12_DEPTH_STENCIL_DESC</a>)
 *             </li>
 * <li>depth-stencil operations (<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencilop_desc">D3D12_DEPTH_STENCILOP_DESC</a>)
 *             </li>
 * <li>sampler state (<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_sampler_desc">D3D12_SAMPLER_DESC</a>)
 *             </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_comparison_func
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_COMPARISON_FUNC extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMPARISON_FUNC_NONE => 0

    /**
     * Never pass the comparison.
     * @type {Integer (Int32)}
     */
    static D3D12_COMPARISON_FUNC_NEVER => 1

    /**
     * If the source data is less than the destination data, the comparison passes.
     * @type {Integer (Int32)}
     */
    static D3D12_COMPARISON_FUNC_LESS => 2

    /**
     * If the source data is equal to the destination data, the comparison passes.
     * @type {Integer (Int32)}
     */
    static D3D12_COMPARISON_FUNC_EQUAL => 3

    /**
     * If the source data is less than or equal to the destination data, the comparison passes.
     * @type {Integer (Int32)}
     */
    static D3D12_COMPARISON_FUNC_LESS_EQUAL => 4

    /**
     * If the source data is greater than the destination data, the comparison passes.
     * @type {Integer (Int32)}
     */
    static D3D12_COMPARISON_FUNC_GREATER => 5

    /**
     * If the source data is not equal to the destination data, the comparison passes.
     * @type {Integer (Int32)}
     */
    static D3D12_COMPARISON_FUNC_NOT_EQUAL => 6

    /**
     * If the source data is greater than or equal to the destination data, the comparison passes.
     * @type {Integer (Int32)}
     */
    static D3D12_COMPARISON_FUNC_GREATER_EQUAL => 7

    /**
     * Always pass the comparison.
     * @type {Integer (Int32)}
     */
    static D3D12_COMPARISON_FUNC_ALWAYS => 8
}
