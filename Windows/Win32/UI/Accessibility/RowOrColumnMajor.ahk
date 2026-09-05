#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify whether data in a table should be read primarily by row or by column.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-roworcolumnmajor
 * @namespace Windows.Win32.UI.Accessibility
 */
class RowOrColumnMajor extends Win32Enum {

    /**
     * Data in the table should be read row by row.
     * Native name: RowOrColumnMajor_RowMajor
     * @type {Integer (Int32)}
     */
    static RowMajor => 0

    /**
     * Data in the table should be read column by column.
     * Native name: RowOrColumnMajor_ColumnMajor
     * @type {Integer (Int32)}
     */
    static ColumnMajor => 1

    /**
     * The best way to present the data is indeterminate.
     * Native name: RowOrColumnMajor_Indeterminate
     * @type {Integer (Int32)}
     */
    static Indeterminate => 2
}
