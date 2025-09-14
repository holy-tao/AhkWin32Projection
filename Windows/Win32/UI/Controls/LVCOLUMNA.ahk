#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 * @charset ANSI
 */
class LVCOLUMNA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @type {Integer}
     */
    mask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * @type {Integer}
     */
    fmt {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>int</b>
     * 
     * Width of the column, in pixels.
     * @type {Integer}
     */
    cx {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * If column information is being set, this member is the address of a null-terminated string that contains the column header text. If the structure is receiving information about a column, this member specifies the address of the buffer that receives the column header text.
     * @type {Pointer<PSTR>}
     */
    pszText {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>int</b>
     * 
     * Size in <b>TCHAR</b>s of the buffer pointed to by the <b>pszText</b> member. If the structure is not receiving information about a column, this member is ignored.
     * @type {Integer}
     */
    cchTextMax {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * Index of subitem associated with the column.
     * @type {Integer}
     */
    iSubItem {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.70</a>. Zero-based index of an image within the image list. The specified image will appear within the column.
     * @type {Integer}
     */
    iImage {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.70</a>. Zero-based column offset. Column offset is in left-to-right order. For example, zero indicates the leftmost column.
     * @type {Integer}
     */
    iOrder {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Type: <b>int</b>
     * 
     * <b>Windows Vista</b>. Minimum width of the column in pixels.
     * @type {Integer}
     */
    cxMin {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Type: <b>int</b>
     * 
     * <b>Windows Vista</b>. Application-defined value typically used to store the default width of the column. This member is ignored by the list-view control.
     * @type {Integer}
     */
    cxDefault {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Type: <b>int</b>
     * 
     * <b>Windows Vista</b>. Read-only. The ideal width of the column in pixels, as the column may currently be autosized to a lesser width.
     * @type {Integer}
     */
    cxIdeal {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
