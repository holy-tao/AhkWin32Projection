#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify a shading rate combiner (for variable-rate shading, or VRS).
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_shading_rate_combiner
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADING_RATE_COMBINER{

    /**
     * Specifies the combiner `C.xy = A.xy`, for combiner (C) and inputs (A and B).
     * @type {Integer (Int32)}
     */
    static D3D12_SHADING_RATE_COMBINER_PASSTHROUGH => 0

    /**
     * Specifies the combiner `C.xy = B.xy`, for combiner (C) and inputs (A and B).
     * @type {Integer (Int32)}
     */
    static D3D12_SHADING_RATE_COMBINER_OVERRIDE => 1

    /**
     * Specifies the combiner `C.xy = max(A.xy, B.xy)`, for combiner (C) and inputs (A and B).
     * @type {Integer (Int32)}
     */
    static D3D12_SHADING_RATE_COMBINER_MIN => 2

    /**
     * Specifies the combiner `C.xy = min(A.xy, B.xy)`, for combiner (C) and inputs (A and B).
     * @type {Integer (Int32)}
     */
    static D3D12_SHADING_RATE_COMBINER_MAX => 3

    /**
     * Specifies the combiner C.xy = min(maxRate, A.xy + B.xy)`, for combiner (C) and inputs (A and B).
     * @type {Integer (Int32)}
     */
    static D3D12_SHADING_RATE_COMBINER_SUM => 4
}
