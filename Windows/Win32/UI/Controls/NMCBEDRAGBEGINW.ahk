#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information used with the CBEN_DRAGBEGIN notification code. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The commctrl.h header defines NMCBEDRAGBEGIN as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcbedragbeginw
 * @namespace Windows.Win32.UI.Controls
 * @charset Unicode
 */
export default struct NMCBEDRAGBEGINW {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification code.
     */
    hdr : NMHDR

    /**
     * Type: <b>int</b>
     * 
     * The zero-based index of the item being dragged. This value will always be -1, indicating that the item being dragged is the item displayed in the edit portion of the control.
     */
    iItemid : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">TCHAR</a></b>
     * 
     * The character buffer that contains the text of the item being dragged.
     */
    szText : WCHAR[260]

}
