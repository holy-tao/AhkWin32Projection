#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOfflineFilesItem.ahk" { IOfflineFilesItem }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents a file item in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilesfileitem
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesFileItem extends IOfflineFilesItem {
    /**
     * The interface identifier for IOfflineFilesFileItem
     * @type {Guid}
     */
    static IID := Guid("{8dfadead-26c2-4eff-8a72-6b50723d9a00}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesFileItem interfaces
    */
    struct Vtbl extends IOfflineFilesItem.Vtbl {
        IsSparse    : IntPtr
        IsEncrypted : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesFileItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether an item in the Offline Files cache is sparsely cached.
     * @remarks
     * A sparsely cached item is an item that has an entry in the Offline Files cache but is not completely cached; not all of its data blocks have been read into the cache.  Such items must first be filled before they are available for offline use.  The Offline Files service automatically fills sparse files on a frequent schedule.
     * 
     * To fill sparse files manually, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-synchronize">IOfflineFilesCache::Synchronize</a> method, setting the OFFLINEFILES_SYNC_CONTROL_FLAG_FILLSPARSE control flag in the <i>dwSyncControl</i> parameter.
     * @returns {BOOL} Receives <b>TRUE</b> if the item is sparsely cached, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesfileitem-issparse
     */
    IsSparse() {
        result := ComCall(8, this, BOOL.Ptr, &pbIsSparse := 0, "HRESULT")
        return pbIsSparse
    }

    /**
     * Determines whether an item in the Offline Files cache is encrypted.
     * @returns {BOOL} Receives <b>TRUE</b> if the item is encrypted, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesfileitem-isencrypted
     */
    IsEncrypted() {
        result := ComCall(9, this, BOOL.Ptr, &pbIsEncrypted := 0, "HRESULT")
        return pbIsEncrypted
    }

    Query(iid) {
        if (IOfflineFilesFileItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsSparse := CallbackCreate(GetMethod(implObj, "IsSparse"), flags, 2)
        this.vtbl.IsEncrypted := CallbackCreate(GetMethod(implObj, "IsEncrypted"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsSparse)
        CallbackFree(this.vtbl.IsEncrypted)
    }
}
