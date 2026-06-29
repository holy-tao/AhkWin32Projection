#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Direct3D\D3D_SHADER_VARIABLE_TYPE.ahk" { D3D_SHADER_VARIABLE_TYPE }

/**
 * Represents information about a shader source variable.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_var_info
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_SHADER_DEBUG_VAR_INFO {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into token list for declaring identifier.
     */
    TokenId : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_type">D3D10_SHADER_VARIABLE_TYPE</a></b>
     * 
     * The variable type. <b>Type</b> is only required for arrays.
     */
    Type : D3D_SHADER_VARIABLE_TYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register the variable is stored in.
     */
    Register : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The original variable that declared this variable.
     */
    Component : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset into the scope variable array defined in <a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_info">D3D10_SHADER_DEBUG_INFO</a>.
     */
    ScopeVar : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * This variable's offset in its <b>ScopeVar</b>.
     */
    ScopeVarOffset : UInt32

}
