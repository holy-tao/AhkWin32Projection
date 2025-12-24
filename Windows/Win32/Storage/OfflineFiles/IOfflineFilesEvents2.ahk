#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOfflineFilesEvents.ahk

/**
 * Used to report additional events associated with Offline Files.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesevents2
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesEvents2 extends IOfflineFilesEvents{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesEvents2
     * @type {Guid}
     */
    static IID => Guid("{1ead8f56-ff76-4faa-a795-6f6ef792498b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ItemReconnectBegin", "ItemReconnectEnd", "CacheEvictBegin", "CacheEvictEnd", "BackgroundSyncBegin", "BackgroundSyncEnd", "PolicyChangeDetected", "PreferenceChangeDetected", "SettingsChangesApplied"]

    /**
     * Reports that the Offline Files service is beginning to attempt to reconnect all offline scopes.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents2-itemreconnectbegin
     */
    ItemReconnectBegin() {
        result := ComCall(28, this, "HRESULT")
        return result
    }

    /**
     * Reports that the Offline Files service has completed its attempt to reconnect all offline scopes.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents2-itemreconnectend
     */
    ItemReconnectEnd() {
        result := ComCall(29, this, "HRESULT")
        return result
    }

    /**
     * This method is reserved for future use.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents2-cacheevictbegin
     */
    CacheEvictBegin() {
        result := ComCall(30, this, "HRESULT")
        return result
    }

    /**
     * This method is reserved for future use.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents2-cacheevictend
     */
    CacheEvictEnd() {
        result := ComCall(31, this, "HRESULT")
        return result
    }

    /**
     * Reports that the Offline Files service is beginning to perform a background synchronization pass.
     * @param {Integer} dwSyncControlFlags One or more OFFLINEFILES_SYNC_CONTROL_FLAG_XXXXXX flags describing the purpose of the sync operation.  These may be used to determine if the sync is a one-way or two-way sync. These flags are described in the <i>dwSyncControl</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-synchronize">IOfflineFilesCache::Synchronize</a> method.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents2-backgroundsyncbegin
     */
    BackgroundSyncBegin(dwSyncControlFlags) {
        result := ComCall(32, this, "uint", dwSyncControlFlags, "HRESULT")
        return result
    }

    /**
     * Reports that the Offline Files service completed a background synchronization pass.
     * @param {Integer} dwSyncControlFlags One or more OFFLINEFILES_SYNC_CONTROL_FLAG_XXXXXX flags describing the purpose of the sync operation.  These may be used to determine if the sync is a one-way or two-way sync. These flags are described in the <i>dwSyncControl</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-synchronize">IOfflineFilesCache::Synchronize</a> method.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents2-backgroundsyncend
     */
    BackgroundSyncEnd(dwSyncControlFlags) {
        result := ComCall(33, this, "uint", dwSyncControlFlags, "HRESULT")
        return result
    }

    /**
     * Reports that the Offline Files service detected a change in one or more of its setting values that are controlled by Group Policy.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents2-policychangedetected
     */
    PolicyChangeDetected() {
        result := ComCall(34, this, "HRESULT")
        return result
    }

    /**
     * Reports that the Offline Files service detected a change in one or more of its setting values that are not controlled by Group Policy.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents2-preferencechangedetected
     */
    PreferenceChangeDetected() {
        result := ComCall(35, this, "HRESULT")
        return result
    }

    /**
     * Reports that the Offline Files service has applied the changes that were detected in Group Policy or preference values.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesevents2-settingschangesapplied
     */
    SettingsChangesApplied() {
        result := ComCall(36, this, "HRESULT")
        return result
    }
}
