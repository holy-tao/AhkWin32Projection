#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IContextMenuCallback.ahk

/**
 * The IContextMenuProvider interface implements methods that create new context menus, for the purpose of adding items to those menus, to enable extensions to extend those menus, and to display the resulting context menus.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-icontextmenuprovider
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IContextMenuProvider extends IContextMenuCallback{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContextMenuProvider
     * @type {Guid}
     */
    static IID => Guid("{43136eb6-d36c-11cf-adbc-00aa00a80033}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EmptyMenuList", "AddPrimaryExtensionItems", "AddThirdPartyExtensionItems", "ShowContextMenu"]

    /**
     * The IContextMenuProvider::EmptyMenuList method clears a context menu.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-icontextmenuprovider-emptymenulist
     */
    EmptyMenuList() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The IContextMenuProvider::AddPrimaryExtensionItems method enables one specific extension to add items to the insertion points defined for this context menu.
     * @param {IUnknown} piExtension A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the object that implements the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iextendcontextmenu">IExtendContextMenu</a> interface for the primary extension.
     * @param {IDataObject} piDataObject A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the object whose context menu is extended.
     * @returns {HRESULT} Other values can be returned, depending on the implementation of 
     * <a href="/windows/desktop/api/mmc/nf-mmc-iextendcontextmenu-addmenuitems">IExtendContextMenu::AddMenuItems</a> by the specified snap-in.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-icontextmenuprovider-addprimaryextensionitems
     */
    AddPrimaryExtensionItems(piExtension, piDataObject) {
        result := ComCall(5, this, "ptr", piExtension, "ptr", piDataObject, "HRESULT")
        return result
    }

    /**
     * The IContextMenuProvider::AddThirdPartyExtensionItems method enables third-party extensions to add items at specified insertion points in this context menu.
     * @param {IDataObject} piDataObject A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the object whose menu is extended.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-icontextmenuprovider-addthirdpartyextensionitems
     */
    AddThirdPartyExtensionItems(piDataObject) {
        result := ComCall(6, this, "ptr", piDataObject, "HRESULT")
        return result
    }

    /**
     * The IContextMenuProvider::ShowContextMenu method displays a context menu.
     * @param {HWND} hwndParent A handle to the parent window in which the context menu is displayed.
     * @param {Integer} xPos A value, in screen coordinates, that specifies the horizontal location of the upper-left corner of the context menu, in screen coordinates.
     * @param {Integer} yPos A value, in screen coordinates, that specifies the vertical location of the upper-left corner of the context menu.
     * @returns {Integer} A value that specifies the ICommandID value (as passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icontextmenucallback-additem">IContextMenuCallback::AddItem</a>) of the selected menu item. If this is zero, either none of the context menu items were selected or the selected context menu item was added by an extension. If an extension item was selected, 
     * ShowContextMenu notifies the extension by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iextendcontextmenu-command">IExtendContextMenu::Command</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-icontextmenuprovider-showcontextmenu
     */
    ShowContextMenu(hwndParent, xPos, yPos) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(7, this, "ptr", hwndParent, "int", xPos, "int", yPos, "int*", &plSelected := 0, "HRESULT")
        return plSelected
    }
}
