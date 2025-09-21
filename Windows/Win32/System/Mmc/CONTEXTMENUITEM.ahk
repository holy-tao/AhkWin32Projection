#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CONTEXTMENUITEM structure is passed to the IContextMenuCallback::AddItem method or the IContextMenuProvider::AddItem method (inherited from IContextMenuCallback) to define a new menu item, submenu, or insertion point.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-contextmenuitem
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class CONTEXTMENUITEM extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A pointer to a null-terminated string that contains the name of the menu item or of the submenu. This member cannot be <b>NULL</b> except for a separator or insertion point.
     * @type {Pointer<Char>}
     */
    strName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a null-terminated string that contains the text that is displayed in the status bar when this item is highlighted. This member can be <b>NULL</b>.
     * @type {Pointer<Char>}
     */
    strStatusBarText {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

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
     * @type {Integer}
     */
    lCommandID {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A value that specifies where in the context menu the new item should be added. Snap-ins can only add items to insertion points created by the menu creator or the primary snap-in. The following are the insertion points created by MMC in the default context menus for items in the scope pane and list view result pane:
     * @type {Integer}
     */
    lInsertionPointID {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * A value that specifies one or more of the following style flags:
     * @type {Integer}
     */
    fFlags {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * A value that specifies one or more of the following flags:
     * @type {Integer}
     */
    fSpecialFlags {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
