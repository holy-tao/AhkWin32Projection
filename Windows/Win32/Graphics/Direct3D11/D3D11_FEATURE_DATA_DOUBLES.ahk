#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes double data type support in the current graphics driver.
 * @remarks
 * 
 * If the runtime sets <b>DoublePrecisionFloatShaderOps</b> to  <b>TRUE</b>, the hardware and driver support the following <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3d11-graphics-reference-sm5">Shader Model 5</a> instructions:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dadd---sm5---asm-">dadd</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dmax--sm5---asm-">dmax</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dmin--sm5---asm-">dmin</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dmul--sm5---asm-">dmul</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/deq--sm5---asm-">deq</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dge--sm5---asm-">dge</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dlt--sm5---asm-">dlt</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dne--sm5---asm-">dne</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dmov--sm5---asm-">dmov</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dmovc--sm5---asm-">dmovc</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dtof--sm5---asm-">dtof</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/ftod--sm5---asm-">ftod</a>
 * </li>
 * </ul>
 * <div class="alert"><b>Note</b>  If <b>DoublePrecisionFloatShaderOps</b> is <b>TRUE</b>, the hardware and driver do not necessarily support double-precision division.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_feature_data_doubles
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_DOUBLES extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Specifies whether <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-scalar">double</a> types are allowed. If <b>TRUE</b>, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-scalar">double</a> types are allowed; otherwise <b>FALSE</b>. The runtime must set <b>DoublePrecisionFloatShaderOps</b> to  <b>TRUE</b> in order for you to use any <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl">HLSL</a> shader that is compiled with a <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-scalar">double</a> type.
     * @type {BOOL}
     */
    DoublePrecisionFloatShaderOps {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
