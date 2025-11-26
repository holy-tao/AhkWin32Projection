#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IExtendContextMenu interface enables a snap-in to add items to an existing context menu.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iextendcontextmenu
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IExtendContextMenu extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExtendContextMenu
     * @type {Guid}
     */
    static IID => Guid("{4f3b7a4f-cfac-11cf-b8e3-00c04fd8d5b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddMenuItems", "Command"]

    /**
     * The IExtendContextMenu::AddMenuItems method enables a snap-in to add items to a context menu.
     * @param {IDataObject} piDataObject A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data object of the menu to which items are added.
     * @param {IContextMenuCallback} piCallback A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icontextmenucallback">IContextMenuCallback</a> that can add items to the context menu.
     * @param {Pointer<Integer>} pInsertionAllowed A value that identifies MMC-defined menu-item insertion points that can be used. This can be a combination of the following flags:
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iextendcontextmenu-addmenuitems
     */
    AddMenuItems(piDataObject, piCallback, pInsertionAllowed) {
        pInsertionAllowedMarshal := pInsertionAllowed is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", piDataObject, "ptr", piCallback, pInsertionAllowedMarshal, pInsertionAllowed, "HRESULT")
        return result
    }

    /**
     * The IExtendContextMenu::Command method is called if one of the items you added to the context menu with IExtendContextMenu::AddMenuItems is subsequently selected.
     * @param {Integer} lCommandID A value that specifies the command identifier of the menu item.
     * @param {IDataObject} piDataObject A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the object whose context menu was displayed.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iextendcontextmenu-command
     */
    Command(lCommandID, piDataObject) {
        result := ComCall(4, this, "int", lCommandID, "ptr", piDataObject, "HRESULT")
        return result
    }
}
