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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Notify", "BuyComplete", "DownloadTrack", "GetCatalogVersion", "UpdateDeviceComplete", "ChangeView", "AddListContents", "ListContentsComplete", "SendMessageComplete", "GetContentIDsInLibrary", "RefreshLicenseComplete", "ShowPopup", "VerifyPermissionComplete"]

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<VARIANT>} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-notify
     */
    Notify(type, pContext) {
        result := ComCall(3, this, "int", type, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrResult 
     * @param {Integer} dwBuyCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-buycomplete
     */
    BuyComplete(hrResult, dwBuyCookie) {
        result := ComCall(4, this, "int", hrResult, "uint", dwBuyCookie, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-downloadtrack
     */
    DownloadTrack(cookie, bstrTrackURL, dwServiceTrackID, bstrDownloadParams, hrDownload) {
        bstrTrackURL := bstrTrackURL is String ? BSTR.Alloc(bstrTrackURL).Value : bstrTrackURL
        bstrDownloadParams := bstrDownloadParams is String ? BSTR.Alloc(bstrDownloadParams).Value : bstrDownloadParams

        result := ComCall(5, this, "uint", cookie, "ptr", bstrTrackURL, "uint", dwServiceTrackID, "ptr", bstrDownloadParams, "int", hrDownload, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVersion 
     * @param {Pointer<Integer>} pdwSchemaVersion 
     * @param {Pointer<Integer>} plcid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-getcatalogversion
     */
    GetCatalogVersion(pdwVersion, pdwSchemaVersion, plcid) {
        result := ComCall(6, this, "uint*", pdwVersion, "uint*", pdwSchemaVersion, "uint*", plcid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDeviceName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-updatedevicecomplete
     */
    UpdateDeviceComplete(bstrDeviceName) {
        bstrDeviceName := bstrDeviceName is String ? BSTR.Alloc(bstrDeviceName).Value : bstrDeviceName

        result := ComCall(7, this, "ptr", bstrDeviceName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrType 
     * @param {BSTR} bstrID 
     * @param {BSTR} bstrFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-changeview
     */
    ChangeView(bstrType, bstrID, bstrFilter) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType
        bstrID := bstrID is String ? BSTR.Alloc(bstrID).Value : bstrID
        bstrFilter := bstrFilter is String ? BSTR.Alloc(bstrFilter).Value : bstrFilter

        result := ComCall(8, this, "ptr", bstrType, "ptr", bstrID, "ptr", bstrFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwListCookie 
     * @param {Integer} cItems 
     * @param {Pointer<Integer>} prgItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-addlistcontents
     */
    AddListContents(dwListCookie, cItems, prgItems) {
        result := ComCall(9, this, "uint", dwListCookie, "uint", cItems, "uint*", prgItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwListCookie 
     * @param {HRESULT} hrSuccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-listcontentscomplete
     */
    ListContentsComplete(dwListCookie, hrSuccess) {
        result := ComCall(10, this, "uint", dwListCookie, "int", hrSuccess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMsg 
     * @param {BSTR} bstrParam 
     * @param {BSTR} bstrResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-sendmessagecomplete
     */
    SendMessageComplete(bstrMsg, bstrParam, bstrResult) {
        bstrMsg := bstrMsg is String ? BSTR.Alloc(bstrMsg).Value : bstrMsg
        bstrParam := bstrParam is String ? BSTR.Alloc(bstrParam).Value : bstrParam
        bstrResult := bstrResult is String ? BSTR.Alloc(bstrResult).Value : bstrResult

        result := ComCall(11, this, "ptr", bstrMsg, "ptr", bstrParam, "ptr", bstrResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcContentIDs 
     * @param {Pointer<Pointer<Integer>>} pprgIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-getcontentidsinlibrary
     */
    GetContentIDsInLibrary(pcContentIDs, pprgIDs) {
        result := ComCall(12, this, "uint*", pcContentIDs, "ptr*", pprgIDs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @param {Integer} contentID 
     * @param {HRESULT} hrRefresh 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-refreshlicensecomplete
     */
    RefreshLicenseComplete(dwCookie, contentID, hrRefresh) {
        result := ComCall(13, this, "uint", dwCookie, "uint", contentID, "int", hrRefresh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {BSTR} bstrParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-showpopup
     */
    ShowPopup(lIndex, bstrParameters) {
        bstrParameters := bstrParameters is String ? BSTR.Alloc(bstrParameters).Value : bstrParameters

        result := ComCall(14, this, "int", lIndex, "ptr", bstrParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPermission 
     * @param {Pointer<VARIANT>} pContext 
     * @param {HRESULT} hrPermission 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-verifypermissioncomplete
     */
    VerifyPermissionComplete(bstrPermission, pContext, hrPermission) {
        bstrPermission := bstrPermission is String ? BSTR.Alloc(bstrPermission).Value : bstrPermission

        result := ComCall(15, this, "ptr", bstrPermission, "ptr", pContext, "int", hrPermission, "HRESULT")
        return result
    }
}
