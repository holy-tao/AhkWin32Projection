#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk

/**
 * Contains information used to handle an [EN_SEARCHWEB](/windows/win32/controls/en-searchweb) notification code.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmsearchweb
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMSEARCHWEB extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: **[NMHDR](/windows/win32/api/winuser/ns-winuser-nmhdr)**
     * 
     * An NMHDR structure that contains additional information about this notification.
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
     * Type: **[EC_SEARCHWEB_ENTRYPOINT](ne-commctrl-ec_searchweb_entrypoint.md)**
     * 
     * An enum value that indicates the entry point of the search.
     * @type {Integer}
     */
    entrypoint {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * TRUE if there is query text; otherwise, FALSE.
     * @type {Integer}
     */
    hasQueryText {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * TRUE if the invoke succeeded; otherwise, FALSE.
     * @type {Integer}
     */
    invokeSucceeded {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
