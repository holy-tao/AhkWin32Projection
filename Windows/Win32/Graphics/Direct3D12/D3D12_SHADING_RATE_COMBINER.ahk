#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a shading rate combiner (for variable-rate shading, or VRS).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shading_rate_combiner
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_SHADING_RATE_COMBINER extends Win32Enum {

    /**
     * Specifies the combiner `C.xy = A.xy`, for combiner (C) and inputs (A and B).
     * Native name: D3D12_SHADING_RATE_COMBINER_PASSTHROUGH
     * @type {Integer (Int32)}
     */
    static PASSTHROUGH => 0

    /**
     * Specifies the combiner `C.xy = B.xy`, for combiner (C) and inputs (A and B).
     * Native name: D3D12_SHADING_RATE_COMBINER_OVERRIDE
     * @type {Integer (Int32)}
     */
    static OVERRIDE => 1

    /**
     * Specifies the combiner `C.xy = max(A.xy, B.xy)`, for combiner (C) and inputs (A and B).
     * Native name: D3D12_SHADING_RATE_COMBINER_MIN
     * @type {Integer (Int32)}
     */
    static MIN => 2

    /**
     * Specifies the combiner `C.xy = min(A.xy, B.xy)`, for combiner (C) and inputs (A and B).
     * Native name: D3D12_SHADING_RATE_COMBINER_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3

    /**
     * Specifies the combiner C.xy = min(maxRate, A.xy + B.xy)`, for combiner (C) and inputs (A and B).
     * Native name: D3D12_SHADING_RATE_COMBINER_SUM
     * @type {Integer (Int32)}
     */
    static SUM => 4
}
