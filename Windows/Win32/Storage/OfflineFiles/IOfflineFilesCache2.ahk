#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOfflineFilesCache.ahk

/**
 * Implements the RenameItemEx method.
 * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nn-cscobj-iofflinefilescache2
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesCache2 extends IOfflineFilesCache{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesCache2
     * @type {Guid}
     */
    static IID => Guid("{8c075039-1551-4ed9-8781-56705c04d3c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RenameItemEx"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nf-cscobj-iofflinefilescache2-renameitemex
     */
    RenameItemEx(pszPathOriginal, pszPathNew, bReplaceIfExists) {
        pszPathOriginal := pszPathOriginal is String ? StrPtr(pszPathOriginal) : pszPathOriginal
        pszPathNew := pszPathNew is String ? StrPtr(pszPathNew) : pszPathNew

        result := ComCall(20, this, "ptr", pszPathOriginal, "ptr", pszPathNew, "int", bReplaceIfExists, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
