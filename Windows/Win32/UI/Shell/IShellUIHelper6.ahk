#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IShellUIHelper5.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellUIHelper6 extends IShellUIHelper5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellUIHelper6
     * @type {Guid}
     */
    static IID => Guid("{987a573e-46ee-4e89-96ab-ddf7f8fdc98c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 74

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["msStopPeriodicTileUpdate", "msStartPeriodicTileUpdate", "msStartPeriodicTileUpdateBatch", "msClearTile", "msEnableTileNotificationQueue", "msPinnedSiteState", "msEnableTileNotificationQueueForSquare150x150", "msEnableTileNotificationQueueForWide310x150", "msEnableTileNotificationQueueForSquare310x310", "msScheduledTileNotification", "msRemoveScheduledTileNotification", "msStartPeriodicBadgeUpdate", "msStopPeriodicBadgeUpdate", "msLaunchInternetOptions"]

    /**
     * 
     * @returns {HRESULT} 
     */
    msStopPeriodicTileUpdate() {
        result := ComCall(74, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} pollingUris 
     * @param {VARIANT} startTime 
     * @param {VARIANT} uiUpdateRecurrence 
     * @returns {HRESULT} 
     */
    msStartPeriodicTileUpdate(pollingUris, startTime, uiUpdateRecurrence) {
        result := ComCall(75, this, "ptr", pollingUris, "ptr", startTime, "ptr", uiUpdateRecurrence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} pollingUris 
     * @param {VARIANT} startTime 
     * @param {VARIANT} uiUpdateRecurrence 
     * @returns {HRESULT} 
     */
    msStartPeriodicTileUpdateBatch(pollingUris, startTime, uiUpdateRecurrence) {
        result := ComCall(76, this, "ptr", pollingUris, "ptr", startTime, "ptr", uiUpdateRecurrence, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msClearTile() {
        result := ComCall(77, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fChange 
     * @returns {HRESULT} 
     */
    msEnableTileNotificationQueue(fChange) {
        result := ComCall(78, this, "short", fChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarSiteState 
     * @returns {HRESULT} 
     */
    msPinnedSiteState(pvarSiteState) {
        result := ComCall(79, this, "ptr", pvarSiteState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fChange 
     * @returns {HRESULT} 
     */
    msEnableTileNotificationQueueForSquare150x150(fChange) {
        result := ComCall(80, this, "short", fChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fChange 
     * @returns {HRESULT} 
     */
    msEnableTileNotificationQueueForWide310x150(fChange) {
        result := ComCall(81, this, "short", fChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fChange 
     * @returns {HRESULT} 
     */
    msEnableTileNotificationQueueForSquare310x310(fChange) {
        result := ComCall(82, this, "short", fChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrNotificationXml 
     * @param {BSTR} bstrNotificationId 
     * @param {BSTR} bstrNotificationTag 
     * @param {VARIANT} startTime 
     * @param {VARIANT} expirationTime 
     * @returns {HRESULT} 
     */
    msScheduledTileNotification(bstrNotificationXml, bstrNotificationId, bstrNotificationTag, startTime, expirationTime) {
        bstrNotificationXml := bstrNotificationXml is String ? BSTR.Alloc(bstrNotificationXml).Value : bstrNotificationXml
        bstrNotificationId := bstrNotificationId is String ? BSTR.Alloc(bstrNotificationId).Value : bstrNotificationId
        bstrNotificationTag := bstrNotificationTag is String ? BSTR.Alloc(bstrNotificationTag).Value : bstrNotificationTag

        result := ComCall(83, this, "ptr", bstrNotificationXml, "ptr", bstrNotificationId, "ptr", bstrNotificationTag, "ptr", startTime, "ptr", expirationTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrNotificationId 
     * @returns {HRESULT} 
     */
    msRemoveScheduledTileNotification(bstrNotificationId) {
        bstrNotificationId := bstrNotificationId is String ? BSTR.Alloc(bstrNotificationId).Value : bstrNotificationId

        result := ComCall(84, this, "ptr", bstrNotificationId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pollingUri 
     * @param {VARIANT} startTime 
     * @param {VARIANT} uiUpdateRecurrence 
     * @returns {HRESULT} 
     */
    msStartPeriodicBadgeUpdate(pollingUri, startTime, uiUpdateRecurrence) {
        pollingUri := pollingUri is String ? BSTR.Alloc(pollingUri).Value : pollingUri

        result := ComCall(85, this, "ptr", pollingUri, "ptr", startTime, "ptr", uiUpdateRecurrence, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msStopPeriodicBadgeUpdate() {
        result := ComCall(86, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msLaunchInternetOptions() {
        result := ComCall(87, this, "HRESULT")
        return result
    }
}
