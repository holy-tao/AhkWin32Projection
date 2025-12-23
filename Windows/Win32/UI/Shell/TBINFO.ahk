#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the SFVM_GETBUTTONINFO notification to specify the number of buttons to add to the toolbar, as well as how they're added.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-tbinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class TBINFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>UINT</b>
     * 
     * The number of buttons.
     * @type {Integer}
     */
    cbuttons {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * One of the following flags.
     * @type {Integer}
     */
    uFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
