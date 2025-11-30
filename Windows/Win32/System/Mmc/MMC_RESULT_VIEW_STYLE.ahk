#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MMC_RESULT_VIEW_STYLE enumeration defines the Win32 list view style (LVS_*) flags that can be used to set the view style in the MMC result view pane. They can be used in the add and remove parameters of the IResultData::ModifyViewStyle method.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ne-mmc-mmc_result_view_style
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_RESULT_VIEW_STYLE extends Win32Enum{

    /**
     * Allows only one item at a time to be selected. Without this view style, multiple items can be selected.
     * @type {Integer (Int32)}
     */
    static MMC_SINGLESEL => 1

    /**
     * Always show the selection, if any, even if the control does not have the focus.
     * @type {Integer (Int32)}
     */
    static MMC_SHOWSELALWAYS => 2

    /**
     * A value that specifies that column headers do not work like buttons. This style is useful if clicking a column header in report view does not carry out an action, such as sorting.
     * @type {Integer (Int32)}
     */
    static MMC_NOSORTHEADER => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MMC_ENSUREFOCUSVISIBLE => 8
}
