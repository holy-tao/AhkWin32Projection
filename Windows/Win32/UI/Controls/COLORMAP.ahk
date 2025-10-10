#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information used by the CreateMappedBitmap function to map the colors of the bitmap.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-colormap
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class COLORMAP extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Color to map from.
     * @type {Integer}
     */
    from {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Color to map to.
     * @type {Integer}
     */
    to {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
