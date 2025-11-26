#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * Note  This section describes functionality designed for use by online stores.
     * @param {IWMPContentPartnerCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nn-contentpartner-iwmpcontentpartnercallback">IWMPContentPartnerCallback</a> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-setcallback
     */
    SetCallback(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {Integer} type The notification type, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/ne-contentpartner-wmppartnernotification">WMPPartnerNotification</a> enumeration.
     * @param {Pointer<VARIANT>} pContext Pointer to a <b>VARIANT</b> that contains notification data.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-notify
     */
    Notify(type, pContext) {
        result := ComCall(4, this, "int", type, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {BSTR} bstrInfoName <b>BSTR</b> specifying the item for which information will be retrieved. See Remarks for possible values.
     * @param {Pointer<VARIANT>} pContext Pointer to a <b>VARIANT</b> that supplies contextual information for the requested information.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> that receives the information.
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-getiteminfo
     */
    GetItemInfo(bstrInfoName, pContext) {
        bstrInfoName := bstrInfoName is String ? BSTR.Alloc(bstrInfoName).Value : bstrInfoName

        pData := VARIANT()
        result := ComCall(5, this, "ptr", bstrInfoName, "ptr", pContext, "ptr", pData, "HRESULT")
        return pData
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetContentPartnerInfo method retrieves specific information about the online store.
     * @param {BSTR} bstrInfoName A <b>BSTR</b> that specifies the type of information to retrieve. See Remarks for a list of possible values.
     * @returns {VARIANT} Address of a <b>VARIANT</b> that receives the information.
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-getcontentpartnerinfo
     */
    GetContentPartnerInfo(bstrInfoName) {
        bstrInfoName := bstrInfoName is String ? BSTR.Alloc(bstrInfoName).Value : bstrInfoName

        pData := VARIANT()
        result := ComCall(6, this, "ptr", bstrInfoName, "ptr", pData, "HRESULT")
        return pData
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetCommands method retrieves context menu commands.
     * @param {BSTR} location A <a href="https://docs.microsoft.com/windows/desktop/WMP/library-location-constants">library location constant</a> that specifies the type of library view where the user right-clicked. For example, the constant g_szCPGenreID indicates that the user right-clicked in the view of a particular genre
     * @param {Pointer<VARIANT>} pLocationContext The ID of the specific view where the user right-clicked. For example, if <i>location</i> is g_szCPGenreID, this parameter is the ID of the particular genre the user was viewing when he or she right-clicked.
     * @param {BSTR} itemLocation A library location constant that indicates the type of the media item or items that were selected when the user right-clicked. For example, the constant g_szCPAlbumID specifies that the user right-clicked when one or more albums were selected.
     * @param {Integer} cItemIDs The number of items that were selected when the user right-clicked. This is the number of elements in the prgIte<i></i>mIDs array.
     * @param {Pointer<Integer>} prgItemIDs An array that contains the IDs of the media items that were selected when the user right-clicked.
     * @param {Pointer<Integer>} pcItemIDs The number of elements in the <i>pprgItems</i> array.
     * @param {Pointer<Pointer<WMPContextMenuInfo>>} pprgItems Address of a variable that receives a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/ns-contentpartner-wmpcontextmenuinfo">WMPContextMenuInfo</a> structures.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-getcommands
     */
    GetCommands(location, pLocationContext, itemLocation, cItemIDs, prgItemIDs, pcItemIDs, pprgItems) {
        location := location is String ? BSTR.Alloc(location).Value : location
        itemLocation := itemLocation is String ? BSTR.Alloc(itemLocation).Value : itemLocation

        prgItemIDsMarshal := prgItemIDs is VarRef ? "uint*" : "ptr"
        pcItemIDsMarshal := pcItemIDs is VarRef ? "uint*" : "ptr"
        pprgItemsMarshal := pprgItems is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", location, "ptr", pLocationContext, "ptr", itemLocation, "uint", cItemIDs, prgItemIDsMarshal, prgItemIDs, pcItemIDsMarshal, pcItemIDs, pprgItemsMarshal, pprgItems, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The InvokeCommand method invokes a context menu command.
     * @param {Integer} dwCommandID ID of the command to invoke. Windows Media Player previously obtained this command ID from the content partner plug-in by calling <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getcommands">IWMPContentPartner::GetCommands</a>.
     * @param {BSTR} location A library location constant that specifies the type of library view where the user right-clicked. For example, the constant g_szCPGenreID specifies that the user right-clicked in the view of a particular genre.
     * @param {Pointer<VARIANT>} pLocationContext TheID of the specific view where the user right-clicked. For example, if <i>location</i> is g_szCPGenreID, then this parameter is the ID of the particular genre the user was viewing when he or she right-clicked.
     * @param {BSTR} itemLocation A library location constant that specifies the type of the media item or items that were selected when the user right-clicked. For example, the constant g_szCPAlbumID specifies that the user right-clicked when one or more albums were selected.
     * @param {Integer} cItemIDs The number of items that were selected when the user right-clicked. This is the number of elements in the <i>rgItemIDs</i> array.
     * @param {Pointer<Integer>} rgItemIDs An array that contains the IDs of the media items that were selected when the user right-clicked.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-invokecommand
     */
    InvokeCommand(dwCommandID, location, pLocationContext, itemLocation, cItemIDs, rgItemIDs) {
        location := location is String ? BSTR.Alloc(location).Value : location
        itemLocation := itemLocation is String ? BSTR.Alloc(itemLocation).Value : itemLocation

        rgItemIDsMarshal := rgItemIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", dwCommandID, "ptr", location, "ptr", pLocationContext, "ptr", itemLocation, "uint", cItemIDs, rgItemIDsMarshal, rgItemIDs, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {IWMPContentContainerList} pInfo Pointer to a content container list that represents the content to be purchased.
     * @param {Pointer<BSTR>} pbstrTotalPrice Pointer to a <b>BSTR</b> that receives the total price.
     * @param {Pointer<VARIANT_BOOL>} pSilentOK Receives VARIANT_TRUE if the purchase can proceed silently; that is, without displaying a dialog box. Otherwise it receives VARIANT_FALSE.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-canbuysilent
     */
    CanBuySilent(pInfo, pbstrTotalPrice, pSilentOK) {
        pSilentOKMarshal := pSilentOK is VarRef ? "short*" : "ptr"

        result := ComCall(9, this, "ptr", pInfo, "ptr", pbstrTotalPrice, pSilentOKMarshal, pSilentOK, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Buy method initiates the purchase of digital media content.
     * @param {IWMPContentContainerList} pInfo Pointer to a content container list that represents the content to be purchased.
     * @param {Integer} cookie A cookie used to identify the transaction. You must store this value and pass it to <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-buycomplete">IWMPContentPartnerCallback::BuyComplete</a> when the purchase transaction is finished.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-buy
     */
    Buy(pInfo, cookie) {
        result := ComCall(10, this, "ptr", pInfo, "uint", cookie, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetStreamingURL method retrieves the streaming URL of a track.
     * @param {Integer} st A member of the <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/ne-contentpartner-wmpstreamingtype">WMPStreamingType</a> enumeration that specifies the type (music, video, or radio) of the media item to be streamed.
     * @param {Pointer<VARIANT>} pStreamContext Pointer to a <b>VARIANT</b> that contains the ID of the media item to be streamed. The ID is in the <b>ulVal</b> member of the <b>VARIANT</b>, which has a type of <b>VT_UI4</b>.
     * @returns {BSTR} Address of a <b>BSTR</b> that receives the URL of the track.
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-getstreamingurl
     */
    GetStreamingURL(st, pStreamContext) {
        pbstrURL := BSTR()
        result := ComCall(11, this, "int", st, "ptr", pStreamContext, "ptr", pbstrURL, "HRESULT")
        return pbstrURL
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Download method initiates the download of a set of media items.
     * @param {IWMPContentContainerList} pInfo Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nn-contentpartner-iwmpcontentcontainerlist">IWMPContentContainerList</a> interface that describes the content to download.
     * @param {Integer} cookie A cookie that represents the download request.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-download
     */
    Download(pInfo, cookie) {
        result := ComCall(12, this, "ptr", pInfo, "uint", cookie, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {HRESULT} hrResult <b>HRESULT</b> indicating success or failure of the download. Any success code indicates that the Player successfully downloaded the track. Any failure code indicates that the Player failed to download the track.
     * @param {Integer} contentID Content ID of the track in question.
     * @param {BSTR} downloadTrackParam Parameter that the plug-in previously passed to <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-downloadtrack">IWMPContentPartnerCallback::DownloadTrack</a>. This parameter is meaningful only to the online store; it is not interpreted by Windows Media Player.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-downloadtrackcomplete
     */
    DownloadTrackComplete(hrResult, contentID, downloadTrackParam) {
        downloadTrackParam := downloadTrackParam is String ? BSTR.Alloc(downloadTrackParam).Value : downloadTrackParam

        result := ComCall(13, this, "int", hrResult, "uint", contentID, "ptr", downloadTrackParam, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The RefreshLicense method initiates the update of a license for the specified media file.
     * @param {Integer} dwCookie A cookie that identifies the update request. When the online store has finished updating the license, it passes this cookie to <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-refreshlicensecomplete">IWMPContentPartnerCallback::RefreshLicenseComplete</a>.
     * @param {VARIANT_BOOL} fLocal <b>VARIANT_BOOL</b> that specifies whether the media file is located on the user's computer. <b>VARIANT_TRUE</b> specifies that the file is on the user's computer. <b>VARIANT_FALSE</b> specifies that the file is not currently on the user's computer, but is available from the online store's servers.
     * @param {BSTR} bstrURL <b>BSTR</b> containing the URL of the media file on the user's computer. This is <b>NULL</b> if the media file is not on the user's computer.
     * @param {Integer} type A member of the <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/ne-contentpartner-wmpstreamingtype">WMPStreamingType</a> enumeration that specifies the type (music, video, or radio) of the media file.
     * @param {Integer} contentID Content ID of the media file for which the updated license is being requested.
     * @param {BSTR} bstrRefreshReason 
     * @param {Pointer<VARIANT>} pReasonContext If refreshing the license for synchronization to a device, this parameter has type <b>VT_BSTR</b> and contains the device name. Otherwise, this parameter has type <b>VT_EMPTY</b> and supplies no information.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-refreshlicense
     */
    RefreshLicense(dwCookie, fLocal, bstrURL, type, contentID, bstrRefreshReason, pReasonContext) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL
        bstrRefreshReason := bstrRefreshReason is String ? BSTR.Alloc(bstrRefreshReason).Value : bstrRefreshReason

        result := ComCall(14, this, "uint", dwCookie, "short", fLocal, "ptr", bstrURL, "int", type, "uint", contentID, "ptr", bstrRefreshReason, "ptr", pReasonContext, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {Integer} dwCatalogVersion <b>DWORD</b> containing the current catalog version.
     * @param {Integer} dwCatalogSchemaVersion <b>DWORD</b> containing the current catalog schema version.
     * @param {Integer} catalogLCID The locale ID (LCID) for the catalog.
     * @param {Pointer<Integer>} pdwNewCatalogVersion Address of a <b>DWORD</b> that receives the new catalog version.
     * @param {Pointer<BSTR>} pbstrCatalogURL Address of a <b>BSTR</b> that receives the URL.
     * @param {Pointer<VARIANT>} pExpirationDate Address of a <b>VARIANT</b> (<b>VT_DATE</b>) that receives the expiration date of the catalog update.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-getcatalogurl
     */
    GetCatalogURL(dwCatalogVersion, dwCatalogSchemaVersion, catalogLCID, pdwNewCatalogVersion, pbstrCatalogURL, pExpirationDate) {
        pdwNewCatalogVersionMarshal := pdwNewCatalogVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", dwCatalogVersion, "uint", dwCatalogSchemaVersion, "uint", catalogLCID, pdwNewCatalogVersionMarshal, pdwNewCatalogVersion, "ptr", pbstrCatalogURL, "ptr", pExpirationDate, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {Integer} task A member of the <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/ne-contentpartner-wmptasktype">WMPTaskType</a> enumeration that specifies the active task pane.
     * @param {BSTR} location A <a href="https://docs.microsoft.com/windows/desktop/WMP/library-location-constants">library location constant</a> that specifies the type of library view the user is currently seeing. For example, the constant g_szCPListID specifies that the user is viewing a pane that shows a particular playlist.
     * @param {Pointer<VARIANT>} pContext The ID of the specific item the user is currently seeing. For example, if <i>location</i> is g_szCPListID, then this parameter specifies the ID of the particular playlist that the user is seeing.
     * @param {BSTR} clickLocation A library location constant that specifies the type of item the user has selected. For example, the constant g_szCPTrackID specifies that the user has selected a particular music track.
     * @param {Pointer<VARIANT>} pClickContext The ID of the particular item the user has selected. For example, if <i>clickLocation</i> is g_szCPTrackID, then this parameter specifies the ID of the particular track that the user has selected.
     * @param {BSTR} bstrFilter The filter for the current library view. This is the text that the user entered in the Player's word wheel control.
     * @param {BSTR} bstrViewParams Parameters, meaningful only to the online store, associated with the new library location. See Remarks.
     * @param {Pointer<BSTR>} pbstrTemplateURL Pointer to a <b>BSTR</b> that receives the URL of the discovery page to display.
     * @param {Pointer<Integer>} pTemplateSize Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/ne-contentpartner-wmptemplatesize">WMPTemplateSize</a> enumeration that indicates the size of the template in which the Player will display the discovery page.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-gettemplate
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
     * Note  This section describes functionality designed for use by online stores.
     * @param {BSTR} bstrDeviceName <b>BSTR</b> containing the device name.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-updatedevice
     */
    UpdateDevice(bstrDeviceName) {
        bstrDeviceName := bstrDeviceName is String ? BSTR.Alloc(bstrDeviceName).Value : bstrDeviceName

        result := ComCall(17, this, "ptr", bstrDeviceName, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetListContents method initiates the retrieval of a dynamic list.
     * @param {BSTR} location A library location constant that specifies the type of library view that will have its list retrieved. For example, the constant g_szCPListID specifies that a particular list will be retrieved.
     * @param {Pointer<VARIANT>} pContext The ID of the specific item that will have its list retrieved. For example, if <i>location</i> is g_szCPListID, then this parameter is the ID of the list that will be retrieved.
     * @param {BSTR} bstrListType A library location constant that specifies the type of an individual list item. For example, the constant g_szCPAlbumID specifies that the items in the list are albums.
     * @param {BSTR} bstrParams Parameters, meaningful only to the online store, associated with the retrieved list. See Remarks.
     * @param {Integer} dwListCookie A cookie used to identify the list retrieval operation. (The plug-in passes this cookie to <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-addlistcontents">IWMPContentPartnerCallback::AddListContents</a> and <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-listcontentscomplete">IWMPContentPartnerCallback::ListContentsComplete</a>.)
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-getlistcontents
     */
    GetListContents(location, pContext, bstrListType, bstrParams, dwListCookie) {
        location := location is String ? BSTR.Alloc(location).Value : location
        bstrListType := bstrListType is String ? BSTR.Alloc(bstrListType).Value : bstrListType
        bstrParams := bstrParams is String ? BSTR.Alloc(bstrParams).Value : bstrParams

        result := ComCall(18, this, "ptr", location, "ptr", pContext, "ptr", bstrListType, "ptr", bstrParams, "uint", dwListCookie, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Login method logs the user in to the online store.
     * @param {BLOB} userInfo Encrypted <b>BLOB</b> containing the user name.
     * @param {BLOB} pwdInfo Encrypted <b>BLOB</b> containing the user password.
     * @param {VARIANT_BOOL} fUsedCachedCreds <b>VARIANT_BOOL</b> indicating whether the plug-in should try to use cached credentials.
     * @param {VARIANT_BOOL} fOkToCache <b>VARIANT_BOOL</b> indicating whether the plug-in is permitted to cache the supplied credentials.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-login
     */
    Login(userInfo, pwdInfo, fUsedCachedCreds, fOkToCache) {
        result := ComCall(19, this, "ptr", userInfo, "ptr", pwdInfo, "short", fUsedCachedCreds, "short", fOkToCache, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Authenticate method initiates an attempt to authenticate the user.
     * @param {BLOB} userInfo <b>BLOB</b> that contains encrypted user information.
     * @param {BLOB} pwdInfo <b>BLOB</b> that contains encrypted password information.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-authenticate
     */
    Authenticate(userInfo, pwdInfo) {
        result := ComCall(20, this, "ptr", userInfo, "ptr", pwdInfo, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Logout method ends the user's online store session.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-logout
     */
    Logout() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The SendMessage method enables discovery pages to send messages to the plug-in.
     * @param {BSTR} bstrMsg <b>BSTR</b> containing the message.
     * @param {BSTR} bstrParam <b>BSTR</b> containing the message parameters.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-sendmessage
     */
    SendMessage(bstrMsg, bstrParam) {
        bstrMsg := bstrMsg is String ? BSTR.Alloc(bstrMsg).Value : bstrMsg
        bstrParam := bstrParam is String ? BSTR.Alloc(bstrParam).Value : bstrParam

        result := ComCall(22, this, "ptr", bstrMsg, "ptr", bstrParam, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {BSTR} bstrStationEventType 
     * @param {Integer} StationId The station ID.
     * @param {Integer} PlaylistIndex The playlist index.
     * @param {Integer} TrackID The track ID.
     * @param {BSTR} TrackData <b>BSTR</b> containing track data.
     * @param {Integer} dwSecondsPlayed Number of seconds that the playlist was played.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-stationevent
     */
    StationEvent(bstrStationEventType, StationId, PlaylistIndex, TrackID, TrackData, dwSecondsPlayed) {
        bstrStationEventType := bstrStationEventType is String ? BSTR.Alloc(bstrStationEventType).Value : bstrStationEventType
        TrackData := TrackData is String ? BSTR.Alloc(TrackData).Value : TrackData

        result := ComCall(23, this, "ptr", bstrStationEventType, "uint", StationId, "uint", PlaylistIndex, "uint", TrackID, "ptr", TrackData, "uint", dwSecondsPlayed, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The CompareContainerListPrices method compares the price of two content container lists.
     * @param {IWMPContentContainerList} pListBase Pointer to the <b>IWMPContentContainerList</b> interface representing the base content container list.
     * @param {IWMPContentContainerList} pListCompare Pointer to the <b>IWMPContentContainerList</b> interface representing the comparison content container list.
     * @returns {Integer} Address of a <b>long</b> that receives the result of the comparison. Return less than 0 when the base price is less than the comparison price; return 0 when the base and comparison lists have equal prices; return greater than 0 when the base price is greater than the comparison price.
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-comparecontainerlistprices
     */
    CompareContainerListPrices(pListBase, pListCompare) {
        result := ComCall(24, this, "ptr", pListBase, "ptr", pListCompare, "int*", &pResult := 0, "HRESULT")
        return pResult
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {BSTR} bstrPermission A <b>BSTR</b> that specifies the action for which permission is being requested. See Remarks for a list of possible values.
     * @param {Pointer<VARIANT>} pContext A pointer to a <b>VARIANT</b> that contains information related to the request. See Remarks.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartner-verifypermission
     */
    VerifyPermission(bstrPermission, pContext) {
        bstrPermission := bstrPermission is String ? BSTR.Alloc(bstrPermission).Value : bstrPermission

        result := ComCall(25, this, "ptr", bstrPermission, "ptr", pContext, "HRESULT")
        return result
    }
}
