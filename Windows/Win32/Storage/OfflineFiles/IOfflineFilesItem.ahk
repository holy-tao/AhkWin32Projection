#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOfflineFilesItem.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a single item in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nn-cscobj-iofflinefilesitem
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
     * @remarks
     * Another way to determine an item's type is to query the item for one of the following type-specific interfaces:
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesdirectoryitem">IOfflineFilesDirectoryItem</a>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesfileitem">IOfflineFilesFileItem</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesserveritem">IOfflineFilesServerItem</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesshareitem">IOfflineFilesShareItem</a>
     * If the call to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> succeeds, the item is of the requested type.  An item can be of only one of the above types.
     * @returns {Integer} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_type">OFFLINEFILES_ITEM_TYPE</a> enumeration value that indicates the type of the item.
     * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nf-cscobj-iofflinefilesitem-getitemtype
     */
    GetItemType() {
        result := ComCall(3, this, "int*", &pItemType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pItemType
    }

    /**
     * Retrieves the fully qualified UNC path string for an item in the Offline Files cache.
     * @returns {PWSTR} Receives the fully qualified UNC path of the item.  The caller is responsible for freeing the path buffer by using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nf-cscobj-iofflinefilesitem-getpath
     */
    GetPath() {
        result := ComCall(4, this, "ptr*", &ppszPath := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszPath
    }

    /**
     * Retrieves the IOfflineFilesItem interface for the parent of the item.
     * @returns {IOfflineFilesItem} Receives the address of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitem">IOfflineFilesItem</a> interface of the parent item.
     * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nf-cscobj-iofflinefilesitem-getparentitem
     */
    GetParentItem() {
        result := ComCall(5, this, "ptr*", &ppItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOfflineFilesItem(ppItem)
    }

    /**
     * Refresh Method (RDS)
     * @remarks
     * You must set the [Connect](./connect-property-rds.md), [Server](./server-property-rds.md), and [SQL](./sql-property.md) properties before you use the **Refresh** method. All data-bound controls on the form associated with an **RDS.DataControl** object will reflect the new set of records. Any pre-existing [Recordset](../ado-api/recordset-object-ado.md) object is released, and any unsaved changes are discarded. The **Refresh** method automatically makes the first record the current record.  
     *   
     *  It is a good idea to call the **Refresh** method periodically when you work with data. If you retrieve data, and then leave it on a client computer for a while, it is likely to become out of date. It is possible that any changes that you make will fail, because someone else might have changed the record and submitted changes before you.
     * @param {Integer} dwQueryFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/refresh-method-rds
     */
    Refresh(dwQueryFlags) {
        result := ComCall(6, this, "uint", dwQueryFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether an item has been deleted from the Offline Files cache.
     * @remarks
     * Due to internal (in-memory) caching of data structures in the remote file system and the CSC driver, deletion of an item might not remove the item from the cache immediately.  An item is first marked for deletion then, after all handles have closed, the item is removed from the cache.  This behavior is most apparent for share items.
     * 
     * Clients should normally treat such items as if they do not exist in the cache.
     * @returns {BOOL} Receives <b>TRUE</b> if the item has been deleted, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nf-cscobj-iofflinefilesitem-ismarkedfordeletion
     */
    IsMarkedForDeletion() {
        result := ComCall(7, this, "int*", &pbMarkedForDeletion := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbMarkedForDeletion
    }
}
