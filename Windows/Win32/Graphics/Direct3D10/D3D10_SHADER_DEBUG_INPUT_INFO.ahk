#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a shader input.
 * @remarks
 * 
  * The <b>D3D10_SHADER_DEBUG_INPUT_INFO</b> structure is used with the <a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_info">D3D10_SHADER_DEBUG_INFO</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_input_info
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_SHADER_DEBUG_INPUT_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into array of variables to initialize.
     * @type {Integer}
     */
    Var {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ne-d3d10_1shader-d3d10_shader_debug_regtype">D3D10_SHADER_DEBUG_REGTYPE</a></b>
     * 
     * Must be D3D10_SHADER_DEBUG_REG_INPUT, D3D10_SHADER_DEBUG_REG_CBUFFER or D3D10_SHADER_DEBUG_REG_TBUFFER.
     * @type {Integer}
     */
    InitialRegisterSet {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Will contain a cbuffer or tbuffer slot, geometry shader input primitive number, identifying register for an indexable temp, or -1.
     * @type {Integer}
     */
    InitialBank {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register in register set.  <b>InitialRegister</b> will be -1 if it is temporary.
     * @type {Integer}
     */
    InitialRegister {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Gives the component.  <b>InitialComponent</b> will be -1 it is temporary.
     * @type {Integer}
     */
    InitialComponent {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Initial value if the variable is a literal.
     * @type {Integer}
     */
    InitialValue {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
