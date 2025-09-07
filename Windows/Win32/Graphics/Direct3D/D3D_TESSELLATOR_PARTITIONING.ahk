#Requires AutoHotkey v2.0.0 64-bit

/**
 * Partitioning options.
 * @remarks
 * During tessellation, the partition option helps to determine how the algorithm chooses the next partition value; this enumeration is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_shader_desc">D3D11_SHADER_DESC</a>.
  * 
  * The      <b>D3D11_TESSELLATOR_PARTITIONING</b> enumeration is type defined in the  D3D11Shader.h header file as a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_tessellator_partitioning">D3D_TESSELLATOR_PARTITIONING</a> enumeration, which is fully defined in the  D3DCommon.h header file.
  * 
  * 
  * ```
  * 
  * typedef D3D_TESSELLATOR_PARTITIONING D3D11_TESSELLATOR_PARTITIONING;
  * ```
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_tessellator_partitioning
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_TESSELLATOR_PARTITIONING{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_PARTITIONING_UNDEFINED => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_PARTITIONING_INTEGER => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_PARTITIONING_POW2 => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_PARTITIONING_FRACTIONAL_ODD => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_TESSELLATOR_PARTITIONING_FRACTIONAL_EVEN => 4

    /**
     * The partitioning type is undefined.
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_PARTITIONING_UNDEFINED => 0

    /**
     * Partition with integers only.
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_PARTITIONING_INTEGER => 1

    /**
     * Partition with a power-of-two number only.
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_PARTITIONING_POW2 => 2

    /**
     * Partition with an odd, fractional number.
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_PARTITIONING_FRACTIONAL_ODD => 3

    /**
     * Partition with an even, fractional number.
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_PARTITIONING_FRACTIONAL_EVEN => 4
}
