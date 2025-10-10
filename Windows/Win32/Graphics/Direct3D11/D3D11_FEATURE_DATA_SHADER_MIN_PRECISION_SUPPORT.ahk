#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes precision support options for shaders in the current graphics driver.
 * @remarks
 * 
  * For hardware at Direct3D 10 and higher <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature levels</a>, the runtime sets both members identically.  For hardware at Direct3D 9.3 and lower feature levels, the runtime can set a lower precision support in the <b>PixelShaderMinPrecision</b> member than the <b>AllOtherShaderStagesMinPrecision</b> member; for 9.3 and lower, all other shader stages represent only the vertex shader.
  * 
  * For more info about HLSL minimum precision, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/direct3d-11-1-features">using HLSL minimum precision</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_feature_data_shader_min_precision_support
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_SHADER_MIN_PRECISION_SUPPORT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_shader_min_precision_support">D3D11_SHADER_MIN_PRECISION_SUPPORT</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies minimum precision levels that the driver supports for the pixel shader. A value of zero indicates that the driver supports only full 32-bit precision for the pixel shader.
     * @type {Integer}
     */
    PixelShaderMinPrecision {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_shader_min_precision_support">D3D11_SHADER_MIN_PRECISION_SUPPORT</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies minimum precision levels that the driver supports for all other shader stages. A value of zero indicates that the driver supports only full 32-bit precision for all other shader stages.
     * @type {Integer}
     */
    AllOtherShaderStagesMinPrecision {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
