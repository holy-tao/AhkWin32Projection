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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-itemreconnectbegin
     */
    ItemReconnectBegin() {
        result := ComCall(28, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-itemreconnectend
     */
    ItemReconnectEnd() {
        result := ComCall(29, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-cacheevictbegin
     */
    CacheEvictBegin() {
        result := ComCall(30, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-cacheevictend
     */
    CacheEvictEnd() {
        result := ComCall(31, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSyncControlFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-backgroundsyncbegin
     */
    BackgroundSyncBegin(dwSyncControlFlags) {
        result := ComCall(32, this, "uint", dwSyncControlFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSyncControlFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-backgroundsyncend
     */
    BackgroundSyncEnd(dwSyncControlFlags) {
        result := ComCall(33, this, "uint", dwSyncControlFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-policychangedetected
     */
    PolicyChangeDetected() {
        result := ComCall(34, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-preferencechangedetected
     */
    PreferenceChangeDetected() {
        result := ComCall(35, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-settingschangesapplied
     */
    SettingsChangesApplied() {
        result := ComCall(36, this, "HRESULT")
        return result
    }
}
