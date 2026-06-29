#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D10_SHADER_DEBUG_REGTYPE.ahk" { D3D10_SHADER_DEBUG_REGTYPE }
#Import ".\D3D10_SHADER_DEBUG_OUTPUTVAR.ahk" { D3D10_SHADER_DEBUG_OUTPUTVAR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes a shader output register.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_outputreg_info
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_SHADER_DEBUG_OUTPUTREG_INFO {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ne-d3d10_1shader-d3d10_shader_debug_regtype">D3D10_SHADER_DEBUG_REGTYPE</a></b>
     * 
     * Must be D3D10_SHADER_DEBUG_REG_TEMP, D3D10_SHADER_DEBUG_REG_TEMPARRAY or D3D10_SHADER_DEBUG_REG_OUTPUT.
     */
    OutputRegisterSet : D3D10_SHADER_DEBUG_REGTYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value of -1 indicates no output.
     */
    OutputReg : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * If <b>OutputRegisterSet</b> is D3D10_SHADER_DEBUG_REG_TEMPARRAY this indicates which temp array.
     */
    TempArrayReg : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value of -1 means the component is masked out.
     */
    OutputComponents : UInt32[4]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_outputvar">D3D10_SHADER_DEBUG_OUTPUTVAR</a></b>
     * 
     * Indicates which variable the instruction is writing per-component.
     */
    OutputVars : D3D10_SHADER_DEBUG_OUTPUTVAR[4]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset from OutputReg of the element being written to. Used when writing to an indexable temp array or an output.
     */
    IndexReg : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset from OutputReg of the element being written to. Used when writing to an indexable temp array or an output.
     */
    IndexComp : UInt32

}
