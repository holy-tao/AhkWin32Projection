#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Direct3D\D3D_SHADER_VARIABLE_TYPE.ahk" { D3D_SHADER_VARIABLE_TYPE }
#Import "..\Direct3D\D3D_SHADER_VARIABLE_CLASS.ahk" { D3D_SHADER_VARIABLE_CLASS }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes a shader-variable type. (D3D12_SHADER_TYPE_DESC)
 * @remarks
 * Get a shader-variable-type description by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflectiontype-getdesc">ID3D12ShaderReflectionType::GetDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_type_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SHADER_TYPE_DESC {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_class">D3D_SHADER_VARIABLE_CLASS</a>-typed value that identifies the variable class as one of scalar, vector, matrix, object, and so on.
     */
    Class : D3D_SHADER_VARIABLE_CLASS

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_type">D3D_SHADER_VARIABLE_TYPE</a>-typed value that identifies the variable type.
     */
    Type : D3D_SHADER_VARIABLE_TYPE

    /**
     * Number of rows in a matrix. Otherwise a numeric type returns 1, any other type returns 0.
     */
    Rows : UInt32

    /**
     * Number of columns in a matrix. Otherwise a numeric type returns 1, any other type returns 0.
     */
    Columns : UInt32

    /**
     * Number of elements in an array; otherwise 0.
     */
    Elements : UInt32

    /**
     * Number of members in the structure; otherwise 0.
     */
    Members : UInt32

    /**
     * Offset, in bytes, between the start of the parent structure and this variable. Can be 0 if not a structure member.
     */
    Offset : UInt32

    /**
     * Name of the shader-variable type. This member can be <b>NULL</b> if it isn't used. This member supports dynamic shader linkage interface types, which have names. For more info about dynamic shader linkage, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/overviews-direct3d-11-hlsl-dynamic-linking">Dynamic Linking</a>.
     */
    Name : PSTR

}
