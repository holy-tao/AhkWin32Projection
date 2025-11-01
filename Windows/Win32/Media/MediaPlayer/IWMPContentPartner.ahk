#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nn-contentpartner-iwmpcontentpartner
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPContentPartner extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPContentPartner
     * @type {Guid}
     */
    static IID => Guid("{55455073-41b5-4e75-87b8-f13bdb291d08}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCallback", "Notify", "GetItemInfo", "GetContentPartnerInfo", "GetCommands", "InvokeCommand", "CanBuySilent", "Buy", "GetStreamingURL", "Download", "DownloadTrackComplete", "RefreshLicense", "GetCatalogURL", "GetTemplate", "UpdateDevice", "GetListContents", "Login", "Authenticate", "Logout", "SendMessage", "StationEvent", "CompareContainerListPrices", "VerifyPermission"]

    /**
     * 
     * @param {IWMPContentPartnerCallback} pCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-setcallback
     */
    SetCallback(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<VARIANT>} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-notify
     */
    Notify(type, pContext) {
        result := ComCall(4, this, "int", type, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrInfoName 
     * @param {Pointer<VARIANT>} pContext 
     * @param {Pointer<VARIANT>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getiteminfo
     */
    GetItemInfo(bstrInfoName, pContext, pData) {
        bstrInfoName := bstrInfoName is String ? BSTR.Alloc(bstrInfoName).Value : bstrInfoName

        result := ComCall(5, this, "ptr", bstrInfoName, "ptr", pContext, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrInfoName 
     * @param {Pointer<VARIANT>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getcontentpartnerinfo
     */
    GetContentPartnerInfo(bstrInfoName, pData) {
        bstrInfoName := bstrInfoName is String ? BSTR.Alloc(bstrInfoName).Value : bstrInfoName

        result := ComCall(6, this, "ptr", bstrInfoName, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} location 
     * @param {Pointer<VARIANT>} pLocationContext 
     * @param {BSTR} itemLocation 
     * @param {Integer} cItemIDs 
     * @param {Pointer<Integer>} prgItemIDs 
     * @param {Pointer<Integer>} pcItemIDs 
     * @param {Pointer<Pointer<WMPContextMenuInfo>>} pprgItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getcommands
     */
    GetCommands(location, pLocationContext, itemLocation, cItemIDs, prgItemIDs, pcItemIDs, pprgItems) {
        location := location is String ? BSTR.Alloc(location).Value : location
        itemLocation := itemLocation is String ? BSTR.Alloc(itemLocation).Value : itemLocation

        prgItemIDsMarshal := prgItemIDs is VarRef ? "uint*" : "ptr"
        pcItemIDsMarshal := pcItemIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", location, "ptr", pLocationContext, "ptr", itemLocation, "uint", cItemIDs, prgItemIDsMarshal, prgItemIDs, pcItemIDsMarshal, pcItemIDs, "ptr*", pprgItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCommandID 
     * @param {BSTR} location 
     * @param {Pointer<VARIANT>} pLocationContext 
     * @param {BSTR} itemLocation 
     * @param {Integer} cItemIDs 
     * @param {Pointer<Integer>} rgItemIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-invokecommand
     */
    InvokeCommand(dwCommandID, location, pLocationContext, itemLocation, cItemIDs, rgItemIDs) {
        location := location is String ? BSTR.Alloc(location).Value : location
        itemLocation := itemLocation is String ? BSTR.Alloc(itemLocation).Value : itemLocation

        rgItemIDsMarshal := rgItemIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", dwCommandID, "ptr", location, "ptr", pLocationContext, "ptr", itemLocation, "uint", cItemIDs, rgItemIDsMarshal, rgItemIDs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPContentContainerList} pInfo 
     * @param {Pointer<BSTR>} pbstrTotalPrice 
     * @param {Pointer<VARIANT_BOOL>} pSilentOK 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-canbuysilent
     */
    CanBuySilent(pInfo, pbstrTotalPrice, pSilentOK) {
        result := ComCall(9, this, "ptr", pInfo, "ptr", pbstrTotalPrice, "ptr", pSilentOK, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPContentContainerList} pInfo 
     * @param {Integer} cookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-buy
     */
    Buy(pInfo, cookie) {
        result := ComCall(10, this, "ptr", pInfo, "uint", cookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} st 
     * @param {Pointer<VARIANT>} pStreamContext 
     * @param {Pointer<BSTR>} pbstrURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getstreamingurl
     */
    GetStreamingURL(st, pStreamContext, pbstrURL) {
        result := ComCall(11, this, "int", st, "ptr", pStreamContext, "ptr", pbstrURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPContentContainerList} pInfo 
     * @param {Integer} cookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-download
     */
    Download(pInfo, cookie) {
        result := ComCall(12, this, "ptr", pInfo, "uint", cookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrResult 
     * @param {Integer} contentID 
     * @param {BSTR} downloadTrackParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-downloadtrackcomplete
     */
    DownloadTrackComplete(hrResult, contentID, downloadTrackParam) {
        downloadTrackParam := downloadTrackParam is String ? BSTR.Alloc(downloadTrackParam).Value : downloadTrackParam

        result := ComCall(13, this, "int", hrResult, "uint", contentID, "ptr", downloadTrackParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @param {VARIANT_BOOL} fLocal 
     * @param {BSTR} bstrURL 
     * @param {Integer} type 
     * @param {Integer} contentID 
     * @param {BSTR} bstrRefreshReason 
     * @param {Pointer<VARIANT>} pReasonContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-refreshlicense
     */
    RefreshLicense(dwCookie, fLocal, bstrURL, type, contentID, bstrRefreshReason, pReasonContext) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL
        bstrRefreshReason := bstrRefreshReason is String ? BSTR.Alloc(bstrRefreshReason).Value : bstrRefreshReason

        result := ComCall(14, this, "uint", dwCookie, "short", fLocal, "ptr", bstrURL, "int", type, "uint", contentID, "ptr", bstrRefreshReason, "ptr", pReasonContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCatalogVersion 
     * @param {Integer} dwCatalogSchemaVersion 
     * @param {Integer} catalogLCID 
     * @param {Pointer<Integer>} pdwNewCatalogVersion 
     * @param {Pointer<BSTR>} pbstrCatalogURL 
     * @param {Pointer<VARIANT>} pExpirationDate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getcatalogurl
     */
    GetCatalogURL(dwCatalogVersion, dwCatalogSchemaVersion, catalogLCID, pdwNewCatalogVersion, pbstrCatalogURL, pExpirationDate) {
        pdwNewCatalogVersionMarshal := pdwNewCatalogVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", dwCatalogVersion, "uint", dwCatalogSchemaVersion, "uint", catalogLCID, pdwNewCatalogVersionMarshal, pdwNewCatalogVersion, "ptr", pbstrCatalogURL, "ptr", pExpirationDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} task 
     * @param {BSTR} location 
     * @param {Pointer<VARIANT>} pContext 
     * @param {BSTR} clickLocation 
     * @param {Pointer<VARIANT>} pClickContext 
     * @param {BSTR} bstrFilter 
     * @param {BSTR} bstrViewParams 
     * @param {Pointer<BSTR>} pbstrTemplateURL 
     * @param {Pointer<Integer>} pTemplateSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-gettemplate
     */
    GetTemplate(task, location, pContext, clickLocation, pClickContext, bstrFilter, bstrViewParams, pbstrTemplateURL, pTemplateSize) {
        location := location is String ? BSTR.Alloc(location).Value : location
        clickLocation := clickLocation is String ? BSTR.Alloc(clickLocation).Value : clickLocation
        bstrFilter := bstrFilter is String ? BSTR.Alloc(bstrFilter).Value : bstrFilter
        bstrViewParams := bstrViewParams is String ? BSTR.Alloc(bstrViewParams).Value : bstrViewParams

        pTemplateSizeMarshal := pTemplateSize is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, "int", task, "ptr", location, "ptr", pContext, "ptr", clickLocation, "ptr", pClickContext, "ptr", bstrFilter, "ptr", bstrViewParams, "ptr", pbstrTemplateURL, pTemplateSizeMarshal, pTemplateSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDeviceName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-updatedevice
     */
    UpdateDevice(bstrDeviceName) {
        bstrDeviceName := bstrDeviceName is String ? BSTR.Alloc(bstrDeviceName).Value : bstrDeviceName

        result := ComCall(17, this, "ptr", bstrDeviceName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} location 
     * @param {Pointer<VARIANT>} pContext 
     * @param {BSTR} bstrListType 
     * @param {BSTR} bstrParams 
     * @param {Integer} dwListCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getlistcontents
     */
    GetListContents(location, pContext, bstrListType, bstrParams, dwListCookie) {
        location := location is String ? BSTR.Alloc(location).Value : location
        bstrListType := bstrListType is String ? BSTR.Alloc(bstrListType).Value : bstrListType
        bstrParams := bstrParams is String ? BSTR.Alloc(bstrParams).Value : bstrParams

        result := ComCall(18, this, "ptr", location, "ptr", pContext, "ptr", bstrListType, "ptr", bstrParams, "uint", dwListCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BLOB} userInfo 
     * @param {BLOB} pwdInfo 
     * @param {VARIANT_BOOL} fUsedCachedCreds 
     * @param {VARIANT_BOOL} fOkToCache 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-login
     */
    Login(userInfo, pwdInfo, fUsedCachedCreds, fOkToCache) {
        result := ComCall(19, this, "ptr", userInfo, "ptr", pwdInfo, "short", fUsedCachedCreds, "short", fOkToCache, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BLOB} userInfo 
     * @param {BLOB} pwdInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-authenticate
     */
    Authenticate(userInfo, pwdInfo) {
        result := ComCall(20, this, "ptr", userInfo, "ptr", pwdInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-logout
     */
    Logout() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * Sends the specified message to a window or windows. The SendMessage function calls the window procedure for the specified window and does not return until the window procedure has processed the message.
     * @param {BSTR} bstrMsg 
     * @param {BSTR} bstrParam 
     * @returns {HRESULT} Type: <b>LRESULT</b>
     * 
     * The return value specifies the result of the message processing; it depends on the message sent.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-sendmessage
     */
    SendMessage(bstrMsg, bstrParam) {
        bstrMsg := bstrMsg is String ? BSTR.Alloc(bstrMsg).Value : bstrMsg
        bstrParam := bstrParam is String ? BSTR.Alloc(bstrParam).Value : bstrParam

        result := ComCall(22, this, "ptr", bstrMsg, "ptr", bstrParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrStationEventType 
     * @param {Integer} StationId 
     * @param {Integer} PlaylistIndex 
     * @param {Integer} TrackID 
     * @param {BSTR} TrackData 
     * @param {Integer} dwSecondsPlayed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-stationevent
     */
    StationEvent(bstrStationEventType, StationId, PlaylistIndex, TrackID, TrackData, dwSecondsPlayed) {
        bstrStationEventType := bstrStationEventType is String ? BSTR.Alloc(bstrStationEventType).Value : bstrStationEventType
        TrackData := TrackData is String ? BSTR.Alloc(TrackData).Value : TrackData

        result := ComCall(23, this, "ptr", bstrStationEventType, "uint", StationId, "uint", PlaylistIndex, "uint", TrackID, "ptr", TrackData, "uint", dwSecondsPlayed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPContentContainerList} pListBase 
     * @param {IWMPContentContainerList} pListCompare 
     * @param {Pointer<Integer>} pResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-comparecontainerlistprices
     */
    CompareContainerListPrices(pListBase, pListCompare, pResult) {
        pResultMarshal := pResult is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, "ptr", pListBase, "ptr", pListCompare, pResultMarshal, pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPermission 
     * @param {Pointer<VARIANT>} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-verifypermission
     */
    VerifyPermission(bstrPermission, pContext) {
        bstrPermission := bstrPermission is String ? BSTR.Alloc(bstrPermission).Value : bstrPermission

        result := ComCall(25, this, "ptr", bstrPermission, "ptr", pContext, "HRESULT")
        return result
    }
}
