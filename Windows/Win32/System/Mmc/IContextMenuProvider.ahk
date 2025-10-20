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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icontextmenuprovider-emptymenulist
     */
    EmptyMenuList() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} piExtension 
     * @param {IDataObject} piDataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icontextmenuprovider-addprimaryextensionitems
     */
    AddPrimaryExtensionItems(piExtension, piDataObject) {
        result := ComCall(5, this, "ptr", piExtension, "ptr", piDataObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} piDataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icontextmenuprovider-addthirdpartyextensionitems
     */
    AddThirdPartyExtensionItems(piDataObject) {
        result := ComCall(6, this, "ptr", piDataObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} xPos 
     * @param {Integer} yPos 
     * @param {Pointer<Integer>} plSelected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icontextmenuprovider-showcontextmenu
     */
    ShowContextMenu(hwndParent, xPos, yPos, plSelected) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(7, this, "ptr", hwndParent, "int", xPos, "int", yPos, "int*", plSelected, "HRESULT")
        return result
    }
}
