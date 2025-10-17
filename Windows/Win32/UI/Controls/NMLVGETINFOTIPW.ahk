#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk

/**
 * Contains and receives list-view item information needed to display a tooltip for an item. This structure is used with the LVN_GETINFOTIP notification code.
 * @remarks
 * 
  * An item is said to be folded when the currently displayed text is truncated. If LVGIT_UNFOLDED is returned in <b>dwFlags</b>, the full text of the item is already displayed, so there is no need to display it in the tooltip.
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The commctrl.h header defines NMLVGETINFOTIP as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmlvgetinfotipw
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset Unicode
 */
class NMLVGETINFOTIPW extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information on this notification code.
     * @type {NMHDR}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := NMHDR(0, this)
            return this.__hdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Either zero or LVGIT_UNFOLDED. See Remarks.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Address of a string buffer that receives any additional text information. If 
     * 					<b>dwFlags</b> is zero, this member will contain the existing item text. In this case, you should append any additional text onto the end of this string. The size of this buffer is specified by the 
     * 					<b>cchTextMax</b> structure.
     * @type {PWSTR}
     */
    pszText {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>int</b>
     * 
     * Size, in characters, of the buffer pointed to by 
     * 					<b>pszText</b>. Although you should never assume that this buffer will be of any particular size, the INFOTIPSIZE value can be used for design purposes.
     * @type {Integer}
     */
    cchTextMax {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Type: <b>int</b>
     * 
     * Zero-based index of the item to which this structure refers.
     * @type {Integer}
     */
    iItem {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Type: <b>int</b>
     * 
     * One-based index of the subitem to which this structure refers. If this member is zero, the structure is referring to the item and not a subitem. This member is not currently used and will always be zero.
     * @type {Integer}
     */
    iSubItem {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Application-defined value associated with the item. This member is not currently used and will always be zero.
     * @type {LPARAM}
     */
    lParam {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
