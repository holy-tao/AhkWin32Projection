#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include .\HTREEITEM.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\LPARAM.ahk
#Include .\TVITEMA.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains information about a tree-view notification message. This structure is identical to the NM_TREEVIEW structure, but it has been renamed to follow current naming conventions.
 * @remarks
 * 
  * > [!NOTE]
  * > The commctrl.h header defines NMTREEVIEW as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmtreeviewa
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset ANSI
 */
class NMTREEVIEWA extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification message.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Notification-specific action flag. This member is used with the following notification codes.
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/tvn-itemexpanding">TVN_ITEMEXPANDING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/tvn-itemexpanded">TVN_ITEMEXPANDED</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/tvn-selchanging">TVN_SELCHANGING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/tvn-selchanged">TVN_SELCHANGED</a>
     * </li>
     * </ul>
     * For the possible action flag values, see <a href="https://docs.microsoft.com/windows/desktop/Controls/tvm-expand">TVM_EXPAND</a> and <a href="https://docs.microsoft.com/windows/desktop/Controls/tvn-selchanged">TVN_SELCHANGED</a>.
     * @type {Integer}
     */
    action {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tvitema">TVITEM</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tvitema">TVITEM</a> structure that contains information about the old item state. This member is zero for notification messages that do not use it.
     * @type {TVITEMA}
     */
    itemOld{
        get {
            if(!this.HasProp("__itemOld"))
                this.__itemOld := TVITEMA(this.ptr + 32)
            return this.__itemOld
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tvitema">TVITEM</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tvitema">TVITEM</a> structure that contains information about the new item state. This member is zero for notification messages that do not use it.
     * @type {TVITEMA}
     */
    itemNew{
        get {
            if(!this.HasProp("__itemNew"))
                this.__itemNew := TVITEMA(this.ptr + 88)
            return this.__itemNew
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that contains the client coordinates of the mouse at the time the event occurred that caused the notification message to be sent.
     * @type {POINT}
     */
    ptDrag{
        get {
            if(!this.HasProp("__ptDrag"))
                this.__ptDrag := POINT(this.ptr + 144)
            return this.__ptDrag
        }
    }
}
