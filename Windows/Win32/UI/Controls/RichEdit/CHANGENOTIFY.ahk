#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information that is associated with an EN_CHANGE notification code. A windowless rich edit control sends this notification to its host window when the content of the control changes.
 * @see https://docs.microsoft.com/windows/win32/api//textserv/ns-textserv-changenotify
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class CHANGENOTIFY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwChangeType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Cookie for the undo action 
     * 										that is associated with the change.
     * @type {Pointer<Void>}
     */
    pvCookieData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
