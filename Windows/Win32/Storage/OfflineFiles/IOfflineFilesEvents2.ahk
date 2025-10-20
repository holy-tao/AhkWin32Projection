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
     * 
     * @returns {HRESULT} 
     */
    ItemReconnectBegin() {
        result := ComCall(28, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ItemReconnectEnd() {
        result := ComCall(29, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CacheEvictBegin() {
        result := ComCall(30, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CacheEvictEnd() {
        result := ComCall(31, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSyncControlFlags 
     * @returns {HRESULT} 
     */
    BackgroundSyncBegin(dwSyncControlFlags) {
        result := ComCall(32, this, "uint", dwSyncControlFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSyncControlFlags 
     * @returns {HRESULT} 
     */
    BackgroundSyncEnd(dwSyncControlFlags) {
        result := ComCall(33, this, "uint", dwSyncControlFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PolicyChangeDetected() {
        result := ComCall(34, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PreferenceChangeDetected() {
        result := ComCall(35, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SettingsChangesApplied() {
        result := ComCall(36, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
