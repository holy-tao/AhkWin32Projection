#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Direct3D\D3D_SHADER_VARIABLE_TYPE.ahk" { D3D_SHADER_VARIABLE_TYPE }
#Import "..\Direct3D\D3D_SHADER_VARIABLE_CLASS.ahk" { D3D_SHADER_VARIABLE_CLASS }

/**
 * Describes a shader-variable type. (D3D10_SHADER_TYPE_DESC)
 * @remarks
 * Get a shader-variable-type description by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectiontype-getdesc">ID3D10ShaderReflectionType::GetDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_shader_type_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_SHADER_TYPE_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_class">D3D10_SHADER_VARIABLE_CLASS</a></b>
     * 
     * Identifies the variable class as one of scalar, vector, matrix or object. See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_class">D3D10_SHADER_VARIABLE_CLASS</a>.
     */
    Class : D3D_SHADER_VARIABLE_CLASS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_type">D3D10_SHADER_VARIABLE_TYPE</a></b>
     * 
     * The variable type. See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_type">D3D10_SHADER_VARIABLE_TYPE</a>.
     */
    Type : D3D_SHADER_VARIABLE_TYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of rows in a matrix. Otherwise a numeric type returns 1, any other type returns 0.
     */
    Rows : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of columns in a matrix. Otherwise a numeric type returns 1, any other type returns 0.
     */
    Columns : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of elements in an array; otherwise 0.
     */
    Elements : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of members in the structure; otherwise 0.
     */
    Members : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset, in bytes, between the start of the parent structure and this variable.
     */
    Offset : UInt32

}
