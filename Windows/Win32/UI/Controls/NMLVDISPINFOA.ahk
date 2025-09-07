#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\LVITEMA.ahk

/**
 * Contains information about an LVN_GETDISPINFO or LVN_SETDISPINFO notification code. This structure is the same as the LV_DISPINFO structure, but has been renamed to fit standard naming conventions. (ANSI)
 * @remarks
 * If the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvitema">LVITEM</a> structure is receiving item text, the <b>pszText</b> and <b>cchTextMax</b> members specify the address and size of a buffer. You can either copy text to the buffer or assign the address of a string to the <b>pszText</b> member. In the latter case, you must not change or delete the string until the corresponding item text is deleted or two additional <a href="https://docs.microsoft.com/windows/desktop/Controls/lvn-getdispinfo">LVN_GETDISPINFO</a> messages have been sent. 
  * 
  * 
  * If you are handling the <a href="https://docs.microsoft.com/windows/desktop/Controls/lvn-getdispinfo">LVN_GETDISPINFO</a> message, you can set the LVIF_DI_SETITEM flag in the <b>mask</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvitema">LVITEM</a> structure. This tells the operating system to store the requested list item information and not ask for it again. For list-view controls with the <a href="https://docs.microsoft.com/windows/desktop/Controls/list-view-window-styles">LVS_REPORT</a> style, this flag only applies to the first (subitem 0) column's information. The control will not store information for subitems.
  * 		
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The commctrl.h header defines NMLVDISPINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlvdispinfoa
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset ANSI
 */
class NMLVDISPINFOA extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification code.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvitema">LVITEM</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvitema">LVITEM</a> structure that identifies the item or subitem. The structure either contains or receives information about the item. The <b>mask</b> member contains a set of bit flags that specify which item attributes are relevant.
     * For more information on the available bit flags, see <b>LVITEM</b>.
     * @type {LVITEMA}
     */
    item{
        get {
            if(!this.HasProp("__item"))
                this.__item := LVITEMA(this.ptr + 24)
            return this.__item
        }
    }
}
