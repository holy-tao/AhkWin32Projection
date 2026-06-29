#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D10_SHADER_DEBUG_REGTYPE.ahk" { D3D10_SHADER_DEBUG_REGTYPE }
#Import ".\D3D10_SHADER_DEBUG_OUTPUTVAR.ahk" { D3D10_SHADER_DEBUG_OUTPUTVAR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D10_SHADER_DEBUG_OUTPUTREG_INFO.ahk" { D3D10_SHADER_DEBUG_OUTPUTREG_INFO }

/**
 * Contains instruction data.
 * @remarks
 * The <b>D3D10_SHADER_DEBUG_INST_INFO</b> structure is used with the <a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_info">D3D10_SHADER_DEBUG_INFO</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_inst_info
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_SHADER_DEBUG_INST_INFO {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Id of the instruction.
     */
    Id : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Type of instruction.
     */
    Opcode : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Must be 0, 1 or 2.
     */
    uOutputs : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_outputreg_info">D3D10_SHADER_DEBUG_OUTPUTREG_INFO</a></b>
     * 
     * Array containing the outputs of the instruction.
     */
    pOutputs : D3D10_SHADER_DEBUG_OUTPUTREG_INFO[2]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the list of tokens for this instruction's token.
     */
    TokenId : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of function calls deep this instruction is.
     */
    NestingLevel : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of scopes.
     */
    Scopes : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset to an array of UINT values with <b>Scopes</b> elements.
     */
    ScopeInfo : UInt32

    AccessedVars : UInt32

    AccessedVarsInfo : UInt32

}
