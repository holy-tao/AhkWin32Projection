#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an effect-variable type.
 * @remarks
 * 
  * To get an effect-variable type, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effecttype-getdesc">ID3D10EffectType::GetDesc</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/ns-d3d10effect-d3d10_effect_type_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_EFFECT_TYPE_DESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A string that contains the variable name.
     * @type {PSTR}
     */
    TypeName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_class">D3D10_SHADER_VARIABLE_CLASS</a></b>
     * 
     * The variable class (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_class">D3D10_SHADER_VARIABLE_CLASS</a>).
     * @type {Integer}
     */
    Class {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_type">D3D10_SHADER_VARIABLE_TYPE</a></b>
     * 
     * The variable type (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_type">D3D10_SHADER_VARIABLE_TYPE</a>).
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of elements if the variable is an array; otherwise 0.
     * @type {Integer}
     */
    Elements {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of members if the variable is a structure; otherwise 0.
     * @type {Integer}
     */
    Members {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of rows if the variable is a matrix; otherwise 0.
     * @type {Integer}
     */
    Rows {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of columns if the variable is a matrix; otherwise 0.
     * @type {Integer}
     */
    Columns {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of bytes that the variable consumes when it is packed tightly by the compiler.
     * @type {Integer}
     */
    PackedSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of bytes that the variable consumes before it is packed by the compiler.
     * @type {Integer}
     */
    UnpackedSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of bytes between elements.
     * @type {Integer}
     */
    Stride {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
