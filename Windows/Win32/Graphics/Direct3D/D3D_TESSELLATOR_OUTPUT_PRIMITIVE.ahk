#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_tessellator_output_primitive
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_TESSELLATOR_OUTPUT_PRIMITIVE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_OUTPUT_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_OUTPUT_POINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_OUTPUT_LINE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_OUTPUT_TRIANGLE_CW => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_OUTPUT_TRIANGLE_CCW => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_OUTPUT_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_OUTPUT_POINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_OUTPUT_LINE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_OUTPUT_TRIANGLE_CW => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_OUTPUT_TRIANGLE_CCW => 4
}
