#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes an effect shader.
 * @remarks
 * To get an effect-shader description, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getshaderdesc">ID3D10EffectShaderVariable::GetShaderDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/ns-d3d10effect-d3d10_effect_shader_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_EFFECT_SHADER_DESC {
    #StructPack 8

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>*</b>
     * 
     * Passed into CreateInputLayout. Only valid on a vertex shader or geometry shader. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createinputlayout">ID3D10Device_CreateInputLayout</a>.
     */
    pInputSignature : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> is the shader is defined inline; otherwise <b>FALSE</b>.
     */
    IsInline : BOOL

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>*</b>
     * 
     * A pointer to the compiled shader.
     */
    pBytecode : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The length of pBytecode.
     */
    BytecodeLength : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A string that contains a declaration of the <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-pipeline-stages">stream output </a> from a geometry shader.
     */
    SODecl : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of entries in the input signature.
     */
    NumInputSignatureEntries : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of entries in the output signature.
     */
    NumOutputSignatureEntries : UInt32

}
