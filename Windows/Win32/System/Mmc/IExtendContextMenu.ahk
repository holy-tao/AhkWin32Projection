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
     * 
     * @param {Pointer<IDataObject>} piDataObject 
     * @param {Pointer<IContextMenuCallback>} piCallback 
     * @param {Pointer<Int32>} pInsertionAllowed 
     * @returns {HRESULT} 
     */
    AddMenuItems(piDataObject, piCallback, pInsertionAllowed) {
        result := ComCall(3, this, "ptr", piDataObject, "ptr", piCallback, "int*", pInsertionAllowed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lCommandID 
     * @param {Pointer<IDataObject>} piDataObject 
     * @returns {HRESULT} 
     */
    Command(lCommandID, piDataObject) {
        result := ComCall(4, this, "int", lCommandID, "ptr", piDataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
