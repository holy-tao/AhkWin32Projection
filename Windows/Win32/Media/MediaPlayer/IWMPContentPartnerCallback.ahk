#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nn-contentpartner-iwmpcontentpartnercallback
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
     * @remarks
     * The following list gives the possible values for the <i>type</i> parameter and the corresponding values of the <i>pContext</i> parameter.
     * 
     * wmpcnLoginStateChange
     * 
     * The meaning of the <i>pContext</i> parameter depends on its type, which the caller specifies in the <b>vt</b> member of <i>pContext</i>.
     * 
     * If the type of the <i>pContext</i> parameter is <b>VT_BOOL</b>, this call notifies Windows Media Player that an attempt to log in or out was successful. The <b>boolVal</b> member of <i>pContext</i> specifies the log-in state of the user after the successful attempt. VARIANT_TRUE specifies that the a log-in attempt was successful, and the user is logged in. VARIANT_FALSE specifies that a log-out attempt was successful, and the user is logged out.
     * 
     * If the type of the <i>pContext</i> parameter is <b>VT_UI4</b>, this call notifies Windows Media Player that a log-in attempt failed. The <b>ulVal</b> member of <i>pContext</i> specifies the index of a webpage, provided by the online store, that will handle the failure. The Player obtains the URL of the webpage by passing the index to <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getiteminfo">IWMPContentPartner::GetItemInfo</a>, which is implemented by the online store's plug-in. Note that the webpage index is not interpreted by Windows Media Player; it has meaning only to the online store.
     * 
     * For more information about logging in and out, see <a href="https://docs.microsoft.com/windows/desktop/WMP/managing-login">Managing Login</a>.
     * 
     * wmpcnAuthResult
     * 
     * The type of the <i>pContext</i> parameter is <b>VT_BOOL</b>. This call notifies Windows Media Player that an attempt to authenticate the user either succeeded or failed. VARIANT_TRUE specifies that the authentication attempt succeeded. VARIANT_FALSE specifies that the authentication attempt failed.
     * 
     * Windows Media Player previously requested an authentication attempt by calling <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-authenticate">IWMPContentPartner::Authenticate</a>.
     * 
     * wmpcnNewCatalogAvailable
     * 
     * The type of the <i>pContext</i> parameter is <b>VT_EMPTY</b>. This call notifies Windows Media Player that the online store has a new catalog available.
     * 
     * wmpcnNewPluginAvailable
     * 
     * The type of the <i>pContext</i> parameter is <b>VT_BOOL</b>. This call notifies Windows Media Player that the online store has a new plug-in available. The <b>boolVal</b> member of <i>pContext</i> specifies whether the new plug-in is required. VARIANT_TRUE specifies that the new plug-in is required. VARIANT_FALSE specifies that the new plug-in is optional.
     * 
     * wmpcnDisableRadioSkipping
     * 
     * The type of the <i>pContext</i> parameter is <b>VT_EMPTY</b>. This call notifies Windows Media Player that it should disable skipping for the metafile playlist (ASX file) that is currently playing.
     * 
     * As Windows Media Player plays an ASX file that it obtained from a type 1 online store, it notifies the online store each time a track is skipped. When the number of tracks skipped reaches the maximum number allowed, the online store calls <b>IWMPContentPartnerCallback::Notify</b>, passing wmpcnDisableRadioSkipping, to instruct the Player that it must not skip any more tracks in the currently-playing ASX file. The maximum number of skips allowed for an ASX file is determined by the online store.
     * 
     * Windows Media Player notifies the online store that a track has been skipped by calling <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-stationevent">IWMPContentPartner::StationEvent</a>, passing g_szStationEvent_Skipped in the <i>bstrStationEventType</i> parameter.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-notify
     */
    Notify(type, pContext) {
        result := ComCall(3, this, "int", type, "ptr", pContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * You must call <b>BuyComplete</b> exactly once for each call to <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-buy">IWMPContentPartner::Buy</a>. Call <b>BuyComplete</b> when the transaction is finished, even if it failed for some reason.
     * 
     * Return a success code only after all licenses related to the purchase have been delivered.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-buycomplete
     */
    BuyComplete(hrResult, dwBuyCookie) {
        result := ComCall(4, this, "int", hrResult, "uint", dwBuyCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * For an explanation of how the Player and the plug-in work together to download a set of tracks, see <a href="https://docs.microsoft.com/windows/desktop/WMP/downloading-media-content">Downloading Media Content</a>.
     * 
     * This method must be called only after a license has been predelivered for the file. The file will be placed in the user's Music folder and automatically added to the library when downloading is complete.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-downloadtrack
     */
    DownloadTrack(cookie, bstrTrackURL, dwServiceTrackID, bstrDownloadParams, hrDownload) {
        if(bstrTrackURL is String) {
            pin := BSTR.Alloc(bstrTrackURL)
            bstrTrackURL := pin.Value
        }
        if(bstrDownloadParams is String) {
            pin := BSTR.Alloc(bstrDownloadParams)
            bstrDownloadParams := pin.Value
        }

        result := ComCall(5, this, "uint", cookie, "ptr", bstrTrackURL, "uint", dwServiceTrackID, "ptr", bstrDownloadParams, "int", hrDownload, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-getcatalogversion
     */
    GetCatalogVersion(pdwVersion, pdwSchemaVersion, plcid) {
        pdwVersionMarshal := pdwVersion is VarRef ? "uint*" : "ptr"
        pdwSchemaVersionMarshal := pdwSchemaVersion is VarRef ? "uint*" : "ptr"
        plcidMarshal := plcid is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwVersionMarshal, pdwVersion, pdwSchemaVersionMarshal, pdwSchemaVersion, plcidMarshal, plcid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * This method should be called in response to <b>UpdateDevice</b>, following the completion of the device update.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-updatedevicecomplete
     */
    UpdateDeviceComplete(bstrDeviceName) {
        if(bstrDeviceName is String) {
            pin := BSTR.Alloc(bstrDeviceName)
            bstrDeviceName := pin.Value
        }

        result := ComCall(7, this, "ptr", bstrDeviceName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The ChangeView method changes the view in Windows Media Player.
     * @remarks
     * This method must be called only in response to a user request, such as when the user invokes a command by clicking a context menu item.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-changeview
     */
    ChangeView(bstrType, bstrID, bstrFilter) {
        if(bstrType is String) {
            pin := BSTR.Alloc(bstrType)
            bstrType := pin.Value
        }
        if(bstrID is String) {
            pin := BSTR.Alloc(bstrID)
            bstrID := pin.Value
        }
        if(bstrFilter is String) {
            pin := BSTR.Alloc(bstrFilter)
            bstrFilter := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrType, "ptr", bstrID, "ptr", bstrFilter, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-addlistcontents
     */
    AddListContents(dwListCookie, cItems, prgItems) {
        prgItemsMarshal := prgItems is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", dwListCookie, "uint", cItems, prgItemsMarshal, prgItems, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * Windows Media Player starts retrieving list contents by calling <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getlistcontents">IWMPContentPartner::GetListContents</a>. This starts an asynchronous operation in which the online store plug-in must call <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-addlistcontents">IWMPContentPartnerCallback::AddListContents</a> one or more times to give the Player the requested data. The plug-in must finally call <b>ListContentsComplete</b> to notify the Player that all the data has been provided.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-listcontentscomplete
     */
    ListContentsComplete(dwListCookie, hrSuccess) {
        result := ComCall(10, this, "uint", dwListCookie, "int", hrSuccess, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * The <b>SendMessageComplete</b> method is part of a chain of methods that are called to pass messages from the discovery page to the content partner plug-in. The following list describes the chain of calls:
     * 
     * <ol>
     * <li>The discovery page calls <a href="https://docs.microsoft.com/windows/desktop/WMP/external-sendmessage">External.sendMessage</a>, which has two string parameters: <i>Msg</i> and <i>Param</i>. Those two strings are meaningful only to the online store; they are not interpreted by Windows Media Player.</li>
     * <li>Windows Media Player passes the two strings (<i>Msg</i> and <i>Param</i>) along to the plug-in by calling <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-sendmessage">IWMPContentPartner::SendMessage</a>.</li>
     * <li>When the online store has finished processing the message, it passes the same two strings back to Windows Media Player by calling <b>IWMPContentPartnerCallback::SendMessageComplete</b>. It also passes a third string to <b>SendMessageComplete</b> that indicates the result of the message-processing attempt.</li>
     * <li>Windows Media Player passes all three strings back to the discovery page by raising the <a href="https://docs.microsoft.com/windows/desktop/WMP/external-onsendmessagecomplete-event">External.OnSendMessageComplete</a> event.</li>
     * </ol>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-sendmessagecomplete
     */
    SendMessageComplete(bstrMsg, bstrParam, bstrResult) {
        if(bstrMsg is String) {
            pin := BSTR.Alloc(bstrMsg)
            bstrMsg := pin.Value
        }
        if(bstrParam is String) {
            pin := BSTR.Alloc(bstrParam)
            bstrParam := pin.Value
        }
        if(bstrResult is String) {
            pin := BSTR.Alloc(bstrResult)
            bstrResult := pin.Value
        }

        result := ComCall(11, this, "ptr", bstrMsg, "ptr", bstrParam, "ptr", bstrResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * This method allocates an array of <b>ULONGs</b>, fills the array with content IDs, and returns the address of the array in the output parameter <i>pprgIDs</i>. When the caller is finished with the array, it must free the array by calling <b>CoTaskMemFree</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-getcontentidsinlibrary
     */
    GetContentIDsInLibrary(pcContentIDs, pprgIDs) {
        pcContentIDsMarshal := pcContentIDs is VarRef ? "uint*" : "ptr"
        pprgIDsMarshal := pprgIDs is VarRef ? "ptr*" : "ptr"

        result := ComCall(12, this, pcContentIDsMarshal, pcContentIDs, pprgIDsMarshal, pprgIDs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * Windows Media Player requests a license update by calling the plug-in's <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-refreshlicense">RefreshLicense</a> method, which initiates the update and returns immediately. When the online store has finished processing the update request, the plug-in calls <b>RefreshLicenseComplete</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-refreshlicensecomplete
     */
    RefreshLicenseComplete(dwCookie, contentID, hrRefresh) {
        result := ComCall(13, this, "uint", dwCookie, "uint", contentID, "int", hrRefresh, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * Windows Media Player calls <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getiteminfo">IWMPContentPartner::GetItemInfo</a>, passing the value of <i>lIndex</i> in the <i>pContext</i> parameter, to retrieve a URL. Windows Media Player then appends the value of <i>bstrParameters</i> to the URL, and uses the URL, along with the appended parameters, to retrieve the webpage to display in the dialog box.
     * 
     * You can use the <i>bstrParameters</i> parameter to specify the size of the pop-up window. For example, if you set <i>bstrParameters</i> to "DlgX=800&amp;DlgY=400", the pop-up window will have a size of 800 pixels by 400 pixels.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-showpopup
     */
    ShowPopup(lIndex, bstrParameters) {
        if(bstrParameters is String) {
            pin := BSTR.Alloc(bstrParameters)
            bstrParameters := pin.Value
        }

        result := ComCall(14, this, "int", lIndex, "ptr", bstrParameters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * The following list gives the possible values for <i>bstrPermission</i> and the corresponding meanings of <i>pContext</i>.
     * 
     * g_szVerifyPermissionSync
     * 
     * Windows Media Player previously requested permission to synchronize the content on a portable device by calling <b>IWMPContentPartner::VerifyPermission</b>. In that call, Windows Media Player supplied the canonical device name in the <i>pContext</i> parameter. The online store supplies that same canonical device name in the <i>pContext</i> parameter of <b>VerifyPermissionComplete</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-verifypermissioncomplete
     */
    VerifyPermissionComplete(bstrPermission, pContext, hrPermission) {
        if(bstrPermission is String) {
            pin := BSTR.Alloc(bstrPermission)
            bstrPermission := pin.Value
        }

        result := ComCall(15, this, "ptr", bstrPermission, "ptr", pContext, "int", hrPermission, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
