#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Defines a shader macro.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ns-d3dcommon-d3d_shader_macro
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct D3D_SHADER_MACRO {
    #StructPack 8

    /**
     * The macro name.
     */
    Name : PSTR

    /**
     * The macro definition.
     */
    Definition : PSTR

}
