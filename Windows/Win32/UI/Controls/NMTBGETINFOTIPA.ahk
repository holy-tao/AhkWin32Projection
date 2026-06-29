#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains and receives infotip information for a toolbar item. This structure is used with the TBN_GETINFOTIP notification code. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The commctrl.h header defines NMTBGETINFOTIP as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtbgetinfotipa
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct NMTBGETINFOTIPA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about the notification.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Address of a character buffer that receives the infotip text.
     */
    pszText : PSTR

    /**
     * Type: <b>int</b>
     * 
     * Size of the buffer, in characters, at 
     * 					<b>pszText</b>. In most cases, the buffer will be INFOTIPSIZE characters in size, but you should always make sure that your application does not copy more than 
     * 					<b>cchTextMax</b> characters to the buffer at 
     * 					<b>pszText</b>.
     */
    cchTextMax : Int32

    /**
     * Type: <b>int</b>
     * 
     * The command identifier of the item for which infotip information is being requested. This member is filled in by the control before sending the notification code.
     */
    iItem : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * The application-defined value associated with the item for which infotip information is being requested. This member is filled in by the control before sending the notification code.
     */
    lParam : LPARAM

}
