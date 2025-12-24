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
     * This method is reserved for future use.
     * @param {PWSTR} pszOldPath 
     * @param {PWSTR} pszNewPath 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-cachemoved
     */
    CacheMoved(pszOldPath, pszNewPath) {
        pszOldPath := pszOldPath is String ? StrPtr(pszOldPath) : pszOldPath
        pszNewPath := pszNewPath is String ? StrPtr(pszNewPath) : pszNewPath

        result := ComCall(3, this, "ptr", pszOldPath, "ptr", pszNewPath, "HRESULT")
        return result
    }

    /**
     * This method is reserved for future use.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-cacheisfull
     */
    CacheIsFull() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * This method is reserved for future use.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-cacheiscorrupted
     */
    CacheIsCorrupted() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * This method is reserved for future use.
     * @param {BOOL} bEnabled 
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-enabled
     */
    Enabled(bEnabled) {
        result := ComCall(6, this, "int", bEnabled, "HRESULT")
        return result
    }

    /**
     * This method is reserved for future use.
     * @param {BOOL} bWasEncrypted 
     * @param {BOOL} bWasPartial 
     * @param {BOOL} bIsEncrypted 
     * @param {BOOL} bIsPartial 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-encryptionchanged
     */
    EncryptionChanged(bWasEncrypted, bWasPartial, bIsEncrypted, bIsPartial) {
        result := ComCall(7, this, "int", bWasEncrypted, "int", bWasPartial, "int", bIsEncrypted, "int", bIsPartial, "HRESULT")
        return result
    }

    /**
     * Reports that the Offline Files cache has begun a synchronization operation.
     * @param {Pointer<Guid>} rSyncId Unique identifier for the synchronization operation that generated this event.  Provided by the caller of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-synchronize">IOfflineFilesCache::Synchronize</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-pin">IOfflineFilesCache::Pin</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-unpin">IOfflineFilesCache::Unpin</a> method.  This is GUID_NULL if no ID was provided.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-syncbegin
     */
    SyncBegin(rSyncId) {
        result := ComCall(8, this, "ptr", rSyncId, "HRESULT")
        return result
    }

    /**
     * Reports the result of synchronizing a particular file.
     * @param {Pointer<Guid>} rSyncId Unique identifier for the synchronization operation that generated this event.  Provided by the caller of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-synchronize">IOfflineFilesCache::Synchronize</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-pin">IOfflineFilesCache::Pin</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-unpin">IOfflineFilesCache::Unpin</a> method.  This is GUID_NULL if no ID was provided.
     * @param {PWSTR} pszFile Fully qualified UNC path of the processed file.
     * @param {HRESULT} hrResult Result of the sync operation on this file.  The parameter will contain S_OK if the operation completed successfully or an value otherwise.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-syncfileresult
     */
    SyncFileResult(rSyncId, pszFile, hrResult) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(9, this, "ptr", rSyncId, "ptr", pszFile, "int", hrResult, "HRESULT")
        return result
    }

    /**
     * Reports that a sync conflict has been detected and recorded in the sync conflict log.
     * @param {PWSTR} pszConflictPath The UNC path of the item in conflict.
     * @param {Pointer<FILETIME>} pftConflictDateTime Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the date and time when the conflict was detected.  The value is in UTC.
     * @param {Integer} ConflictSyncState Describes the state of the local and remote items in conflict.  One of the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_sync_state">OFFLINEFILES_SYNC_STATE</a> sync state values, such as
     * 
     * OFFLINEFILES_SYNC_STATE_FileChangedOnClient_ChangedOnServer
     * 
     * .
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-syncconflictrecadded
     */
    SyncConflictRecAdded(pszConflictPath, pftConflictDateTime, ConflictSyncState) {
        pszConflictPath := pszConflictPath is String ? StrPtr(pszConflictPath) : pszConflictPath

        result := ComCall(10, this, "ptr", pszConflictPath, "ptr", pftConflictDateTime, "int", ConflictSyncState, "HRESULT")
        return result
    }

    /**
     * Reports that a sync conflict has been detected and that a record of the conflict was already present in the sync conflict log.
     * @param {PWSTR} pszConflictPath The UNC path of the item in conflict.
     * @param {Pointer<FILETIME>} pftConflictDateTime Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the date and time when the conflict was detected.  The value is in UTC.
     * @param {Integer} ConflictSyncState Describes the state of the local and remote items in conflict.  One of the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_sync_state">OFFLINEFILES_SYNC_STATE</a> sync state values, such as
     * 
     * OFFLINEFILES_SYNC_STATE_FileChangedOnClient_ChangedOnServer
     * 
     * .
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-syncconflictrecupdated
     */
    SyncConflictRecUpdated(pszConflictPath, pftConflictDateTime, ConflictSyncState) {
        pszConflictPath := pszConflictPath is String ? StrPtr(pszConflictPath) : pszConflictPath

        result := ComCall(11, this, "ptr", pszConflictPath, "ptr", pftConflictDateTime, "int", ConflictSyncState, "HRESULT")
        return result
    }

    /**
     * Reports that a sync conflict no longer exists and that its record has been removed from the sync conflict log.
     * @param {PWSTR} pszConflictPath The UNC path of the item that was in conflict.
     * @param {Pointer<FILETIME>} pftConflictDateTime Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the date and time when the deleted conflict was detected.  The value is in UTC.
     * @param {Integer} ConflictSyncState Describes the state of the local and remote items in conflict.  One of the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_sync_state">OFFLINEFILES_SYNC_STATE</a> sync state values, such as
     * 
     * OFFLINEFILES_SYNC_STATE_FileChangedOnClient_ChangedOnServer
     * 
     * .
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-syncconflictrecremoved
     */
    SyncConflictRecRemoved(pszConflictPath, pftConflictDateTime, ConflictSyncState) {
        pszConflictPath := pszConflictPath is String ? StrPtr(pszConflictPath) : pszConflictPath

        result := ComCall(12, this, "ptr", pszConflictPath, "ptr", pftConflictDateTime, "int", ConflictSyncState, "HRESULT")
        return result
    }

    /**
     * Reports that the Offline Files cache has ended a synchronize operation.
     * @param {Pointer<Guid>} rSyncId Unique identifier for the synchronization operation that generated this event.  Provided by the caller of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-synchronize">IOfflineFilesCache::Synchronize</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-pin">IOfflineFilesCache::Pin</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-unpin">IOfflineFilesCache::Unpin</a> method.  This is GUID_NULL if no ID was provided.
     * @param {HRESULT} hrResult Result value indicating the reason for the end of the sync operation.  This parameter will be S_OK if the operation completed successfully, HRESULT_FROM_WIN32(ERROR_CANCELLED) if the operation was aborted and an error value if some other failure caused the operation to complete prematurely.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-syncend
     */
    SyncEnd(rSyncId, hrResult) {
        result := ComCall(13, this, "ptr", rSyncId, "int", hrResult, "HRESULT")
        return result
    }

    /**
     * Reports that the Offline Files feature has detected the arrival of a network transport.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-nettransportarrived
     */
    NetTransportArrived() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Reports that the Offline Files feature has detected that no network transports are available.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-nonettransports
     */
    NoNetTransports() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Reports that an item in the Offline Files cache has transitioned from online to offline.
     * @param {PWSTR} pszPath The item's UNC path string.
     * @param {Integer} ItemType An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_type">OFFLINEFILES_ITEM_TYPE</a> enumeration value that indicates the type of the item.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-itemdisconnected
     */
    ItemDisconnected(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(16, this, "ptr", pszPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * Reports that an item in the Offline Files cache has transitioned from offline to online.
     * @param {PWSTR} pszPath The item's UNC path string.
     * @param {Integer} ItemType An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_type">OFFLINEFILES_ITEM_TYPE</a> enumeration value that indicates the type of the item.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-itemreconnected
     */
    ItemReconnected(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(17, this, "ptr", pszPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * Reports that an item in the Offline Files cache is now available for offline use should the remote copy become unavailable.
     * @param {PWSTR} pszPath The item's UNC path string.
     * @param {Integer} ItemType An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_type">OFFLINEFILES_ITEM_TYPE</a> enumeration value that indicates the type of the item.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-itemavailableoffline
     */
    ItemAvailableOffline(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(18, this, "ptr", pszPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * Reports that an item in the Offline Files cache is no longer available for offline use should the remote copy become unavailable.
     * @param {PWSTR} pszPath The item's UNC path string.
     * @param {Integer} ItemType An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_type">OFFLINEFILES_ITEM_TYPE</a> enumeration value that indicates the type of the item.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-itemnotavailableoffline
     */
    ItemNotAvailableOffline(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(19, this, "ptr", pszPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * Reports that an item in the Offline Files cache is now pinned and guaranteed to be available offline should the remote copy become unavailable.
     * @param {PWSTR} pszPath The item's UNC path string.
     * @param {Integer} ItemType An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_type">OFFLINEFILES_ITEM_TYPE</a> enumeration value that indicates the type of the item.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-itempinned
     */
    ItemPinned(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(20, this, "ptr", pszPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * Reports that an item in the Offline Files cache is no longer pinned.
     * @param {PWSTR} pszPath The item's UNC path string.
     * @param {Integer} ItemType An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_type">OFFLINEFILES_ITEM_TYPE</a> enumeration value that indicates the type of the item.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-itemnotpinned
     */
    ItemNotPinned(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(21, this, "ptr", pszPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * Reports that an item in the Offline Files cache has been modified.
     * @param {PWSTR} pszPath The item's UNC path string.
     * @param {Integer} ItemType An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_type">OFFLINEFILES_ITEM_TYPE</a> enumeration value that indicates the type of the item.
     * @param {BOOL} bModifiedData <b>TRUE</b> if the item's data was modified, <b>FALSE</b> otherwise.
     * @param {BOOL} bModifiedAttributes <b>TRUE</b> if one or more of the item's attributes were modified, <b>FALSE</b> otherwise.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-itemmodified
     */
    ItemModified(pszPath, ItemType, bModifiedData, bModifiedAttributes) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(22, this, "ptr", pszPath, "int", ItemType, "int", bModifiedData, "int", bModifiedAttributes, "HRESULT")
        return result
    }

    /**
     * Reports that an item has been added to the Offline Files cache.
     * @param {PWSTR} pszPath The item's UNC path string.
     * @param {Integer} ItemType An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_type">OFFLINEFILES_ITEM_TYPE</a> enumeration value that indicates the type of the item.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-itemaddedtocache
     */
    ItemAddedToCache(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(23, this, "ptr", pszPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * Reports that an item has been removed from the Offline Files cache.
     * @param {PWSTR} pszPath The item's UNC path string.
     * @param {Integer} ItemType An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_type">OFFLINEFILES_ITEM_TYPE</a> enumeration value that indicates the type of the item.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-itemdeletedfromcache
     */
    ItemDeletedFromCache(pszPath, ItemType) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(24, this, "ptr", pszPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * Reports that the path for an item in the Offline Files cache has been renamed.
     * @param {PWSTR} pszOldPath Original UNC path string for the item.
     * @param {PWSTR} pszNewPath New UNC path string for the item.
     * @param {Integer} ItemType An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_type">OFFLINEFILES_ITEM_TYPE</a> enumeration value that indicates the type of the item.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-itemrenamed
     */
    ItemRenamed(pszOldPath, pszNewPath, ItemType) {
        pszOldPath := pszOldPath is String ? StrPtr(pszOldPath) : pszOldPath
        pszNewPath := pszNewPath is String ? StrPtr(pszNewPath) : pszNewPath

        result := ComCall(25, this, "ptr", pszOldPath, "ptr", pszNewPath, "int", ItemType, "HRESULT")
        return result
    }

    /**
     * Reports that one or more events destined for this event sink have been lost and will not be delivered.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-datalost
     */
    DataLost() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * This event is delivered to all registered event subscribers on a periodic basis.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents-ping
     */
    Ping() {
        result := ComCall(27, this, "HRESULT")
        return result
    }
}
