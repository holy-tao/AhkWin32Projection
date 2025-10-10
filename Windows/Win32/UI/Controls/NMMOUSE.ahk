#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains information used with mouse notification messages.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmmouse
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMMOUSE extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about this notification.
     * @type {NMHDR}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := NMHDR(this.ptr + 0)
            return this.__hdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD_PTR</a></b>
     * 
     * A control-specific item identifier.
     * @type {Pointer}
     */
    dwItemSpec {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD_PTR</a></b>
     * 
     * A control-specific item data.
     * @type {Pointer}
     */
    dwItemData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that contains the client coordinates of the mouse when the click occurred.
     * @type {POINT}
     */
    pt{
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(this.ptr + 40)
            return this.__pt
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Carries information about where on the item or control the cursor is pointing.
     * @type {Pointer}
     */
    dwHitInfo {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
