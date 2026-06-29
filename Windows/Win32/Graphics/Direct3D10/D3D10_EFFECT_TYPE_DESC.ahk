#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Direct3D\D3D_SHADER_VARIABLE_TYPE.ahk" { D3D_SHADER_VARIABLE_TYPE }
#Import "..\Direct3D\D3D_SHADER_VARIABLE_CLASS.ahk" { D3D_SHADER_VARIABLE_CLASS }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes an effect-variable type.
 * @remarks
 * To get an effect-variable type, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effecttype-getdesc">ID3D10EffectType::GetDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/ns-d3d10effect-d3d10_effect_type_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_EFFECT_TYPE_DESC {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A string that contains the variable name.
     */
    TypeName : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_class">D3D10_SHADER_VARIABLE_CLASS</a></b>
     * 
     * The variable class (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_class">D3D10_SHADER_VARIABLE_CLASS</a>).
     */
    Class : D3D_SHADER_VARIABLE_CLASS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_type">D3D10_SHADER_VARIABLE_TYPE</a></b>
     * 
     * The variable type (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_type">D3D10_SHADER_VARIABLE_TYPE</a>).
     */
    Type : D3D_SHADER_VARIABLE_TYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of elements if the variable is an array; otherwise 0.
     */
    Elements : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of members if the variable is a structure; otherwise 0.
     */
    Members : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of rows if the variable is a matrix; otherwise 0.
     */
    Rows : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of columns if the variable is a matrix; otherwise 0.
     */
    Columns : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of bytes that the variable consumes when it is packed tightly by the compiler.
     */
    PackedSize : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of bytes that the variable consumes before it is packed by the compiler.
     */
    UnpackedSize : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of bytes between elements.
     */
    Stride : UInt32

}
