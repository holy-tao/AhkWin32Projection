#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Output primitive types.
 * @remarks
 * The output primitive type determines how the tessellator output data is organized; this enumeration is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_shader_desc">D3D11_SHADER_DESC</a>.
 * 
 * The <b>D3D11_TESSELLATOR_OUTPUT_PRIMITIVE</b>     enumeration is type defined in the  D3D11Shader.h header file as a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_tessellator_output_primitive">D3D_TESSELLATOR_OUTPUT_PRIMITIVE</a> enumeration, which is fully defined in the  D3DCommon.h header file.
 * 
 * 
 * ```
 * 
 * typedef D3D_TESSELLATOR_OUTPUT_PRIMITIVE D3D11_TESSELLATOR_OUTPUT_PRIMITIVE;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_tessellator_output_primitive
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_TESSELLATOR_OUTPUT_PRIMITIVE extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_OUTPUT_UNDEFINED => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_OUTPUT_POINT => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_OUTPUT_LINE => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_OUTPUT_TRIANGLE_CW => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_OUTPUT_TRIANGLE_CCW => 4

    /**
     * The output primitive type is undefined.
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_OUTPUT_UNDEFINED => 0

    /**
     * The output primitive type is a point.
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_OUTPUT_POINT => 1

    /**
     * The output primitive type is a line.
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_OUTPUT_LINE => 2

    /**
     * The output primitive type is a clockwise triangle.
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_OUTPUT_TRIANGLE_CW => 3

    /**
     * The output primitive type is a counter clockwise triangle.
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_OUTPUT_TRIANGLE_CCW => 4
}
