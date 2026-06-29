#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\COMBOBOX_EX_ITEM_FLAGS.ahk" { COMBOBOX_EX_ITEM_FLAGS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about an item in a ComboBoxEx control. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The commctrl.h header defines COMBOBOXEXITEM as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-comboboxexitemw
 * @namespace Windows.Win32.UI.Controls
 * @charset Unicode
 */
export default struct COMBOBOXEXITEMW {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     */
    mask : COMBOBOX_EX_ITEM_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT_PTR</a></b>
     * 
     * The zero-based index of the item.
     */
    iItem : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * A pointer to a character buffer that contains or receives the item's text. If text information is being retrieved, this member must be set to the address of a character buffer that will receive the text. The size of this buffer must also be indicated in 
     * 					<b>cchTextMax</b>. If this member is set to LPSTR_TEXTCALLBACK, the control will request the information by using the <a href="https://docs.microsoft.com/windows/desktop/Controls/cben-getdispinfo">CBEN_GETDISPINFO</a> notification codes.
     */
    pszText : PWSTR

    /**
     * Type: <b>int</b>
     * 
     * The length of <b>pszText</b>, in <b>TCHAR</b><b>s</b>. If text information is being set, this member is ignored.
     */
    cchTextMax : Int32

    /**
     * Type: <b>int</b>
     * 
     * The zero-based index of an image within the image list. The specified image will be displayed for the item when it is not selected. If this member is set to I_IMAGECALLBACK, the control will request the information by using <a href="https://docs.microsoft.com/windows/desktop/Controls/cben-getdispinfo">CBEN_GETDISPINFO</a> notification codes.
     */
    iImage : Int32

    /**
     * Type: <b>int</b>
     * 
     * The zero-based index of an image within the image list. The specified image will be displayed for the item when it is selected. If this member is set to I_IMAGECALLBACK, the control will request the information by using <a href="https://docs.microsoft.com/windows/desktop/Controls/cben-getdispinfo">CBEN_GETDISPINFO</a> notification codes.
     */
    iSelectedImage : Int32

    /**
     * Type: <b>int</b>
     * 
     * The one-based index of an overlay image within the image list. If this member is set to I_IMAGECALLBACK, the control will request the information by using <a href="https://docs.microsoft.com/windows/desktop/Controls/cben-getdispinfo">CBEN_GETDISPINFO</a> notification codes.
     */
    iOverlay : Int32

    /**
     * Type: <b>int</b>
     * 
     * The number of indent spaces to display for the item. Each indentation equals 10 pixels. If this member is set to I_INDENTCALLBACK, the control will request the information by using <a href="https://docs.microsoft.com/windows/desktop/Controls/cben-getdispinfo">CBEN_GETDISPINFO</a> notification codes.
     */
    iIndent : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * A value specific to the item.
     */
    lParam : LPARAM

}
