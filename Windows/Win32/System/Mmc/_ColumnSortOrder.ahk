#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used by IResultsViewer::SortOrderProperty to indicate or set how a query is to be sorted.
 * @see https://learn.microsoft.com/windows/win32/api/mmcobj/ne-mmcobj-_columnsortorder
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class _ColumnSortOrder{

    /**
     * Indicates that the sort order is ascending.
     * @type {Integer (Int32)}
     */
    static SortOrder_Ascending => 0

    /**
     * Indicates that the sort order is descending.
     * @type {Integer (Int32)}
     */
    static SortOrder_Descending => 1
}
