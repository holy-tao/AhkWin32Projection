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
     * 
     * @param {IDataObject} piDataObject 
     * @param {IContextMenuCallback} piCallback 
     * @param {Pointer<Integer>} pInsertionAllowed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendcontextmenu-addmenuitems
     */
    AddMenuItems(piDataObject, piCallback, pInsertionAllowed) {
        result := ComCall(3, this, "ptr", piDataObject, "ptr", piCallback, "int*", pInsertionAllowed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lCommandID 
     * @param {IDataObject} piDataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendcontextmenu-command
     */
    Command(lCommandID, piDataObject) {
        result := ComCall(4, this, "int", lCommandID, "ptr", piDataObject, "HRESULT")
        return result
    }
}
