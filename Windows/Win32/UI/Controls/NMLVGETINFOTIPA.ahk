#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\NMLVGETINFOTIP_FLAGS.ahk" { NMLVGETINFOTIP_FLAGS }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains and receives list-view item information needed to display a tooltip for an item. This structure is used with the LVN_GETINFOTIP notification code. (ANSI)
 * @remarks
 * An item is said to be folded when the currently displayed text is truncated. If LVGIT_UNFOLDED is returned in <b>dwFlags</b>, the full text of the item is already displayed, so there is no need to display it in the tooltip.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The commctrl.h header defines NMLVGETINFOTIP as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlvgetinfotipa
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct NMLVGETINFOTIPA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information on this notification code.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Either zero or LVGIT_UNFOLDED. See Remarks.
     */
    dwFlags : NMLVGETINFOTIP_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Address of a string buffer that receives any additional text information. If 
     * 					<b>dwFlags</b> is zero, this member will contain the existing item text. In this case, you should append any additional text onto the end of this string. The size of this buffer is specified by the 
     * 					<b>cchTextMax</b> structure.
     */
    pszText : PSTR

    /**
     * Type: <b>int</b>
     * 
     * Size, in characters, of the buffer pointed to by 
     * 					<b>pszText</b>. Although you should never assume that this buffer will be of any particular size, the INFOTIPSIZE value can be used for design purposes.
     */
    cchTextMax : Int32

    /**
     * Type: <b>int</b>
     * 
     * Zero-based index of the item to which this structure refers.
     */
    iItem : Int32

    /**
     * Type: <b>int</b>
     * 
     * One-based index of the subitem to which this structure refers. If this member is zero, the structure is referring to the item and not a subitem. This member is not currently used and will always be zero.
     */
    iSubItem : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Application-defined value associated with the item. This member is not currently used and will always be zero.
     */
    lParam : LPARAM

}
