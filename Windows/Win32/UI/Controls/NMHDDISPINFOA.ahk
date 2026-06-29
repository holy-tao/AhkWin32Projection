#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\NMHDR.ahk" { NMHDR }
#Import ".\HDI_MASK.ahk" { HDI_MASK }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information used in handling HDN_GETDISPINFO notification codes. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The commctrl.h header defines NMHDDISPINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmhddispinfoa
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct NMHDDISPINFOA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure containing information about this notification code.
     */
    hdr : NMHDR

    /**
     * Type: <b>int</b>
     * 
     * The zero-based index of the item in the header control.
     */
    iItem : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     */
    mask : HDI_MASK

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * A pointer to a null-terminated string containing the text that will be displayed for the header item.
     */
    pszText : PSTR

    /**
     * Type: <b>int</b>
     * 
     * The size of the buffer that 
     * 					<b>pszText</b> points to.
     */
    cchTextMax : Int32

    /**
     * Type: <b>int</b>
     * 
     * The zero-based index of an image within the image list. The specified image will be displayed with the header item, but it does not take the place of the item's bitmap. If 
     * 					<b>iImage</b> is set to I_IMAGECALLBACK, the control requests image information for this item by using an <a href="https://docs.microsoft.com/windows/desktop/Controls/hdn-getdispinfo">HDN_GETDISPINFO</a> notification code.
     */
    iImage : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * An application-defined value to associate with the item.
     */
    lParam : LPARAM

}
