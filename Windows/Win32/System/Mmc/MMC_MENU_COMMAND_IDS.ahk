#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MMC_MENU_COMMAND_IDS enumeration defines the Command Identifiers that are reserved by MMC.
 * @remarks
 * 
 * Typically, a snap-in's 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iextendcontextmenu-command">IExtendContextMenu::Command</a> method is called only when one of its own menu items is selected. The MMCC_* codes are sent when a built-in menu item is selected and the snap-in must be notified about the selection. Other MMCC_* codes can be added later.
 * 
 * MMCC_STANDARD_VIEW_SELECT notifies the snap-in that the custom view is going away and that the snap-in can do any necessary clean-up. The next time the snap-in's 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-getresultviewtype">IComponent::GetResultViewType</a> method is called, the snap-in should return S_FALSE to indicate that the default list view should be used.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ne-mmc-mmc_menu_command_ids
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_MENU_COMMAND_IDS{

    /**
     * Sent to a snap-in's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iextendcontextmenu-command">IExtendContextMenu::Command</a> method when the user switches from a custom result view to the standard list view.
     * @type {Integer (Int32)}
     */
    static MMCC_STANDARD_VIEW_SELECT => -1
}
