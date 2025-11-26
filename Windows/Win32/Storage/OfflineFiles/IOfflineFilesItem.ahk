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
     * Returns a type code identifying the type of the item:\_server, share, directory, or file.
     * @returns {Integer} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_type">OFFLINEFILES_ITEM_TYPE</a> enumeration value that indicates the type of the item.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesitem-getitemtype
     */
    GetItemType() {
        result := ComCall(3, this, "int*", &pItemType := 0, "HRESULT")
        return pItemType
    }

    /**
     * Retrieves the fully qualified UNC path string for an item in the Offline Files cache.
     * @returns {PWSTR} Receives the fully qualified UNC path of the item.  The caller is responsible for freeing the path buffer by using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesitem-getpath
     */
    GetPath() {
        result := ComCall(4, this, "ptr*", &ppszPath := 0, "HRESULT")
        return ppszPath
    }

    /**
     * Retrieves the IOfflineFilesItem interface for the parent of the item.
     * @returns {IOfflineFilesItem} Receives the address of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitem">IOfflineFilesItem</a> interface of the parent item.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesitem-getparentitem
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
     * Determines whether an item has been deleted from the Offline Files cache.
     * @returns {BOOL} Receives <b>TRUE</b> if the item has been deleted, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesitem-ismarkedfordeletion
     */
    IsMarkedForDeletion() {
        result := ComCall(7, this, "int*", &pbMarkedForDeletion := 0, "HRESULT")
        return pbMarkedForDeletion
    }
}
