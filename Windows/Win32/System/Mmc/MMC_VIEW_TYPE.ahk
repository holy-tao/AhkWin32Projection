#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MMC_VIEW_TYPE enumeration specifies a result view type and is used in the RESULT_VIEW_TYPE_INFO structure.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ne-mmc-mmc_view_type
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_VIEW_TYPE extends Win32Enum{

    /**
     * The view type is a list view.
     * @type {Integer (Int32)}
     */
    static MMC_VIEW_TYPE_LIST => 0

    /**
     * The view type is an HTML view.
     * @type {Integer (Int32)}
     */
    static MMC_VIEW_TYPE_HTML => 1

    /**
     * The view type is a control view.
     * @type {Integer (Int32)}
     */
    static MMC_VIEW_TYPE_OCX => 2
}
