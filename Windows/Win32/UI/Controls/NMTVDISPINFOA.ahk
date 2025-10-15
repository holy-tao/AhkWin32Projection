#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include .\HTREEITEM.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\LPARAM.ahk
#Include .\TVITEMA.ahk

/**
 * Contains and receives display information for a tree-view item. This structure is identical to the TV_DISPINFO structure, but it has been renamed to follow current naming conventions.
 * @remarks
 * 
  * > [!NOTE]
  * > The commctrl.h header defines NMTVDISPINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmtvdispinfoa
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset ANSI
 */
class NMTVDISPINFOA extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tvitema">TVITEM</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tvitema">TVITEM</a> structure that identifies and contains information about the tree-view item. The
     * @type {TVITEMA}
     */
    item{
        get {
            if(!this.HasProp("__item"))
                this.__item := TVITEMA(this.ptr + 24)
            return this.__item
        }
    }
}
