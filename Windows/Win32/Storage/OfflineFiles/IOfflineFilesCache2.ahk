#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IOfflineFilesCache.ahk" { IOfflineFilesCache }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Implements the RenameItemEx method.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilescache2
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesCache2 extends IOfflineFilesCache {
    /**
     * The interface identifier for IOfflineFilesCache2
     * @type {Guid}
     */
    static IID := Guid("{8c075039-1551-4ed9-8781-56705c04d3c0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesCache2 interfaces
    */
    struct Vtbl extends IOfflineFilesCache.Vtbl {
        RenameItemEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesCache2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Renames an item in the cache. This method is identical to the IOfflineFilesCache::RenameItem method, except that it will attempt to do the rename operation right away.
     * @remarks
     * This method does not require system administrator privilege.
     * 
     * If the item to be renamed is a file or directory, it must obey the file system semantics for the rename operation. If the file or a child file (for a directory) is already open, the rename will fail. Also, this method attempts to perform the rename as long as the user has access to the item that is being renamed.
     * 
     * If you need to minimize the chance that the item is in use, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-renameitem">IOfflineFilesCache::RenameItem</a> method instead.
     * @param {PWSTR} pszPathOriginal Fully qualified UNC path of the item (server, share, file or directory) to be renamed.
     * @param {PWSTR} pszPathNew The new path to replace <i>pszPathOriginal</i> if the item that  <i>pszPathOriginal</i> points to exists in the cache.
     * @param {BOOL} bReplaceIfExists This parameter is reserved for future use.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache2-renameitemex
     */
    RenameItemEx(pszPathOriginal, pszPathNew, bReplaceIfExists) {
        pszPathOriginal := pszPathOriginal is String ? StrPtr(pszPathOriginal) : pszPathOriginal
        pszPathNew := pszPathNew is String ? StrPtr(pszPathNew) : pszPathNew

        result := ComCall(20, this, "ptr", pszPathOriginal, "ptr", pszPathNew, BOOL, bReplaceIfExists, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOfflineFilesCache2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RenameItemEx := CallbackCreate(GetMethod(implObj, "RenameItemEx"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RenameItemEx)
    }
}
