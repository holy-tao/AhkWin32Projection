#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information that is associated with an EN_CHANGE notification code. A windowless rich edit control sends this notification to its host window when the content of the control changes.
 * @see https://learn.microsoft.com/windows/win32/api/textserv/ns-textserv-changenotify
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct CHANGENOTIFY {
    #StructPack 8

    dwChangeType : UInt32

    /**
     * Cookie for the undo action 
     * 										that is associated with the change.
     */
    pvCookieData : IntPtr

}
