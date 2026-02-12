#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether data in a table should be read primarily by row or by column.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.roworcolumnmajor
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class RowOrColumnMajor extends Win32Enum{

    /**
     * Data in the table should be read row by row.
     * @type {Integer (Int32)}
     */
    static RowMajor => 0

    /**
     * Data in the table should be read column by column.
     * @type {Integer (Int32)}
     */
    static ColumnMajor => 1

    /**
     * The best way to present the data is indeterminate.
     * @type {Integer (Int32)}
     */
    static Indeterminate => 2
}
