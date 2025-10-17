#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a shader output variable.
 * @see https://docs.microsoft.com/windows/win32/api//d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_outputvar
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_SHADER_DEBUG_OUTPUTVAR extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index variable being written to or if -1 it's not going to a variable.
     * @type {Integer}
     */
    Var {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Minimum UINT value.
     * @type {Integer}
     */
    uValueMin {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Maximum UINT value.
     * @type {Integer}
     */
    uValueMax {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Minimum INT value.
     * @type {Integer}
     */
    iValueMin {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Maximum UINT value.
     * @type {Integer}
     */
    iValueMax {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Minimum FLOAT value.
     * @type {Float}
     */
    fValueMin {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Maximum FLOAT value.
     * @type {Float}
     */
    fValueMax {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Indicates whether the output variable can evaluate to not a number.
     * @type {BOOL}
     */
    bNaNPossible {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Indicates whether the output variable can evaluate to infinity.
     * @type {BOOL}
     */
    bInfPossible {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
