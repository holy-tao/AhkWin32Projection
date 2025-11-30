#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify whether data in a table should be read primarily by row or by column.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/ne-uiautomationcore-roworcolumnmajor
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class RowOrColumnMajor extends Win32Enum{

    /**
     * Data in the table should be read row by row.
     * @type {Integer (Int32)}
     */
    static RowOrColumnMajor_RowMajor => 0

    /**
     * Data in the table should be read column by column.
     * @type {Integer (Int32)}
     */
    static RowOrColumnMajor_ColumnMajor => 1

    /**
     * The best way to present the data is indeterminate.
     * @type {Integer (Int32)}
     */
    static RowOrColumnMajor_Indeterminate => 2
}
