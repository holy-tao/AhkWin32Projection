#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D10_SHADER_DEBUG_REGTYPE.ahk" { D3D10_SHADER_DEBUG_REGTYPE }

/**
 * Describes a shader input.
 * @remarks
 * The <b>D3D10_SHADER_DEBUG_INPUT_INFO</b> structure is used with the <a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_info">D3D10_SHADER_DEBUG_INFO</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_input_info
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_SHADER_DEBUG_INPUT_INFO {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into array of variables to initialize.
     */
    Var : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ne-d3d10_1shader-d3d10_shader_debug_regtype">D3D10_SHADER_DEBUG_REGTYPE</a></b>
     * 
     * Must be D3D10_SHADER_DEBUG_REG_INPUT, D3D10_SHADER_DEBUG_REG_CBUFFER or D3D10_SHADER_DEBUG_REG_TBUFFER.
     */
    InitialRegisterSet : D3D10_SHADER_DEBUG_REGTYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Will contain a cbuffer or tbuffer slot, geometry shader input primitive number, identifying register for an indexable temp, or -1.
     */
    InitialBank : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register in register set.  <b>InitialRegister</b> will be -1 if it is temporary.
     */
    InitialRegister : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Gives the component.  <b>InitialComponent</b> will be -1 it is temporary.
     */
    InitialComponent : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Initial value if the variable is a literal.
     */
    InitialValue : UInt32

}
