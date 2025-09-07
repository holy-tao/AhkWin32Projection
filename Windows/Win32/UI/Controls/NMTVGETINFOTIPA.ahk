#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk

/**
 * Contains and receives tree-view item information needed to display a tooltip for an item. This structure is used with the TVN_GETINFOTIP notification code. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The commctrl.h header defines NMTVGETINFOTIP as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtvgetinfotipa
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset ANSI
 */
class NMTVGETINFOTIPA extends Win32Struct
{
    static sizeof => 56

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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Address of a character buffer that contains the text to be displayed. If you want to change the text displayed in the tooltip, you will need to modify the contents of this buffer. The size of this buffer is specified by the 
     * 					<b>cchTextMax</b> structure.
     * @type {Pointer<Ptr>}
     */
    pszText {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * Size of the buffer at 
     * 					<b>pszText</b>, in characters. Although you should never assume that this buffer will be of any particular size, the INFOTIPSIZE value can be used for design purposes.
     * @type {Integer}
     */
    cchTextMax {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: <b>HTREEITEM</b>
     * 
     * Tree handle to the item for which the tooltip is being displayed.
     * @type {Pointer}
     */
    hItem {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Application-defined data associated with the item for which the tooltip is being displayed.
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
