#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\NMHDR.ahk

/**
 * Contains information about an EN_ENDCOMPOSITION notification code from a rich edit control.
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-endcompositionnotify
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ENDCOMPOSITIONNOTIFY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The <b>code</b> member of this structure identifies the notification code being sent.
     * @type {NMHDR}
     */
    nmhdr{
        get {
            if(!this.HasProp("__nmhdr"))
                this.__nmhdr := NMHDR(0, this)
            return this.__nmhdr
        }
    }

    /**
     * 
     * @type {Integer}
     */
    dwCode {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
