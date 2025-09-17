#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a shader-variable type. (D3D12_SHADER_TYPE_DESC)
 * @remarks
 * Get a shader-variable-type description by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflectiontype-getdesc">ID3D12ShaderReflectionType::GetDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_type_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADER_TYPE_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_class">D3D_SHADER_VARIABLE_CLASS</a>-typed value that identifies the variable class as one of scalar, vector, matrix, object, and so on.
     * @type {Integer}
     */
    Class {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_type">D3D_SHADER_VARIABLE_TYPE</a>-typed value that identifies the variable type.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Number of rows in a matrix. Otherwise a numeric type returns 1, any other type returns 0.
     * @type {Integer}
     */
    Rows {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of columns in a matrix. Otherwise a numeric type returns 1, any other type returns 0.
     * @type {Integer}
     */
    Columns {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Number of elements in an array; otherwise 0.
     * @type {Integer}
     */
    Elements {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of members in the structure; otherwise 0.
     * @type {Integer}
     */
    Members {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Offset, in bytes, between the start of the parent structure and this variable. Can be 0 if not a structure member.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Name of the shader-variable type. This member can be <b>NULL</b> if it isn't used. This member supports dynamic shader linkage interface types, which have names. For more info about dynamic shader linkage, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/overviews-direct3d-11-hlsl-dynamic-linking">Dynamic Linking</a>.
     * @type {Pointer<Byte>}
     */
    Name {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
