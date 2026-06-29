#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LVCOLUMNW_MASK.ahk" { LVCOLUMNW_MASK }
#Import ".\LVCOLUMNW_FORMAT.ahk" { LVCOLUMNW_FORMAT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about a column in report view. This structure is used both for creating and manipulating columns. This structure supersedes the LV_COLUMN structure. (ANSI)
 * @remarks
 * If a column is added to a list-view control with index 0 (the leftmost column), it is always LVCFMT_LEFT. Setting other flags on column 0 does not override that alignment. Therefore if you keep inserting columns with index 0, the text in all columns are left-aligned. If you want the first column to be right-aligned or centered you can make a dummy column, then insert one or more columns with index 1 or higher and specify the alignment you require. Finally delete the dummy column.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The commctrl.h header defines LVCOLUMN as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-lvcolumna
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct LVCOLUMNA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     */
    mask : LVCOLUMNW_MASK

    /**
     * Type: <b>int</b>
     */
    fmt : LVCOLUMNW_FORMAT

    /**
     * Type: <b>int</b>
     * 
     * Width of the column, in pixels.
     */
    cx : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * If column information is being set, this member is the address of a null-terminated string that contains the column header text. If the structure is receiving information about a column, this member specifies the address of the buffer that receives the column header text.
     */
    pszText : PSTR

    /**
     * Type: <b>int</b>
     * 
     * Size in <b>TCHAR</b>s of the buffer pointed to by the <b>pszText</b> member. If the structure is not receiving information about a column, this member is ignored.
     */
    cchTextMax : Int32

    /**
     * Type: <b>int</b>
     * 
     * Index of subitem associated with the column.
     */
    iSubItem : Int32

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.70</a>. Zero-based index of an image within the image list. The specified image will appear within the column.
     */
    iImage : Int32

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.70</a>. Zero-based column offset. Column offset is in left-to-right order. For example, zero indicates the leftmost column.
     */
    iOrder : Int32

    /**
     * Type: <b>int</b>
     * 
     * <b>Windows Vista</b>. Minimum width of the column in pixels.
     */
    cxMin : Int32

    /**
     * Type: <b>int</b>
     * 
     * <b>Windows Vista</b>. Application-defined value typically used to store the default width of the column. This member is ignored by the list-view control.
     */
    cxDefault : Int32

    /**
     * Type: <b>int</b>
     * 
     * <b>Windows Vista</b>. Read-only. The ideal width of the column in pixels, as the column may currently be autosized to a lesser width.
     */
    cxIdeal : Int32

}
