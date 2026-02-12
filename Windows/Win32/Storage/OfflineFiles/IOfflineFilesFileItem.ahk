#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOfflineFilesItem.ahk

/**
 * Represents a file item in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nn-cscobj-iofflinefilesfileitem
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesFileItem extends IOfflineFilesItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesFileItem
     * @type {Guid}
     */
    static IID => Guid("{8dfadead-26c2-4eff-8a72-6b50723d9a00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSparse", "IsEncrypted"]

    /**
     * Determines whether an item in the Offline Files cache is sparsely cached.
     * @remarks
     * A sparsely cached item is an item that has an entry in the Offline Files cache but is not completely cached; not all of its data blocks have been read into the cache.  Such items must first be filled before they are available for offline use.  The Offline Files service automatically fills sparse files on a frequent schedule.
     * 
     * To fill sparse files manually, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-synchronize">IOfflineFilesCache::Synchronize</a> method, setting the OFFLINEFILES_SYNC_CONTROL_FLAG_FILLSPARSE control flag in the <i>dwSyncControl</i> parameter.
     * @returns {BOOL} Receives <b>TRUE</b> if the item is sparsely cached, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nf-cscobj-iofflinefilesfileitem-issparse
     */
    IsSparse() {
        result := ComCall(8, this, "int*", &pbIsSparse := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbIsSparse
    }

    /**
     * Determines whether an item in the Offline Files cache is encrypted.
     * @returns {BOOL} Receives <b>TRUE</b> if the item is encrypted, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nf-cscobj-iofflinefilesfileitem-isencrypted
     */
    IsEncrypted() {
        result := ComCall(9, this, "int*", &pbIsEncrypted := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbIsEncrypted
    }
}
