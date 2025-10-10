#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Pixel shader driver caps.
 * @see https://docs.microsoft.com/windows/win32/api//d3d9caps/ns-d3d9caps-d3dpshadercaps2_0
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DPSHADERCAPS2_0 extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Instruction predication is supported if this value is nonzero. See <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/setp-comp---vs">setp_comp - vs</a>.
     * @type {Integer}
     */
    Caps {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Either 0 or 24, which represents the depth of the dynamic flow control instruction nesting. See <b>D3DPSHADERCAPS2_0</b>.
     * @type {Integer}
     */
    DynamicFlowControlDepth {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * The number of temporary registers supported. See <b>D3DPSHADERCAPS2_0</b>.
     * @type {Integer}
     */
    NumTemps {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * The depth of nesting of the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/loop---vs">loop - vs</a>/<a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/rep---vs">rep - vs</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/call---vs">call - vs</a>/<a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/callnz-bool---vs">callnz bool - vs</a> instructions. See <b>D3DPSHADERCAPS2_0</b>.
     * @type {Integer}
     */
    StaticFlowControlDepth {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * The number of instruction slots supported. See <b>D3DPSHADERCAPS2_0</b>.
     * @type {Integer}
     */
    NumInstructionSlots {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
