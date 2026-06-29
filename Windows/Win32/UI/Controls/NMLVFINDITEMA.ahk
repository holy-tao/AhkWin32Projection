#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\NMHDR.ahk" { NMHDR }
#Import ".\LVFINDINFOW_FLAGS.ahk" { LVFINDINFOW_FLAGS }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\LVFINDINFOA.ahk" { LVFINDINFOA }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information the owner needs to find items requested by a virtual list-view control. This structure is used with the LVN_ODFINDITEM notification code. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The commctrl.h header defines NMLVFINDITEM as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlvfinditema
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct NMLVFINDITEMA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information on this notification code.
     */
    hdr : NMHDR

    /**
     * Type: <b>int</b>
     * 
     * Index of the item at which the search will start.
     */
    iStart : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvfindinfoa">LVFINDINFO</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvfindinfoa">LVFINDINFO</a> structure that contains information necessary to perform a search.
     */
    lvfi : LVFINDINFOA

}
