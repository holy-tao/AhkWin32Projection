#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information on the insertion mark in a toolbar control.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-tbinsertmark
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TBINSERTMARK extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>int</b>
     * 
     * Zero-based index of the insertion mark. If this member is -1, there is no insertion mark.
     * @type {Integer}
     */
    iButton {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Defines where the insertion mark is in relation to
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
