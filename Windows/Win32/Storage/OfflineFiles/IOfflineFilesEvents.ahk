#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to report significant events associated with Offline Files.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesevents
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesEvents extends IUnknown{
    /**
     * The interface identifier for IOfflineFilesEvents
     * @type {Guid}
     */
    static IID => Guid("{e25585c1-0caa-4eb1-873b-1cae5b77c314}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszOldPath 
     * @param {PWSTR} pszNewPath 
     * @returns {HRESULT} 
     */
    CacheMoved(pszOldPath, pszNewPath) {
        pszOldPath := pszOldPath is String ? StrPtr(pszOldPath) : pszOldPath
        pszNewPath := pszNewPath is String ? StrPtr(pszNewPath) : pszNewPath

        result := ComCall(3, this, "ptr", pszOldPath, "ptr", pszNewPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CacheIsFull() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CacheIsCorrupted() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    Enabled(bEnabled) {
        result := ComCall(6, this, "int", bEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bWasEncrypted 
     * @param {BOOL} bWasPartial 
     * @param {BOOL} bIsEncrypted 
     * @param {BOOL} bIsPartial 
     * @returns {HRESULT} 
     */
    EncryptionChanged(bWasEncrypted, bWasPartial, bIsEncrypted, bIsPartial) {
        result := ComCall(7, this, "int", bWasEncrypted, "int", bWasPartial, "int", bIsEncrypted, "int", bIsPartial, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rSyncId 
     * @returns {HRESULT} 
     */
    SyncBegin(rSyncId) {
        result := ComCall(8, this, "ptr", rSyncId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rSyncId 
     * @param {PWSTR} pszFile 
     * @param {HRESULT} hrResult 
     * @returns {HRESULT} 
     */
    SyncFileResult(rSyncId, pszFile, hrResult) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(9, this, "ptr", rSyncId, "ptr", pszFile, "int", hrResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszConflictPath 
     * @param {Pointer<FILETIME>} pftConflictDateTime 
     * @param {Integer} ConflictSyncState 
     * @returns {HRESULT} 
     */
    SyncConflictRecAdded(pszConflictPath, pftConflictDateTime, ConflictSyncState) {
        pszConflictPath := pszConflictPath is String ? StrPtr(pszConflictPath) : pszConflictPath

        result := ComCall(10, this, "ptr", pszConflictPath, "ptr", pftConflictDateTime, "int", ConflictSyncState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszConflictPath 
     * @param {Pointer<FILETIME>} pftConflictDateTime 
     * @param {Integer} ConflictSyncState 
     * @returns {HRESULT} 
     */
    SyncConflictRecUpdated(pszConflictPath, pftConflictDateTime, ConflictSyncState) {
        pszConflictPath := pszConflictPath is String ? StrPtr(pszConflictPath) : pszConflictPath

        result := ComCall(11, this, "ptr", pszConflictPath, "ptr", pftConflictDateTime, "int", ConflictSyncState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszConflictPath 
     * @param {Pointer<FILETIME>} pftConflictDateTime 
     * @param {Integer} ConflictSyncState 
     * @returns {HRESULT} 
     */
    SyncConflictRecRemoved(pszConflictPath, pftConflictDateTime, ConflictSyncState) {
        pszConflictPath := pszConflictPath is String ? StrPtr(pszConflictPath) : pszConflictPath

        result := ComCall(12, this, "ptr", pszConflictPath, "ptr", pftConflictDateTime, "int", ConflictSyncState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rSyncId 
     * @param {HRESULT} hrResult 
     * @returns {HRESULT} 
     */
    SyncEnd(rSyncId, hrResult) {
        result := ComCall(13, this, "ptr", rSyncId, "int", hrResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NetTransportArrived() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NoNetTransports() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     */
    ItemDisconnected(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(16, this, "ptr", pszPath, "int", ItemType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     */
    ItemReconnected(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(17, this, "ptr", pszPath, "int", ItemType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     */
    ItemAvailableOffline(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(18, this, "ptr", pszPath, "int", ItemType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     */
    ItemNotAvailableOffline(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(19, this, "ptr", pszPath, "int", ItemType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     */
    ItemPinned(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(20, this, "ptr", pszPath, "int", ItemType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     */
    ItemNotPinned(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(21, this, "ptr", pszPath, "int", ItemType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @param {BOOL} bModifiedData 
     * @param {BOOL} bModifiedAttributes 
     * @returns {HRESULT} 
     */
    ItemModified(pszPath, ItemType, bModifiedData, bModifiedAttributes) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(22, this, "ptr", pszPath, "int", ItemType, "int", bModifiedData, "int", bModifiedAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     */
    ItemAddedToCache(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(23, this, "ptr", pszPath, "int", ItemType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     */
    ItemDeletedFromCache(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(24, this, "ptr", pszPath, "int", ItemType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszOldPath 
     * @param {PWSTR} pszNewPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     */
    ItemRenamed(pszOldPath, pszNewPath, ItemType) {
        pszOldPath := pszOldPath is String ? StrPtr(pszOldPath) : pszOldPath
        pszNewPath := pszNewPath is String ? StrPtr(pszNewPath) : pszNewPath

        result := ComCall(25, this, "ptr", pszOldPath, "ptr", pszNewPath, "int", ItemType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DataLost() {
        result := ComCall(26, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Ping() {
        result := ComCall(27, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
