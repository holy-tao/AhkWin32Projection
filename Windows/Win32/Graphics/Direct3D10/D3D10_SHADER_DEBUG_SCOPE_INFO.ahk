#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D10_SHADER_DEBUG_SCOPETYPE.ahk" { D3D10_SHADER_DEBUG_SCOPETYPE }

/**
 * Contains scope data that maps variable names to debug variables.
 * @remarks
 * The <b>D3D10_SHADER_DEBUG_SCOPE_INFO</b> structure is used with the <a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_info">D3D10_SHADER_DEBUG_INFO</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_scope_info
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_SHADER_DEBUG_SCOPE_INFO {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ne-d3d10_1shader-d3d10_shader_debug_scopetype">D3D10_SHADER_DEBUG_SCOPETYPE</a></b>
     * 
     * Specifies the scope type.
     */
    ScopeType : D3D10_SHADER_DEBUG_SCOPETYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset to the name of scope in the strings list.
     */
    Name : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Length of the string pointed to by <b>Name</b>.
     */
    uNameLen : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of variables.
     */
    uVariables : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset an array of UINT values with <b>uVariables</b> members containing the scope variable list.
     */
    VariableData : UInt32

}
