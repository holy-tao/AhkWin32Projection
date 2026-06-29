#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IOfflineFilesEvents.ahk" { IOfflineFilesEvents }

/**
 * Used to report additional events associated with Offline Files.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilesevents2
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesEvents2 extends IOfflineFilesEvents {
    /**
     * The interface identifier for IOfflineFilesEvents2
     * @type {Guid}
     */
    static IID := Guid("{1ead8f56-ff76-4faa-a795-6f6ef792498b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesEvents2 interfaces
    */
    struct Vtbl extends IOfflineFilesEvents.Vtbl {
        ItemReconnectBegin       : IntPtr
        ItemReconnectEnd         : IntPtr
        CacheEvictBegin          : IntPtr
        CacheEvictEnd            : IntPtr
        BackgroundSyncBegin      : IntPtr
        BackgroundSyncEnd        : IntPtr
        PolicyChangeDetected     : IntPtr
        PreferenceChangeDetected : IntPtr
        SettingsChangesApplied   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesEvents2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reports that the Offline Files service is beginning to attempt to reconnect all offline scopes.
     * @returns {HRESULT} The return value is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-itemreconnectbegin
     */
    ItemReconnectBegin() {
        result := ComCall(28, this, "HRESULT")
        return result
    }

    /**
     * Reports that the Offline Files service has completed its attempt to reconnect all offline scopes.
     * @returns {HRESULT} The return value is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-itemreconnectend
     */
    ItemReconnectEnd() {
        result := ComCall(29, this, "HRESULT")
        return result
    }

    /**
     * This method is reserved for future use. (IOfflineFilesEvents2.CacheEvictBegin)
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-cacheevictbegin
     */
    CacheEvictBegin() {
        result := ComCall(30, this, "HRESULT")
        return result
    }

    /**
     * This method is reserved for future use. (IOfflineFilesEvents2.CacheEvictEnd)
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-cacheevictend
     */
    CacheEvictEnd() {
        result := ComCall(31, this, "HRESULT")
        return result
    }

    /**
     * Reports that the Offline Files service is beginning to perform a background synchronization pass.
     * @param {Integer} dwSyncControlFlags One or more OFFLINEFILES_SYNC_CONTROL_FLAG_XXXXXX flags describing the purpose of the sync operation.  These may be used to determine if the sync is a one-way or two-way sync. These flags are described in the <i>dwSyncControl</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-synchronize">IOfflineFilesCache::Synchronize</a> method.
     * @returns {HRESULT} The return value is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-backgroundsyncbegin
     */
    BackgroundSyncBegin(dwSyncControlFlags) {
        result := ComCall(32, this, "uint", dwSyncControlFlags, "HRESULT")
        return result
    }

    /**
     * Reports that the Offline Files service completed a background synchronization pass.
     * @param {Integer} dwSyncControlFlags One or more OFFLINEFILES_SYNC_CONTROL_FLAG_XXXXXX flags describing the purpose of the sync operation.  These may be used to determine if the sync is a one-way or two-way sync. These flags are described in the <i>dwSyncControl</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-synchronize">IOfflineFilesCache::Synchronize</a> method.
     * @returns {HRESULT} The return value is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-backgroundsyncend
     */
    BackgroundSyncEnd(dwSyncControlFlags) {
        result := ComCall(33, this, "uint", dwSyncControlFlags, "HRESULT")
        return result
    }

    /**
     * Reports that the Offline Files service detected a change in one or more of its setting values that are controlled by Group Policy.
     * @returns {HRESULT} The return value is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-policychangedetected
     */
    PolicyChangeDetected() {
        result := ComCall(34, this, "HRESULT")
        return result
    }

    /**
     * Reports that the Offline Files service detected a change in one or more of its setting values that are not controlled by Group Policy.
     * @returns {HRESULT} The return value is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-preferencechangedetected
     */
    PreferenceChangeDetected() {
        result := ComCall(35, this, "HRESULT")
        return result
    }

    /**
     * Reports that the Offline Files service has applied the changes that were detected in Group Policy or preference values.
     * @remarks
     * After the Offline Files service reports that it has detected changes in Group Policy or preference settings, it waits for up to 5 seconds before it applies the changes to the system and calls this method. Therefore, up to 5 seconds can elapse between the last <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents2-policychangedetected">PolicyChangeDetected</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents2-preferencechangedetected">PreferenceChangeDetected</a> event and the <b>SettingsChangesApplied</b> event.  An event listener should not make assumptions or perform any actions based on this time interval.
     * @returns {HRESULT} The return value is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents2-settingschangesapplied
     */
    SettingsChangesApplied() {
        result := ComCall(36, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOfflineFilesEvents2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ItemReconnectBegin := CallbackCreate(GetMethod(implObj, "ItemReconnectBegin"), flags, 1)
        this.vtbl.ItemReconnectEnd := CallbackCreate(GetMethod(implObj, "ItemReconnectEnd"), flags, 1)
        this.vtbl.CacheEvictBegin := CallbackCreate(GetMethod(implObj, "CacheEvictBegin"), flags, 1)
        this.vtbl.CacheEvictEnd := CallbackCreate(GetMethod(implObj, "CacheEvictEnd"), flags, 1)
        this.vtbl.BackgroundSyncBegin := CallbackCreate(GetMethod(implObj, "BackgroundSyncBegin"), flags, 2)
        this.vtbl.BackgroundSyncEnd := CallbackCreate(GetMethod(implObj, "BackgroundSyncEnd"), flags, 2)
        this.vtbl.PolicyChangeDetected := CallbackCreate(GetMethod(implObj, "PolicyChangeDetected"), flags, 1)
        this.vtbl.PreferenceChangeDetected := CallbackCreate(GetMethod(implObj, "PreferenceChangeDetected"), flags, 1)
        this.vtbl.SettingsChangesApplied := CallbackCreate(GetMethod(implObj, "SettingsChangesApplied"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ItemReconnectBegin)
        CallbackFree(this.vtbl.ItemReconnectEnd)
        CallbackFree(this.vtbl.CacheEvictBegin)
        CallbackFree(this.vtbl.CacheEvictEnd)
        CallbackFree(this.vtbl.BackgroundSyncBegin)
        CallbackFree(this.vtbl.BackgroundSyncEnd)
        CallbackFree(this.vtbl.PolicyChangeDetected)
        CallbackFree(this.vtbl.PreferenceChangeDetected)
        CallbackFree(this.vtbl.SettingsChangesApplied)
    }
}
