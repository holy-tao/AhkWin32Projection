#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nn-contentpartner-iwmpcontentpartnercallback
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPContentPartnerCallback extends IUnknown{
    /**
     * The interface identifier for IWMPContentPartnerCallback
     * @type {Guid}
     */
    static IID => Guid("{9e8f7da2-0695-403c-b697-da10fafaa676}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<VARIANT>} pContext 
     * @returns {HRESULT} 
     */
    Notify(type, pContext) {
        result := ComCall(3, this, "int", type, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hrResult 
     * @param {Integer} dwBuyCookie 
     * @returns {HRESULT} 
     */
    BuyComplete(hrResult, dwBuyCookie) {
        result := ComCall(4, this, "int", hrResult, "uint", dwBuyCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cookie 
     * @param {BSTR} bstrTrackURL 
     * @param {Integer} dwServiceTrackID 
     * @param {BSTR} bstrDownloadParams 
     * @param {HRESULT} hrDownload 
     * @returns {HRESULT} 
     */
    DownloadTrack(cookie, bstrTrackURL, dwServiceTrackID, bstrDownloadParams, hrDownload) {
        bstrTrackURL := bstrTrackURL is String ? BSTR.Alloc(bstrTrackURL).Value : bstrTrackURL
        bstrDownloadParams := bstrDownloadParams is String ? BSTR.Alloc(bstrDownloadParams).Value : bstrDownloadParams

        result := ComCall(5, this, "uint", cookie, "ptr", bstrTrackURL, "uint", dwServiceTrackID, "ptr", bstrDownloadParams, "int", hrDownload, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwVersion 
     * @param {Pointer<UInt32>} pdwSchemaVersion 
     * @param {Pointer<UInt32>} plcid 
     * @returns {HRESULT} 
     */
    GetCatalogVersion(pdwVersion, pdwSchemaVersion, plcid) {
        result := ComCall(6, this, "uint*", pdwVersion, "uint*", pdwSchemaVersion, "uint*", plcid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDeviceName 
     * @returns {HRESULT} 
     */
    UpdateDeviceComplete(bstrDeviceName) {
        bstrDeviceName := bstrDeviceName is String ? BSTR.Alloc(bstrDeviceName).Value : bstrDeviceName

        result := ComCall(7, this, "ptr", bstrDeviceName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrType 
     * @param {BSTR} bstrID 
     * @param {BSTR} bstrFilter 
     * @returns {HRESULT} 
     */
    ChangeView(bstrType, bstrID, bstrFilter) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType
        bstrID := bstrID is String ? BSTR.Alloc(bstrID).Value : bstrID
        bstrFilter := bstrFilter is String ? BSTR.Alloc(bstrFilter).Value : bstrFilter

        result := ComCall(8, this, "ptr", bstrType, "ptr", bstrID, "ptr", bstrFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwListCookie 
     * @param {Integer} cItems 
     * @param {Pointer<UInt32>} prgItems 
     * @returns {HRESULT} 
     */
    AddListContents(dwListCookie, cItems, prgItems) {
        result := ComCall(9, this, "uint", dwListCookie, "uint", cItems, "uint*", prgItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwListCookie 
     * @param {HRESULT} hrSuccess 
     * @returns {HRESULT} 
     */
    ListContentsComplete(dwListCookie, hrSuccess) {
        result := ComCall(10, this, "uint", dwListCookie, "int", hrSuccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrMsg 
     * @param {BSTR} bstrParam 
     * @param {BSTR} bstrResult 
     * @returns {HRESULT} 
     */
    SendMessageComplete(bstrMsg, bstrParam, bstrResult) {
        bstrMsg := bstrMsg is String ? BSTR.Alloc(bstrMsg).Value : bstrMsg
        bstrParam := bstrParam is String ? BSTR.Alloc(bstrParam).Value : bstrParam
        bstrResult := bstrResult is String ? BSTR.Alloc(bstrResult).Value : bstrResult

        result := ComCall(11, this, "ptr", bstrMsg, "ptr", bstrParam, "ptr", bstrResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcContentIDs 
     * @param {Pointer<UInt32>} pprgIDs 
     * @returns {HRESULT} 
     */
    GetContentIDsInLibrary(pcContentIDs, pprgIDs) {
        result := ComCall(12, this, "uint*", pcContentIDs, "uint*", pprgIDs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @param {Integer} contentID 
     * @param {HRESULT} hrRefresh 
     * @returns {HRESULT} 
     */
    RefreshLicenseComplete(dwCookie, contentID, hrRefresh) {
        result := ComCall(13, this, "uint", dwCookie, "uint", contentID, "int", hrRefresh, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {BSTR} bstrParameters 
     * @returns {HRESULT} 
     */
    ShowPopup(lIndex, bstrParameters) {
        bstrParameters := bstrParameters is String ? BSTR.Alloc(bstrParameters).Value : bstrParameters

        result := ComCall(14, this, "int", lIndex, "ptr", bstrParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPermission 
     * @param {Pointer<VARIANT>} pContext 
     * @param {HRESULT} hrPermission 
     * @returns {HRESULT} 
     */
    VerifyPermissionComplete(bstrPermission, pContext, hrPermission) {
        bstrPermission := bstrPermission is String ? BSTR.Alloc(bstrPermission).Value : bstrPermission

        result := ComCall(15, this, "ptr", bstrPermission, "ptr", pContext, "int", hrPermission, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
