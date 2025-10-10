#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a shader-variable type.
 * @remarks
 * 
  * Get a shader-variable-type description by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectiontype-getdesc">ID3D10ShaderReflectionType::GetDesc</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/ns-d3d10shader-d3d10_shader_type_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_SHADER_TYPE_DESC extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_class">D3D10_SHADER_VARIABLE_CLASS</a></b>
     * 
     * Identifies the variable class as one of scalar, vector, matrix or object. See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_class">D3D10_SHADER_VARIABLE_CLASS</a>.
     * @type {Integer}
     */
    Class {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_type">D3D10_SHADER_VARIABLE_TYPE</a></b>
     * 
     * The variable type. See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_type">D3D10_SHADER_VARIABLE_TYPE</a>.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of rows in a matrix. Otherwise a numeric type returns 1, any other type returns 0.
     * @type {Integer}
     */
    Rows {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of columns in a matrix. Otherwise a numeric type returns 1, any other type returns 0.
     * @type {Integer}
     */
    Columns {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of elements in an array; otherwise 0.
     * @type {Integer}
     */
    Elements {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of members in the structure; otherwise 0.
     * @type {Integer}
     */
    Members {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset, in bytes, between the start of the parent structure and this variable.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
