#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\COLORREF.ahk

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
     * @type {COLORREF}
     */
    from{
        get {
            if(!this.HasProp("__from"))
                this.__from := COLORREF(this.ptr + 0)
            return this.__from
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Color to map to.
     * @type {COLORREF}
     */
    to{
        get {
            if(!this.HasProp("__to"))
                this.__to := COLORREF(this.ptr + 4)
            return this.__to
        }
    }
}
