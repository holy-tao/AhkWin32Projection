#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellUIHelper5.ahk" { IShellUIHelper5 }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellUIHelper6 extends IShellUIHelper5 {
    /**
     * The interface identifier for IShellUIHelper6
     * @type {Guid}
     */
    static IID := Guid("{987a573e-46ee-4e89-96ab-ddf7f8fdc98c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellUIHelper6 interfaces
    */
    struct Vtbl extends IShellUIHelper5.Vtbl {
        msStopPeriodicTileUpdate                      : IntPtr
        msStartPeriodicTileUpdate                     : IntPtr
        msStartPeriodicTileUpdateBatch                : IntPtr
        msClearTile                                   : IntPtr
        msEnableTileNotificationQueue                 : IntPtr
        msPinnedSiteState                             : IntPtr
        msEnableTileNotificationQueueForSquare150x150 : IntPtr
        msEnableTileNotificationQueueForWide310x150   : IntPtr
        msEnableTileNotificationQueueForSquare310x310 : IntPtr
        msScheduledTileNotification                   : IntPtr
        msRemoveScheduledTileNotification             : IntPtr
        msStartPeriodicBadgeUpdate                    : IntPtr
        msStopPeriodicBadgeUpdate                     : IntPtr
        msLaunchInternetOptions                       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellUIHelper6.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(75, this, VARIANT, pollingUris, VARIANT, startTime, VARIANT, uiUpdateRecurrence, "HRESULT")
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
        result := ComCall(76, this, VARIANT, pollingUris, VARIANT, startTime, VARIANT, uiUpdateRecurrence, "HRESULT")
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
        result := ComCall(78, this, VARIANT_BOOL, fChange, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    msPinnedSiteState() {
        pvarSiteState := VARIANT()
        result := ComCall(79, this, VARIANT.Ptr, pvarSiteState, "HRESULT")
        return pvarSiteState
    }

    /**
     * 
     * @param {VARIANT_BOOL} fChange 
     * @returns {HRESULT} 
     */
    msEnableTileNotificationQueueForSquare150x150(fChange) {
        result := ComCall(80, this, VARIANT_BOOL, fChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fChange 
     * @returns {HRESULT} 
     */
    msEnableTileNotificationQueueForWide310x150(fChange) {
        result := ComCall(81, this, VARIANT_BOOL, fChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fChange 
     * @returns {HRESULT} 
     */
    msEnableTileNotificationQueueForSquare310x310(fChange) {
        result := ComCall(82, this, VARIANT_BOOL, fChange, "HRESULT")
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

        result := ComCall(83, this, BSTR, bstrNotificationXml, BSTR, bstrNotificationId, BSTR, bstrNotificationTag, VARIANT, startTime, VARIANT, expirationTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrNotificationId 
     * @returns {HRESULT} 
     */
    msRemoveScheduledTileNotification(bstrNotificationId) {
        bstrNotificationId := bstrNotificationId is String ? BSTR.Alloc(bstrNotificationId).Value : bstrNotificationId

        result := ComCall(84, this, BSTR, bstrNotificationId, "HRESULT")
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

        result := ComCall(85, this, BSTR, pollingUri, VARIANT, startTime, VARIANT, uiUpdateRecurrence, "HRESULT")
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

    Query(iid) {
        if (IShellUIHelper6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.msStopPeriodicTileUpdate := CallbackCreate(GetMethod(implObj, "msStopPeriodicTileUpdate"), flags, 1)
        this.vtbl.msStartPeriodicTileUpdate := CallbackCreate(GetMethod(implObj, "msStartPeriodicTileUpdate"), flags, 4)
        this.vtbl.msStartPeriodicTileUpdateBatch := CallbackCreate(GetMethod(implObj, "msStartPeriodicTileUpdateBatch"), flags, 4)
        this.vtbl.msClearTile := CallbackCreate(GetMethod(implObj, "msClearTile"), flags, 1)
        this.vtbl.msEnableTileNotificationQueue := CallbackCreate(GetMethod(implObj, "msEnableTileNotificationQueue"), flags, 2)
        this.vtbl.msPinnedSiteState := CallbackCreate(GetMethod(implObj, "msPinnedSiteState"), flags, 2)
        this.vtbl.msEnableTileNotificationQueueForSquare150x150 := CallbackCreate(GetMethod(implObj, "msEnableTileNotificationQueueForSquare150x150"), flags, 2)
        this.vtbl.msEnableTileNotificationQueueForWide310x150 := CallbackCreate(GetMethod(implObj, "msEnableTileNotificationQueueForWide310x150"), flags, 2)
        this.vtbl.msEnableTileNotificationQueueForSquare310x310 := CallbackCreate(GetMethod(implObj, "msEnableTileNotificationQueueForSquare310x310"), flags, 2)
        this.vtbl.msScheduledTileNotification := CallbackCreate(GetMethod(implObj, "msScheduledTileNotification"), flags, 6)
        this.vtbl.msRemoveScheduledTileNotification := CallbackCreate(GetMethod(implObj, "msRemoveScheduledTileNotification"), flags, 2)
        this.vtbl.msStartPeriodicBadgeUpdate := CallbackCreate(GetMethod(implObj, "msStartPeriodicBadgeUpdate"), flags, 4)
        this.vtbl.msStopPeriodicBadgeUpdate := CallbackCreate(GetMethod(implObj, "msStopPeriodicBadgeUpdate"), flags, 1)
        this.vtbl.msLaunchInternetOptions := CallbackCreate(GetMethod(implObj, "msLaunchInternetOptions"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.msStopPeriodicTileUpdate)
        CallbackFree(this.vtbl.msStartPeriodicTileUpdate)
        CallbackFree(this.vtbl.msStartPeriodicTileUpdateBatch)
        CallbackFree(this.vtbl.msClearTile)
        CallbackFree(this.vtbl.msEnableTileNotificationQueue)
        CallbackFree(this.vtbl.msPinnedSiteState)
        CallbackFree(this.vtbl.msEnableTileNotificationQueueForSquare150x150)
        CallbackFree(this.vtbl.msEnableTileNotificationQueueForWide310x150)
        CallbackFree(this.vtbl.msEnableTileNotificationQueueForSquare310x310)
        CallbackFree(this.vtbl.msScheduledTileNotification)
        CallbackFree(this.vtbl.msRemoveScheduledTileNotification)
        CallbackFree(this.vtbl.msStartPeriodicBadgeUpdate)
        CallbackFree(this.vtbl.msStopPeriodicBadgeUpdate)
        CallbackFree(this.vtbl.msLaunchInternetOptions)
    }
}
