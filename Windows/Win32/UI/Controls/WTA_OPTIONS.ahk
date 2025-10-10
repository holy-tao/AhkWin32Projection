#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines options that are used to set window visual style attributes.
 * @see https://docs.microsoft.com/windows/win32/api//uxtheme/ns-uxtheme-wta_options
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class WTA_OPTIONS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A combination of flags that modify window visual style attributes. Can be a combination of the <a href="https://docs.microsoft.com/windows/desktop/Controls/wtnca">WTNCA</a> constants.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A bitmask that describes how the values specified in <b>dwFlags</b> should be applied. If the bit corresponding to a value in <b>dwFlags</b> is 0, that flag will be removed. If the bit is 1, the flag will be added.
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
