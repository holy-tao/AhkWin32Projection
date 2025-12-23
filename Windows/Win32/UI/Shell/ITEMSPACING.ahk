#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores the dimensions of the two possible sizes of icon spacing that are available for display:\_small and large. Used by IShellFolderView::GetItemSpacing.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-itemspacing
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITEMSPACING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b>int</b>
     * 
     * The width of the spacing between icons in small icon mode, in pixels.
     * @type {Integer}
     */
    cxSmall {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * The height of the spacing between icons in small icon mode, in pixels.
     * @type {Integer}
     */
    cySmall {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>int</b>
     * 
     * The width of the spacing between icons in large icon mode, in pixels.
     * @type {Integer}
     */
    cxLarge {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * The height of the spacing between icons in large icon mode, in pixels.
     * @type {Integer}
     */
    cyLarge {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
