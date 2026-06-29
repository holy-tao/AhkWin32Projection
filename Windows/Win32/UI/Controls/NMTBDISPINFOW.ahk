#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import ".\NMTBDISPINFOW_MASK.ahk" { NMTBDISPINFOW_MASK }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Contains and receives display information for a toolbar item. This structure is used with the TBN_GETDISPINFO notification code. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The commctrl.h header defines NMTBDISPINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtbdispinfow
 * @namespace Windows.Win32.UI.Controls
 * @charset Unicode
 */
export default struct NMTBDISPINFOW {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about the notification.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwMask : NMTBDISPINFOW_MASK

    /**
     * Type: <b>int</b>
     * 
     * Command identifier of the item for which display information is being requested. This member is filled in by the control before it sends the notification code.
     */
    idCommand : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD_PTR</a></b>
     * 
     * Application-defined value associated with the item for which display information is being requested. This member is filled in by the control before sending the notification code.
     */
    lParam : IntPtr

    /**
     * Type: <b>int</b>
     * 
     * Image index for the item.
     */
    iImage : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Pointer to a character buffer that receives the item's text.
     */
    pszText : PWSTR

    /**
     * Type: <b>int</b>
     * 
     * Size of the 
     * 					<b>pszText</b> buffer, in characters.
     */
    cchText : Int32

}
