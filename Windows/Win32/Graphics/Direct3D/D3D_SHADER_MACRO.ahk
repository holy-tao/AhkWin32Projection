#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Defines a shader macro.
 * @remarks
 * 
  * You can use shader macros in your shaders. The <b>D3D_SHADER_MACRO</b> structure defines a single shader macro as shown in the following example:
  * 
  * 
  * ```
  * 
  * D3D_SHADER_MACRO Shader_Macros[] = { "zero", "0", NULL, NULL };
  * 
  * ```
  * 
  * 
  * The following shader or effect creation functions take an array of shader macros as an input parameter:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nf-d3d10shader-d3d10compileshader">D3D10CompileShader</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3dx10createeffectfromfile">D3DX10CreateEffectFromFile</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3dx10preprocessshaderfromfile">D3DX10PreprocessShaderFromFile</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3dx11createasyncshaderpreprocessprocessor">D3DX11CreateAsyncShaderPreprocessProcessor</a>
  * </li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3dcommon/ns-d3dcommon-d3d_shader_macro
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_SHADER_MACRO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The macro name.
     * @type {PSTR}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := PSTR(this.ptr + 0)
            return this.__Name
        }
    }

    /**
     * The macro definition.
     * @type {PSTR}
     */
    Definition{
        get {
            if(!this.HasProp("__Definition"))
                this.__Definition := PSTR(this.ptr + 8)
            return this.__Definition
        }
    }
}
