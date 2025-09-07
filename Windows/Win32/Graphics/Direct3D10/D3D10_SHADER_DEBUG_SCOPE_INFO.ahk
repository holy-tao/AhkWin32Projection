#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains scope data that maps variable names to debug variables.
 * @remarks
 * The <b>D3D10_SHADER_DEBUG_SCOPE_INFO</b> structure is used with the <a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_info">D3D10_SHADER_DEBUG_INFO</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_scope_info
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_SHADER_DEBUG_SCOPE_INFO extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ne-d3d10_1shader-d3d10_shader_debug_scopetype">D3D10_SHADER_DEBUG_SCOPETYPE</a></b>
     * 
     * Specifies the scope type.
     * @type {Integer}
     */
    ScopeType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset to the name of scope in the strings list.
     * @type {Integer}
     */
    Name {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Length of the string pointed to by <b>Name</b>.
     * @type {Integer}
     */
    uNameLen {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of variables.
     * @type {Integer}
     */
    uVariables {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset an array of UINT values with <b>uVariables</b> members containing the scope variable list.
     * @type {Integer}
     */
    VariableData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
