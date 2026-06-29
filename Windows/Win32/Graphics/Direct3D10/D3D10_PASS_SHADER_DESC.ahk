#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ID3D10EffectShaderVariable.ahk" { ID3D10EffectShaderVariable }

/**
 * Describes an effect variable that contains a shader.
 * @remarks
 * To get a shader description, call a method like <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effectpass-getvertexshaderdesc">ID3D10EffectPass::GetVertexShaderDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/ns-d3d10effect-d3d10_pass_shader_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_PASS_SHADER_DESC {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectshadervariable">ID3D10EffectShaderVariable</a>*</b>
     * 
     * A pointer to the variable that the shader came from. If it is an inline shader assignment, the returned interface will be an anonymous shader variable, which is not retrievable any other way.  Its name in the variable description will be "$Anonymous". If there is no assignment of this type in the pass block, this will point to a shader variable that returns false when IsValid is called.
     */
    pShaderVariable : ID3D10EffectShaderVariable

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based array index; otherwise 0.
     */
    ShaderIndex : UInt32

}
