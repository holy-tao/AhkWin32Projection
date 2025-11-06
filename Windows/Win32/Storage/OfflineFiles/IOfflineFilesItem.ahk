#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOfflineFilesItem.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a single item in the Offline Files cache.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesitem
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesItem
     * @type {Guid}
     */
    static IID => Guid("{4a753da6-e044-4f12-a718-5d14d079a906}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemType", "GetPath", "GetParentItem", "Refresh", "IsMarkedForDeletion"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesitem-getitemtype
     */
    GetItemType() {
        result := ComCall(3, this, "int*", &pItemType := 0, "HRESULT")
        return pItemType
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @returns {PWSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath() {
        result := ComCall(4, this, "ptr*", &ppszPath := 0, "HRESULT")
        return ppszPath
    }

    /**
     * 
     * @returns {IOfflineFilesItem} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesitem-getparentitem
     */
    GetParentItem() {
        result := ComCall(5, this, "ptr*", &ppItem := 0, "HRESULT")
        return IOfflineFilesItem(ppItem)
    }

    /**
     * 
     * @param {Integer} dwQueryFlags 
     * @returns {HRESULT} 
     */
    Refresh(dwQueryFlags) {
        result := ComCall(6, this, "uint", dwQueryFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesitem-ismarkedfordeletion
     */
    IsMarkedForDeletion() {
        result := ComCall(7, this, "int*", &pbMarkedForDeletion := 0, "HRESULT")
        return pbMarkedForDeletion
    }
}
