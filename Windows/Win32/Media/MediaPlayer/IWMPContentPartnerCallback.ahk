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
     * Note  This section describes functionality designed for use by online stores.
     * @param {Integer} type The type of notification being made, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/ne-contentpartner-wmpcallbacknotification">WMPCallbackNotification</a> enumeration.
     * @param {Pointer<VARIANT>} pContext Context-specific data for the notification. See Remarks.
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
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartnercallback-notify
     */
    Notify(type, pContext) {
        result := ComCall(3, this, "int", type, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {HRESULT} hrResult <b>HRESULT</b> return code indicating the success or failure of the transaction.
     * @param {Integer} dwBuyCookie The cookie that represents the purchase transaction. This value was provided when the Player called <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-buy">IWMPContentPartner::Buy</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartnercallback-buycomplete
     */
    BuyComplete(hrResult, dwBuyCookie) {
        result := ComCall(4, this, "int", hrResult, "uint", dwBuyCookie, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {Integer} cookie A cookie that identifies a download session. Windows Media Player previously supplied this cookie to the content partner plug-in by calling <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-download">IWMPContentPartner::Download</a>.
     * @param {BSTR} bstrTrackURL The URL of the track to download.
     * @param {Integer} dwServiceTrackID The ID of the track in question.
     * @param {BSTR} bstrDownloadParams Data that the online store wants to associate with the track in question. Windows Media Player does not interpret this data; it is meaningful only to the online store. Windows Media player passes this data back to the online store when it calls <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-downloadtrackcomplete">IWMPContentPartner::DownloadTrackComplete</a>.
     * @param {HRESULT} hrDownload An <b>HRESULT</b> that specifies whether to download the track. Any success code specifies that the Player should download the track. Any failure code specifies that the Player should not download the track.
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
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartnercallback-downloadtrack
     */
    DownloadTrack(cookie, bstrTrackURL, dwServiceTrackID, bstrDownloadParams, hrDownload) {
        bstrTrackURL := bstrTrackURL is String ? BSTR.Alloc(bstrTrackURL).Value : bstrTrackURL
        bstrDownloadParams := bstrDownloadParams is String ? BSTR.Alloc(bstrDownloadParams).Value : bstrDownloadParams

        result := ComCall(5, this, "uint", cookie, "ptr", bstrTrackURL, "uint", dwServiceTrackID, "ptr", bstrDownloadParams, "int", hrDownload, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {Pointer<Integer>} pdwVersion Address of a <b>DWORD</b> that receives the catalog version.
     * @param {Pointer<Integer>} pdwSchemaVersion Address of a <b>DWORD</b> that receives the schema version.
     * @param {Pointer<Integer>} plcid Address of an <b>LCID</b> that receives the locale ID for the catalog.
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
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartnercallback-getcatalogversion
     */
    GetCatalogVersion(pdwVersion, pdwSchemaVersion, plcid) {
        pdwVersionMarshal := pdwVersion is VarRef ? "uint*" : "ptr"
        pdwSchemaVersionMarshal := pdwSchemaVersion is VarRef ? "uint*" : "ptr"
        plcidMarshal := plcid is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwVersionMarshal, pdwVersion, pdwSchemaVersionMarshal, pdwSchemaVersion, plcidMarshal, plcid, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {BSTR} bstrDeviceName String containing the device name.
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
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartnercallback-updatedevicecomplete
     */
    UpdateDeviceComplete(bstrDeviceName) {
        bstrDeviceName := bstrDeviceName is String ? BSTR.Alloc(bstrDeviceName).Value : bstrDeviceName

        result := ComCall(7, this, "ptr", bstrDeviceName, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The ChangeView method changes the view in Windows Media Player.
     * @param {BSTR} bstrType A <a href="https://docs.microsoft.com/windows/desktop/WMP/library-location-constants">library location constant</a> that specifies the type of the new library view. For example, the constant g_szGenreID specifies that the new view will show a particular genre.
     * @param {BSTR} bstrID The ID of the specific item to show in the new view. For example, if <i>bstrType</i> is g_szGenreID, then this parameter specifies the ID of the particular genre to show in the new view.
     * @param {BSTR} bstrFilter The filter for the new view. The view will be filtered as if the user had entered this text in the Player's word wheel control.
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
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartnercallback-changeview
     */
    ChangeView(bstrType, bstrID, bstrFilter) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType
        bstrID := bstrID is String ? BSTR.Alloc(bstrID).Value : bstrID
        bstrFilter := bstrFilter is String ? BSTR.Alloc(bstrFilter).Value : bstrFilter

        result := ComCall(8, this, "ptr", bstrType, "ptr", bstrID, "ptr", bstrFilter, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The AddListContents method adds a set of media items to a list.
     * @param {Integer} dwListCookie A cookie that identifies a list retrieval session. Windows Media Player previously supplied this cookie to the content partner plug-in by calling <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getlistcontents">IWMPContentPartner::GetListContents</a>.
     * @param {Integer} cItems Count of items to be added to the list. This is the number of elements in the <i>prgItems</i> array.
     * @param {Pointer<Integer>} prgItems Pointer to an array of media item IDs. These are the IDs of the media items that are to be added to the list.
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
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartnercallback-addlistcontents
     */
    AddListContents(dwListCookie, cItems, prgItems) {
        prgItemsMarshal := prgItems is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", dwListCookie, "uint", cItems, prgItemsMarshal, prgItems, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {Integer} dwListCookie A cookie that identifies a list retrieval session. Windows Media Player previously supplied this cookie to the content partner plug-in by calling <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getlistcontents">IWMPContentPartner::GetListContents</a>.
     * @param {HRESULT} hrSuccess An <b>HRESULT</b> that indicates whether the overall transfer of list contents succeeded. Any success code indicates that the transfer succeeded; any error code indicates that the transfer failed.
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
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartnercallback-listcontentscomplete
     */
    ListContentsComplete(dwListCookie, hrSuccess) {
        result := ComCall(10, this, "uint", dwListCookie, "int", hrSuccess, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {BSTR} bstrMsg <b>BSTR</b> containing the message. See Remarks.
     * @param {BSTR} bstrParam <b>BSTR</b> containing the message parameters.
     * @param {BSTR} bstrResult <b>BSTR</b> containing the result.
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
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartnercallback-sendmessagecomplete
     */
    SendMessageComplete(bstrMsg, bstrParam, bstrResult) {
        bstrMsg := bstrMsg is String ? BSTR.Alloc(bstrMsg).Value : bstrMsg
        bstrParam := bstrParam is String ? BSTR.Alloc(bstrParam).Value : bstrParam
        bstrResult := bstrResult is String ? BSTR.Alloc(bstrResult).Value : bstrResult

        result := ComCall(11, this, "ptr", bstrMsg, "ptr", bstrParam, "ptr", bstrResult, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {Pointer<Integer>} pcContentIDs Receives the number of elements in the <i>pprgIDs</i> array.
     * @param {Pointer<Pointer<Integer>>} pprgIDs Receives a pointer to an array of content IDs.
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
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartnercallback-getcontentidsinlibrary
     */
    GetContentIDsInLibrary(pcContentIDs, pprgIDs) {
        pcContentIDsMarshal := pcContentIDs is VarRef ? "uint*" : "ptr"
        pprgIDsMarshal := pprgIDs is VarRef ? "ptr*" : "ptr"

        result := ComCall(12, this, pcContentIDsMarshal, pcContentIDs, pprgIDsMarshal, pprgIDs, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {Integer} dwCookie A cookie that represents a request to update a license for a media file. Windows Media Player previously supplied this cookie to the online store's plug-in by calling <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-refreshlicense">IWMPContentPartner::RefreshLicense</a>.
     * @param {Integer} contentID The content ID of the media file for which the license update was requested.
     * @param {HRESULT} hrRefresh An <b>HRESULT</b> that indicates whether the license update was successful. Any success code indicates that the update succeeded. Any failure code indicates that the update failed.
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
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartnercallback-refreshlicensecomplete
     */
    RefreshLicenseComplete(dwCookie, contentID, hrRefresh) {
        result := ComCall(13, this, "uint", dwCookie, "uint", contentID, "int", hrRefresh, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {Integer} lIndex Index, meaningful only to the online store, of the webpage to display in the dialog box.
     * @param {BSTR} bstrParameters Parameters associated with the dialog box.
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
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartnercallback-showpopup
     */
    ShowPopup(lIndex, bstrParameters) {
        bstrParameters := bstrParameters is String ? BSTR.Alloc(bstrParameters).Value : bstrParameters

        result := ComCall(14, this, "int", lIndex, "ptr", bstrParameters, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {BSTR} bstrPermission A <b>BSTR</b> that specifies the action for which permission was requested. Windows Media Player previously requested permission to perform this action by calling <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-verifypermission">IWMPContentPartner::VerifyPermission</a>. See Remarks for a list of possible values.
     * @param {Pointer<VARIANT>} pContext A pointer to a <b>VARIANT</b> that contains information related to the notification. See Remarks.
     * @param {HRESULT} hrPermission An <b>HRESULT</b> that indicates whether permission is granted. Any success code indicates that permission is granted. Any failure code indicates that permission is denied.
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
     * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nf-contentpartner-iwmpcontentpartnercallback-verifypermissioncomplete
     */
    VerifyPermissionComplete(bstrPermission, pContext, hrPermission) {
        bstrPermission := bstrPermission is String ? BSTR.Alloc(bstrPermission).Value : bstrPermission

        result := ComCall(15, this, "ptr", bstrPermission, "ptr", pContext, "int", hrPermission, "HRESULT")
        return result
    }
}
