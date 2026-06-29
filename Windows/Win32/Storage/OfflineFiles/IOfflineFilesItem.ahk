#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\OFFLINEFILES_ITEM_TYPE.ahk" { OFFLINEFILES_ITEM_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a single item in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilesitem
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesItem extends IUnknown {
    /**
     * The interface identifier for IOfflineFilesItem
     * @type {Guid}
     */
    static IID := Guid("{4a753da6-e044-4f12-a718-5d14d079a906}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesItem interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetItemType         : IntPtr
        GetPath             : IntPtr
        GetParentItem       : IntPtr
        Refresh             : IntPtr
        IsMarkedForDeletion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @returns {OFFLINEFILES_ITEM_TYPE} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_type">OFFLINEFILES_ITEM_TYPE</a> enumeration value that indicates the type of the item.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesitem-getitemtype
     */
    GetItemType() {
        result := ComCall(3, this, "int*", &pItemType := 0, "HRESULT")
        return pItemType
    }

    /**
     * Retrieves the fully qualified UNC path string for an item in the Offline Files cache.
     * @returns {PWSTR} Receives the fully qualified UNC path of the item.  The caller is responsible for freeing the path buffer by using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesitem-getpath
     */
    GetPath() {
        result := ComCall(4, this, PWSTR.Ptr, &ppszPath := 0, "HRESULT")
        return ppszPath
    }

    /**
     * Retrieves the IOfflineFilesItem interface for the parent of the item.
     * @returns {IOfflineFilesItem} Receives the address of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitem">IOfflineFilesItem</a> interface of the parent item.
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
     * Determines whether an item has been deleted from the Offline Files cache.
     * @remarks
     * Due to internal (in-memory) caching of data structures in the remote file system and the CSC driver, deletion of an item might not remove the item from the cache immediately.  An item is first marked for deletion then, after all handles have closed, the item is removed from the cache.  This behavior is most apparent for share items.
     * 
     * Clients should normally treat such items as if they do not exist in the cache.
     * @returns {BOOL} Receives <b>TRUE</b> if the item has been deleted, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesitem-ismarkedfordeletion
     */
    IsMarkedForDeletion() {
        result := ComCall(7, this, BOOL.Ptr, &pbMarkedForDeletion := 0, "HRESULT")
        return pbMarkedForDeletion
    }

    Query(iid) {
        if (IOfflineFilesItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetItemType := CallbackCreate(GetMethod(implObj, "GetItemType"), flags, 2)
        this.vtbl.GetPath := CallbackCreate(GetMethod(implObj, "GetPath"), flags, 2)
        this.vtbl.GetParentItem := CallbackCreate(GetMethod(implObj, "GetParentItem"), flags, 2)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 2)
        this.vtbl.IsMarkedForDeletion := CallbackCreate(GetMethod(implObj, "IsMarkedForDeletion"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetItemType)
        CallbackFree(this.vtbl.GetPath)
        CallbackFree(this.vtbl.GetParentItem)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.IsMarkedForDeletion)
    }
}
