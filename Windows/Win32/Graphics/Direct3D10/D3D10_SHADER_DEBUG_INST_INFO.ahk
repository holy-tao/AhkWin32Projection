#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D10_SHADER_DEBUG_OUTPUTVAR.ahk
#Include .\D3D10_SHADER_DEBUG_OUTPUTREG_INFO.ahk

/**
 * Contains instruction data.
 * @remarks
 * 
  * The <b>D3D10_SHADER_DEBUG_INST_INFO</b> structure is used with the <a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_info">D3D10_SHADER_DEBUG_INFO</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_inst_info
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_SHADER_DEBUG_INST_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Id of the instruction.
     * @type {Integer}
     */
    Id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Type of instruction.
     * @type {Integer}
     */
    Opcode {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Must be 0, 1 or 2.
     * @type {Integer}
     */
    uOutputs {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_outputreg_info">D3D10_SHADER_DEBUG_OUTPUTREG_INFO</a></b>
     * 
     * Array containing the outputs of the instruction.
     * @type {Array<D3D10_SHADER_DEBUG_OUTPUTREG_INFO>}
     */
    pOutputs{
        get {
            if(!this.HasProp("__pOutputsProxyArray"))
                this.__pOutputsProxyArray := Win32FixedArray(this.ptr + 16, 2, D3D10_SHADER_DEBUG_OUTPUTREG_INFO, "")
            return this.__pOutputsProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the list of tokens for this instruction's token.
     * @type {Integer}
     */
    TokenId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of function calls deep this instruction is.
     * @type {Integer}
     */
    NestingLevel {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of scopes.
     * @type {Integer}
     */
    Scopes {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset to an array of UINT values with <b>Scopes</b> elements.
     * @type {Integer}
     */
    ScopeInfo {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * 
     * @type {Integer}
     */
    AccessedVars {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * 
     * @type {Integer}
     */
    AccessedVarsInfo {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
