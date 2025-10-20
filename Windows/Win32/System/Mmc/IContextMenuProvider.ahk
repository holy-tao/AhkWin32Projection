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
     * 
     * @returns {HRESULT} 
     */
    EmptyMenuList() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} piExtension 
     * @param {Pointer<IDataObject>} piDataObject 
     * @returns {HRESULT} 
     */
    AddPrimaryExtensionItems(piExtension, piDataObject) {
        result := ComCall(5, this, "ptr", piExtension, "ptr", piDataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataObject>} piDataObject 
     * @returns {HRESULT} 
     */
    AddThirdPartyExtensionItems(piDataObject) {
        result := ComCall(6, this, "ptr", piDataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} xPos 
     * @param {Integer} yPos 
     * @param {Pointer<Int32>} plSelected 
     * @returns {HRESULT} 
     */
    ShowContextMenu(hwndParent, xPos, yPos, plSelected) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(7, this, "ptr", hwndParent, "int", xPos, "int", yPos, "int*", plSelected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
