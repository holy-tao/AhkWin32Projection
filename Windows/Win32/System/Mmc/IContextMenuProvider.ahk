#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDataObject.ahk" { IDataObject }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\IContextMenuCallback.ahk" { IContextMenuCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IContextMenuProvider interface implements methods that create new context menus, for the purpose of adding items to those menus, to enable extensions to extend those menus, and to display the resulting context menus.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-icontextmenuprovider
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IContextMenuProvider extends IContextMenuCallback {
    /**
     * The interface identifier for IContextMenuProvider
     * @type {Guid}
     */
    static IID := Guid("{43136eb6-d36c-11cf-adbc-00aa00a80033}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContextMenuProvider interfaces
    */
    struct Vtbl extends IContextMenuCallback.Vtbl {
        EmptyMenuList               : IntPtr
        AddPrimaryExtensionItems    : IntPtr
        AddThirdPartyExtensionItems : IntPtr
        ShowContextMenu             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContextMenuProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IContextMenuProvider::EmptyMenuList method clears a context menu.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icontextmenuprovider-showcontextmenu">IContextMenuProvider::ShowContextMenu</a> automatically clears the context menu after that displays it. Nevertheless, it is a good practice to call 
     * <b>EmptyMenuList</b> before beginning to build a context menu.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icontextmenuprovider-emptymenulist
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iextendcontextmenu-addmenuitems">IExtendContextMenu::AddMenuItems</a> by the specified snap-in.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icontextmenuprovider-addprimaryextensionitems
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
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icontextmenuprovider-addthirdpartyextensionitems
     */
    AddThirdPartyExtensionItems(piDataObject) {
        result := ComCall(6, this, "ptr", piDataObject, "HRESULT")
        return result
    }

    /**
     * The IContextMenuProvider::ShowContextMenu method displays a context menu.
     * @remarks
     * ShowContextMenu automatically clears the context menu after that displays it. A best practice is to call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icontextmenuprovider-emptymenulist">IContextMenuProvider::EmptyMenuList</a> before beginning to build a context menu.
     * @param {HWND} hwndParent A handle to the parent window in which the context menu is displayed.
     * @param {Integer} xPos A value, in screen coordinates, that specifies the horizontal location of the upper-left corner of the context menu, in screen coordinates.
     * @param {Integer} yPos A value, in screen coordinates, that specifies the vertical location of the upper-left corner of the context menu.
     * @returns {Integer} A value that specifies the ICommandID value (as passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icontextmenucallback-additem">IContextMenuCallback::AddItem</a>) of the selected menu item. If this is zero, either none of the context menu items were selected or the selected context menu item was added by an extension. If an extension item was selected, 
     * ShowContextMenu notifies the extension by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iextendcontextmenu-command">IExtendContextMenu::Command</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icontextmenuprovider-showcontextmenu
     */
    ShowContextMenu(hwndParent, xPos, yPos) {
        result := ComCall(7, this, HWND, hwndParent, "int", xPos, "int", yPos, "int*", &plSelected := 0, "HRESULT")
        return plSelected
    }

    Query(iid) {
        if (IContextMenuProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EmptyMenuList := CallbackCreate(GetMethod(implObj, "EmptyMenuList"), flags, 1)
        this.vtbl.AddPrimaryExtensionItems := CallbackCreate(GetMethod(implObj, "AddPrimaryExtensionItems"), flags, 3)
        this.vtbl.AddThirdPartyExtensionItems := CallbackCreate(GetMethod(implObj, "AddThirdPartyExtensionItems"), flags, 2)
        this.vtbl.ShowContextMenu := CallbackCreate(GetMethod(implObj, "ShowContextMenu"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EmptyMenuList)
        CallbackFree(this.vtbl.AddPrimaryExtensionItems)
        CallbackFree(this.vtbl.AddThirdPartyExtensionItems)
        CallbackFree(this.vtbl.ShowContextMenu)
    }
}
