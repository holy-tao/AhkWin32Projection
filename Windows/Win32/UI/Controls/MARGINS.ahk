#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Returned by the GetThemeMargins function to define the margins of windows that have visual styles applied.
 * @see https://docs.microsoft.com/windows/win32/api//uxtheme/ns-uxtheme-margins
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class MARGINS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b>int</b>
     * 
     * Width of the left border that retains its size.
     * @type {Integer}
     */
    cxLeftWidth {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * Width of the right border that retains its size.
     * @type {Integer}
     */
    cxRightWidth {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>int</b>
     * 
     * Height of the top border that retains its size.
     * @type {Integer}
     */
    cyTopHeight {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * Height of the bottom border that retains its size.
     * @type {Integer}
     */
    cyBottomHeight {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
