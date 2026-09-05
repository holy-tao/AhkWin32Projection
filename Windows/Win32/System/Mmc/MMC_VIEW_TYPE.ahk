#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MMC_VIEW_TYPE enumeration specifies a result view type and is used in the RESULT_VIEW_TYPE_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ne-mmc-mmc_view_type
 * @namespace Windows.Win32.System.Mmc
 */
class MMC_VIEW_TYPE extends Win32Enum {

    /**
     * The view type is a list view.
     * Native name: MMC_VIEW_TYPE_LIST
     * @type {Integer (Int32)}
     */
    static LIST => 0

    /**
     * The view type is an HTML view.
     * Native name: MMC_VIEW_TYPE_HTML
     * @type {Integer (Int32)}
     */
    static HTML => 1

    /**
     * The view type is a control view.
     * Native name: MMC_VIEW_TYPE_OCX
     * @type {Integer (Int32)}
     */
    static OCX => 2
}
