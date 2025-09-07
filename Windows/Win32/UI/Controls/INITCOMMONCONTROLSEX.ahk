#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Carries information used to load common control classes from the dynamic-link library (DLL). This structure is used with the InitCommonControlsEx function.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-initcommoncontrolsex
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class INITCOMMONCONTROLSEX extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    dwICC {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
