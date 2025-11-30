#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_tessellator_partitioning
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_TESSELLATOR_PARTITIONING extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_PARTITIONING_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_PARTITIONING_INTEGER => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_PARTITIONING_POW2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_PARTITIONING_FRACTIONAL_ODD => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_PARTITIONING_FRACTIONAL_EVEN => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_PARTITIONING_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_PARTITIONING_INTEGER => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_PARTITIONING_POW2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_PARTITIONING_FRACTIONAL_ODD => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_PARTITIONING_FRACTIONAL_EVEN => 4
}
