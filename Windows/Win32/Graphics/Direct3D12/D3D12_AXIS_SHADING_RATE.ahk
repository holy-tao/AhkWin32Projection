#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify the shading rate (for variable-rate shading, or VRS) along a horizontal or vertical axis.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_axis_shading_rate
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_AXIS_SHADING_RATE{

    /**
     * Specifies a 1x shading rate for the axis.
     * @type {Integer (Int32)}
     */
    static D3D12_AXIS_SHADING_RATE_1X => 0

    /**
     * Specifies a 2x shading rate for the axis.
     * @type {Integer (Int32)}
     */
    static D3D12_AXIS_SHADING_RATE_2X => 1

    /**
     * Specifies a 4x shading rate for the axis.
     * @type {Integer (Int32)}
     */
    static D3D12_AXIS_SHADING_RATE_4X => 2
}
