#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The CONTEXTMENUITEM structure is passed to the IContextMenuCallback::AddItem method or the IContextMenuProvider::AddItem method (inherited from IContextMenuCallback) to define a new menu item, submenu, or insertion point.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-contextmenuitem
 * @namespace Windows.Win32.System.Mmc
 */
export default struct CONTEXTMENUITEM {
    #StructPack 8

    /**
     * A pointer to a null-terminated string that contains the name of the menu item or of the submenu. This member cannot be <b>NULL</b> except for a separator or insertion point.
     */
    strName : PWSTR

    /**
     * A pointer to a null-terminated string that contains the text that is displayed in the status bar when this item is highlighted. This member can be <b>NULL</b>.
     */
    strStatusBarText : PWSTR

    /**
     * A value that specifies the command identifier for menu items. If this menu item is added by 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iextendcontextmenu-addmenuitems">IExtendContextMenu::AddMenuItems</a> and 
     *        then selected, this is the command ID that is passed back to 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iextendcontextmenu-command">IExtendContextMenu::Command</a>. If this menu 
     *        item is added by the <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icontextmenuprovider">IContextMenuProvider</a> 
     *        interface and then selected, this is the command ID that is passed back to pISelected by 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icontextmenuprovider-showcontextmenu">IContextMenuProvider::ShowContextMenu</a>. 
     *        If this is an insertion point (<b>CCM_SPECIAL_INSERTION_POINT</b> is set in 
     *        <i>fSpecialFlags</i>) or a submenu (<b>MF_POPUP</b> is set in 
     *        <i>fFlags</i>), use <i>lCommandID</i> in subsequent calls as 
     *        <i>lInsertionPointID</i> (for more information, see the following list). Carefully read the 
     *        following discussion because specific bits in the new insertion point ID must be on and others must be off.
     * 
     * Some bits in the command ID require special handling for items that are not insertion points or submenus.
     */
    lCommandID : Int32

    /**
     * A value that specifies where in the context menu the new item should be added. Snap-ins can only add items to insertion points created by the menu creator or the primary snap-in. The following are the insertion points created by MMC in the default context menus for items in the scope pane and list view result pane:
     */
    lInsertionPointID : Int32

    /**
     * A value that specifies one or more of the following style flags:
     */
    fFlags : Int32

    /**
     * A value that specifies one or more of the following flags:
     */
    fSpecialFlags : Int32

}
