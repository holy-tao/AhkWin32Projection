#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D10_SHADER_DEBUG_VARTYPE.ahk" { D3D10_SHADER_DEBUG_VARTYPE }
#Import "..\Direct3D\D3D_SHADER_VARIABLE_CLASS.ahk" { D3D_SHADER_VARIABLE_CLASS }

/**
 * Describes a shader scope variable.
 * @remarks
 * The <b>D3D10_SHADER_DEBUG_SCOPEVAR_INFO</b> structure is used with the <a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_info">D3D10_SHADER_DEBUG_INFO</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_scopevar_info
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_SHADER_DEBUG_SCOPEVAR_INFO {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into variable token.
     */
    TokenId : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ne-d3d10_1shader-d3d10_shader_debug_vartype">D3D10_SHADER_DEBUG_VARTYPE</a></b>
     * 
     * Indicates whether this is a variable or function.
     */
    VarType : D3D10_SHADER_DEBUG_VARTYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_class">D3D10_SHADER_VARIABLE_CLASS</a></b>
     * 
     * Indicates the variable class.
     */
    Class : D3D_SHADER_VARIABLE_CLASS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of row for matrices.
     */
    Rows : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of columns for vectors or matrices.
     */
    Columns : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Gives a scope to look up struct members.  This member will be -1 if <b>D3D10_SHADER_DEBUG_SCOPEVAR_INFO</b> does not refer to a struct.
     */
    StructMemberScope : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of array indices. For example a three dimensional array would have a value of 3 for <b>uArrayIndices</b>.
     */
    uArrayIndices : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset to an array of UINT values <b>uArrayIndices</b> long.  The array contains the maximum value for each index. For example an array a[3][2][1] would have the values {3,2,1} at the offset pointed to by <b>ArrayElements</b>.
     */
    ArrayElements : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset to an array of UINT values <b>uArrayIndices</b> long.  The array contains the stride for each array index.  For example an array a[3][2][1] would have the values {2,1,1} at the offset pointed to by <b>ArrayStrides</b>.
     */
    ArrayStrides : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of variables.
     */
    uVariables : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the first variable, later variables are offsets from this one.
     */
    uFirstVariable : UInt32

}
