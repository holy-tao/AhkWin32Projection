#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that specify whether data in a table should be read primarily by row or by column.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-roworcolumnmajor
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct RowOrColumnMajor {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
