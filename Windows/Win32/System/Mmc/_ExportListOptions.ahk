#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ExportListOptions enumeration is used by the View.ExportList method and specifies options when writing list view contents to a file.
 * @see https://learn.microsoft.com/windows/win32/api/mmcobj/ne-mmcobj-_exportlistoptions
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class _ExportListOptions{

    /**
     * Default list export option. If this is the only flag specified in the call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/view-exportlist">View.ExportList</a>, then the list view contents are exported as comma-delimited ANSI text.
     * @type {Integer (Int32)}
     */
    static ExportListOptions_Default => 0

    /**
     * The list is exported as Unicode text.
     * @type {Integer (Int32)}
     */
    static ExportListOptions_Unicode => 1

    /**
     * The list is exported as tab-delimited text.
     * @type {Integer (Int32)}
     */
    static ExportListOptions_TabDelimited => 2

    /**
     * The exported list contains only currently selected items.
     * @type {Integer (Int32)}
     */
    static ExportListOptions_SelectedItemsOnly => 4
}
