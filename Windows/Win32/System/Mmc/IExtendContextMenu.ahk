#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IExtendContextMenu interface enables a snap-in to add items to an existing context menu.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iextendcontextmenu
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
     * @remarks
     * An implementation of <b>IExtendContextMenu::AddMenuItems</b> typically reads the node type and any other parameters required by calling 
     * IDataObject::GetDataHere on piDataObject, then adds context menu items as appropriate by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icontextmenucallback-additem">IContextMenuCallback::AddItem</a> on piCallback.
     * 
     * Your snap-in should check the pInsertionsAllowed flags for permission before attempting to add menu items at the MMC-defined insertion points. For example, a snap-in should not add menu items to CCM_INSERTIONPOINTID_PRIMARY_NEW or CCM_INSERTIONPOINTID_3RDPARTY_NEW unless the CCM_INSERTIONALLOWED_NEW flag is set.
     * 
     * The pInsertionsAllowed flags allow the following two features:
     * 
     * 
     * 
     * If the user selects a scope item and then displays its context menu, MMC will give both the snap-in's 
     * IComponentData and 
     * IComponent (that owns the current view) implementations the opportunity to add menu items. MMC calls the IExtendContextMenu::AddMenuItems method implemented by the snap-in's 
     * IComponent implementation to allow the snap-in to add menu items to the 
     * <b>View</b> menu. MMC calls the IExtendContextMenu::AddMenuItems method implemented by the snap-in's 
     * IComponentData to allow the snap-in to add menu items to all other menus. Only the snap-in's 
     * IComponent implementation can add items to the 
     * <b>View</b> menu.
     * 
     * If the user displays a scope item's context menu without first selecting the scope item, MMC will only give the snap-in's 
     * IComponentData implementation the opportunity to add menu items to all menus except for the 
     * <b>View</b> menu. Consequently, the 
     * <b>View</b> menu only appears for a scope item if the user first selects an item.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The 
     * AddMenuItems method should not call AddRef on either the piDataObject pointer or the piCallback pointer, nor should it call the methods of those interfaces after returning. Instead, it should make all necessary calls to the methods of those interfaces before returning. If any of these items is selected, you will be given back the pointer to IDataObject in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iextendcontextmenu-command">IExtendContextMenu::Command</a>, so do not keep this pointer after this method returns. You will not be notified if the menu is dismissed without any of your items being selected. In addition, do not query for alternate interfaces from piCallback because the one method, IContextMenuCallback::AddItem, should be sufficient.
     * @param {IDataObject} piDataObject A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data object of the menu to which items are added.
     * @param {IContextMenuCallback} piCallback A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icontextmenucallback">IContextMenuCallback</a> that can add items to the context menu.
     * @param {Pointer<Integer>} pInsertionAllowed A value that identifies MMC-defined menu-item insertion points that can be used. This can be a combination of the following flags:
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendcontextmenu-addmenuitems
     */
    AddMenuItems(piDataObject, piCallback, pInsertionAllowed) {
        pInsertionAllowedMarshal := pInsertionAllowed is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", piDataObject, "ptr", piCallback, pInsertionAllowedMarshal, pInsertionAllowed, "HRESULT")
        return result
    }

    /**
     * The IExtendContextMenu::Command method is called if one of the items you added to the context menu with IExtendContextMenu::AddMenuItems is subsequently selected.
     * @remarks
     * MMC reserves negative-valued command IDs for predefined menu command IDs that it sends to a snap-in's IExtendContextMenu::Command method. The –1 command ID is the MMCC_STANDARD_VIEW_SELECT enumerator value defined in mmc.h. This is sent to IExtendContextMenu::Command when the user clicks a standard view command on the 
     * <b>View</b> menu (Large, Small, List, or Detail). This notifies the snap-in that the user is switching away from a custom view (OCX, HTML). After getting an MMCC_STANDARD_VIEW_SELECT command, the snap-in should request a standard view the next time its 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-getresultviewtype">IComponent::GetResultViewType</a> method is called and not request a custom view until one of its custom view menu items is selected. If the snap-in only uses standard views or only uses custom views, it can ignore the MMCC_STANDARD_VIEW_SELECT command.
     * 
     * MMC sends the snap-in the MMCC_STANDARD_VIEW_SELECT command when the user clicks the 
     * <b>Back</b> button on the toolbar. MMC uses this command to instruct the snap-in to display the result pane's previous view.
     * @param {Integer} lCommandID A value that specifies the command identifier of the menu item.
     * @param {IDataObject} piDataObject A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the object whose context menu was displayed.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendcontextmenu-command
     */
    Command(lCommandID, piDataObject) {
        result := ComCall(4, this, "int", lCommandID, "ptr", piDataObject, "HRESULT")
        return result
    }
}
