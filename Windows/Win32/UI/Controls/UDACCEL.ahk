#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains acceleration information for an up-down control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-udaccel
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class UDACCEL extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Amount of elapsed time, in seconds, before the position change increment specified by 
     * 					<b>nInc</b> is used.
     * @type {Integer}
     */
    nSec {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Position change increment to use after the time specified by 
     * 					<b>nSec</b> elapses.
     * @type {Integer}
     */
    nInc {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
