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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CacheMoved", "CacheIsFull", "CacheIsCorrupted", "Enabled", "EncryptionChanged", "SyncBegin", "SyncFileResult", "SyncConflictRecAdded", "SyncConflictRecUpdated", "SyncConflictRecRemoved", "SyncEnd", "NetTransportArrived", "NoNetTransports", "ItemDisconnected", "ItemReconnected", "ItemAvailableOffline", "ItemNotAvailableOffline", "ItemPinned", "ItemNotPinned", "ItemModified", "ItemAddedToCache", "ItemDeletedFromCache", "ItemRenamed", "DataLost", "Ping"]

    /**
     * 
     * @param {PWSTR} pszOldPath 
     * @param {PWSTR} pszNewPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-cachemoved
     */
    CacheMoved(pszOldPath, pszNewPath) {
        pszOldPath := pszOldPath is String ? StrPtr(pszOldPath) : pszOldPath
        pszNewPath := pszNewPath is String ? StrPtr(pszNewPath) : pszNewPath

        result := ComCall(3, this, "ptr", pszOldPath, "ptr", pszNewPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-cacheisfull
     */
    CacheIsFull() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-cacheiscorrupted
     */
    CacheIsCorrupted() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-enabled
     */
    Enabled(bEnabled) {
        result := ComCall(6, this, "int", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bWasEncrypted 
     * @param {BOOL} bWasPartial 
     * @param {BOOL} bIsEncrypted 
     * @param {BOOL} bIsPartial 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-encryptionchanged
     */
    EncryptionChanged(bWasEncrypted, bWasPartial, bIsEncrypted, bIsPartial) {
        result := ComCall(7, this, "int", bWasEncrypted, "int", bWasPartial, "int", bIsEncrypted, "int", bIsPartial, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rSyncId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-syncbegin
     */
    SyncBegin(rSyncId) {
        result := ComCall(8, this, "ptr", rSyncId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rSyncId 
     * @param {PWSTR} pszFile 
     * @param {HRESULT} hrResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-syncfileresult
     */
    SyncFileResult(rSyncId, pszFile, hrResult) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(9, this, "ptr", rSyncId, "ptr", pszFile, "int", hrResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszConflictPath 
     * @param {Pointer<FILETIME>} pftConflictDateTime 
     * @param {Integer} ConflictSyncState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-syncconflictrecadded
     */
    SyncConflictRecAdded(pszConflictPath, pftConflictDateTime, ConflictSyncState) {
        pszConflictPath := pszConflictPath is String ? StrPtr(pszConflictPath) : pszConflictPath

        result := ComCall(10, this, "ptr", pszConflictPath, "ptr", pftConflictDateTime, "int", ConflictSyncState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszConflictPath 
     * @param {Pointer<FILETIME>} pftConflictDateTime 
     * @param {Integer} ConflictSyncState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-syncconflictrecupdated
     */
    SyncConflictRecUpdated(pszConflictPath, pftConflictDateTime, ConflictSyncState) {
        pszConflictPath := pszConflictPath is String ? StrPtr(pszConflictPath) : pszConflictPath

        result := ComCall(11, this, "ptr", pszConflictPath, "ptr", pftConflictDateTime, "int", ConflictSyncState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszConflictPath 
     * @param {Pointer<FILETIME>} pftConflictDateTime 
     * @param {Integer} ConflictSyncState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-syncconflictrecremoved
     */
    SyncConflictRecRemoved(pszConflictPath, pftConflictDateTime, ConflictSyncState) {
        pszConflictPath := pszConflictPath is String ? StrPtr(pszConflictPath) : pszConflictPath

        result := ComCall(12, this, "ptr", pszConflictPath, "ptr", pftConflictDateTime, "int", ConflictSyncState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rSyncId 
     * @param {HRESULT} hrResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-syncend
     */
    SyncEnd(rSyncId, hrResult) {
        result := ComCall(13, this, "ptr", rSyncId, "int", hrResult, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-nettransportarrived
     */
    NetTransportArrived() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-nonettransports
     */
    NoNetTransports() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-itemdisconnected
     */
    ItemDisconnected(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(16, this, "ptr", pszPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-itemreconnected
     */
    ItemReconnected(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(17, this, "ptr", pszPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-itemavailableoffline
     */
    ItemAvailableOffline(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(18, this, "ptr", pszPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-itemnotavailableoffline
     */
    ItemNotAvailableOffline(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(19, this, "ptr", pszPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-itempinned
     */
    ItemPinned(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(20, this, "ptr", pszPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-itemnotpinned
     */
    ItemNotPinned(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(21, this, "ptr", pszPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @param {BOOL} bModifiedData 
     * @param {BOOL} bModifiedAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-itemmodified
     */
    ItemModified(pszPath, ItemType, bModifiedData, bModifiedAttributes) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(22, this, "ptr", pszPath, "int", ItemType, "int", bModifiedData, "int", bModifiedAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-itemaddedtocache
     */
    ItemAddedToCache(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(23, this, "ptr", pszPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-itemdeletedfromcache
     */
    ItemDeletedFromCache(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(24, this, "ptr", pszPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszOldPath 
     * @param {PWSTR} pszNewPath 
     * @param {Integer} ItemType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-itemrenamed
     */
    ItemRenamed(pszOldPath, pszNewPath, ItemType) {
        pszOldPath := pszOldPath is String ? StrPtr(pszOldPath) : pszOldPath
        pszNewPath := pszNewPath is String ? StrPtr(pszNewPath) : pszNewPath

        result := ComCall(25, this, "ptr", pszOldPath, "ptr", pszNewPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-datalost
     */
    DataLost() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents-ping
     */
    Ping() {
        result := ComCall(27, this, "HRESULT")
        return result
    }
}
