#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a shader scope variable.
 * @remarks
 * 
  * The <b>D3D10_SHADER_DEBUG_SCOPEVAR_INFO</b> structure is used with the <a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_info">D3D10_SHADER_DEBUG_INFO</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_scopevar_info
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_SHADER_DEBUG_SCOPEVAR_INFO extends Win32Struct
{
    static sizeof => 44

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into variable token.
     * @type {Integer}
     */
    TokenId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ne-d3d10_1shader-d3d10_shader_debug_vartype">D3D10_SHADER_DEBUG_VARTYPE</a></b>
     * 
     * Indicates whether this is a variable or function.
     * @type {Integer}
     */
    VarType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_class">D3D10_SHADER_VARIABLE_CLASS</a></b>
     * 
     * Indicates the variable class.
     * @type {Integer}
     */
    Class {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of row for matrices.
     * @type {Integer}
     */
    Rows {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of columns for vectors or matrices.
     * @type {Integer}
     */
    Columns {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Gives a scope to look up struct members.  This member will be -1 if <b>D3D10_SHADER_DEBUG_SCOPEVAR_INFO</b> does not refer to a struct.
     * @type {Integer}
     */
    StructMemberScope {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of array indices. For example a three dimensional array would have a value of 3 for <b>uArrayIndices</b>.
     * @type {Integer}
     */
    uArrayIndices {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset to an array of UINT values <b>uArrayIndices</b> long.  The array contains the maximum value for each index. For example an array a[3][2][1] would have the values {3,2,1} at the offset pointed to by <b>ArrayElements</b>.
     * @type {Integer}
     */
    ArrayElements {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset to an array of UINT values <b>uArrayIndices</b> long.  The array contains the stride for each array index.  For example an array a[3][2][1] would have the values {2,1,1} at the offset pointed to by <b>ArrayStrides</b>.
     * @type {Integer}
     */
    ArrayStrides {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of variables.
     * @type {Integer}
     */
    uVariables {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the first variable, later variables are offsets from this one.
     * @type {Integer}
     */
    uFirstVariable {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
