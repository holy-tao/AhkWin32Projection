#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the shading rate (for variable-rate shading, or VRS).
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_shading_rate
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADING_RATE extends Win32Enum{

    /**
     * Specifies no change to the shading rate.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADING_RATE_1X1 => 0

    /**
     * Specifies that the shading rate should reduce vertical resolution 2x.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADING_RATE_1X2 => 1

    /**
     * Specifies that the shading rate should reduce horizontal resolution 2x.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADING_RATE_2X1 => 4

    /**
     * Specifies that the shading rate should reduce the resolution of both axes 2x.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADING_RATE_2X2 => 5

    /**
     * Specifies that the shading rate should reduce horizontal resolution 2x, and reduce vertical resolution 4x.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADING_RATE_2X4 => 6

    /**
     * Specifies that the shading rate should reduce horizontal resolution 4x, and reduce vertical resolution 2x.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADING_RATE_4X2 => 9

    /**
     * Specifies that the shading rate should reduce the resolution of both axes 4x.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADING_RATE_4X4 => 10
}
