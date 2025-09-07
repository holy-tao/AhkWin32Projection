#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\NMHDR.ahk
#Include .\CHARRANGE.ahk

/**
 * Contains information about an EN_LINK notification code from a rich edit control.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-enlink
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ENLINK extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * The code member of this structure identifies the notification code being sent.
     * @type {NMHDR}
     */
    nmhdr{
        get {
            if(!this.HasProp("__nmhdr"))
                this.__nmhdr := NMHDR(this.ptr + 0)
            return this.__nmhdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Identifier of the message that caused the rich edit control to send the <a href="https://msdn.microsoft.com/67f02908-957e-4d91-8a70-70399ce9cf2e">EN_LINK</a> notification code.
     * @type {Integer}
     */
    msg {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WPARAM</a></b>
     * 
     * The <b>wParam</b> parameter of the message received by the rich edit control.
     * @type {Pointer}
     */
    wParam {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * The <b>lParam</b> parameter of the message received by the rich edit control.
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charrange">CHARRANGE</a></b>
     * 
     * The range of consecutive characters in the rich edit control that have the CFE_LINK effect.
     * @type {CHARRANGE}
     */
    chrg{
        get {
            if(!this.HasProp("__chrg"))
                this.__chrg := CHARRANGE(this.ptr + 48)
            return this.__chrg
        }
    }
}
