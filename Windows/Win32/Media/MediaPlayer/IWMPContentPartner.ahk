#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nn-contentpartner-iwmpcontentpartner
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
     * @remarks
     * Windows Media Player calls this function when instantiating the plug-in to provide the callback pointer. The Player also calls this function during shutdown and passes <b>NULL</b> for the parameter value. This signals the plug-in to release the callback pointer provided by the previous call.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-setcallback
     */
    SetCallback(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * The data type for <i>pContext</i> is <b>VT_EMPTY</b> for all notifications except wmpsnCatalogDownloadFailure. In the case of a catalog download failure, the data type is <b>VT_ERROR</b> and the variable contains an <b>HRESULT</b> error code.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-notify
     */
    Notify(type, pContext) {
        result := ComCall(4, this, "int", type, "ptr", pContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * The following list gives possible values for the <i>bstrInfoName</i> parameter and corresponding values for the <i>pContext</i> and <i>pData</i> parameters.
     * 
     * g_szItemInfo_AlbumArtURL
     * 
     * The <i>pContext</i> parameter supplies a <b>VT_UI4</b> that is the ID of an album in the online store's catalog.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the URL of the art that Windows Media Player will display for the album.
     * 
     * g_szItemInfo_ALTLoginURL
     * 
     * The <i>pContext</i> parameter has type <b>VT_EMPTY</b> and supplies no information.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the URL of a webpage that Windows Media Player will display as an alternative to the standard log-in dialog box. Windows Media Player requests the alternative log-in URL only if the <b>SUBSCRIPTION_CAP_ALTLOGIN</b> flag is set in the <b>Capabilities</b> registry entry for the online store's plug-in. For more information about the <b>Capabilities</b> registry entry, see <a href="https://docs.microsoft.com/windows/desktop/WMP/registry-keys-and-entries-for-a-type-1-online-store">Registry Keys and Entries for a Type 1 Online Store</a>.
     * 
     * The online store can specify the size of the window that hosts the alternative log-in page by appending the parameter string ?DlgX=<i>width</i>&amp;DlgY=<i>height</i> to the URL. In the parameter string, <i>width</i> and <i>height</i> are the width and height of the window in pixels. For example <b>GetItemInfo</b> could return the following string to specify that AltLogin.htm should be displayed in a window that has a width of 800 pixels and a height of 400 pixels:
     * 
     * http://proseware.com/AltLogin.htm?DlgX=800&amp;DlgY=400
     * 
     * g_szItemInfo_ALTLoginCaption
     * 
     * The <i>pContext</i> parameter has type <b>VT_EMPTY</b> and supplies no information.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the caption for the window that Windows Media Player will open to host the alternative log-in webpage.
     * 
     * g_szItemInfo_ArtistArtURL
     * 
     * The <i>pContext</i> parameter supplies a <b>VT_UI4</b> that is the ID of an artist in the online store's catalog.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the URL of the art that Windows Media Player will display for the artist.
     * 
     * g_szItemInfo_AuthenticationSuccessURL
     * 
     * The <i>pContext</i> parameter supplies a <b>VT_I4</b> that is the index of a webpage, provided by the online store, that Windows Media Player will display after successful authentication.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the URL of the webpage. Note that indexes for webpages that represent authentication success are not interpreted by Windows Media Player; they have meaning only to the online store.
     * 
     * g_szItemInfo_ErrorDescription
     * 
     * The <i>pContext</i> parameter supplies a <b>VT_ERROR</b> that is an <b>HRESULT</b> that the plug-in previously supplied to the Player. For example, the plug-in supplies an <b>HRESULT</b> when it calls <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-buycomplete">IWMPContentPartnerCallback::BuyComplete</a>.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the error description created by the online store and associated with the <b>HRESULT</b>. Windows Media Player displays the error message but does not interpret it.
     * 
     * g_szItemInfo_ErrorURL
     * 
     * The <i>pContext</i> parameter supplies a <b>VT_ERROR</b> that is an <b>HRESULT</b> that the plug-in previously supplied to the Player. For example, the plug-in supplies an <b>HRESULT</b> when it calls <b>IWMPContentPartnerCallback::BuyComplete</b>.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the URL of the webpage that Windows Media Player will display when the user clicks the error-resolving link. The error-resolving link is part of the user interface of the Player.
     * 
     * g_szItemInfo_ErrorURLLinkText
     * 
     * The <i>pContext</i> parameter supplies a <b>VT_ERROR</b> that is an <b>HRESULT</b> that the plug-in previously supplied to the Player. For example, the plug-in supplies an <b>HRESULT</b> when it calls <b>IWMPContentPartnerCallback::BuyComplete</b>.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the text, created by the online store, that Windows Media Player will use when it displays the error-resolving link.
     * 
     * g_szItemInfo_TreeListIconURL
     * 
     * The <i>pContext</i> parameter supplies a <b>VT_UI4</b> that is the ID of a list in the online store's catalog.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the URL of the icon that Windows Media Player will display, in the tree-view control, for the list.
     * 
     * g_szItemInfo_CreateAccountURL
     * 
     * The <i>pContext</i> parameter has type <b>VT_EMPTY</b> and supplies no information.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the URL of the webpage that Windows Media Player will display to enable the user to manage his or her account.
     * 
     * g_szItemInfo_ForgetPasswordURL
     * 
     * The <i>pContext</i> parameter has type <b>VT_EMPTY</b> and supplies no information.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the URL of the webpage that Windows Media Player will display when the user forgets his or her password.
     * 
     * g_szItemInfo_GenreArtURL
     * 
     * The <i>pContext</i> parameter supplies a <b>VT_UI4</b> that is the ID of a genre in the online store's catalog.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the URL of the art that Windows Media Player will display for the genre.
     * 
     * g_szItemInfo_HTMLViewURL
     * 
     * The <i>pContext</i> parameter supplies a <b>VT_BSTR</b> that is a string that Windows Media Player obtained from a <a href="https://docs.microsoft.com/windows/desktop/WMP/param-element">PARAM</a> element in a Windows Media metafile (ASX file).
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the URL of the webpage that Windows Media Player will display.
     * 
     * When the <b>name</b> attribute of a <b>PARAM</b> element is "HTMLFlink", Windows Media Player passes the <b>value</b> attribute of the PARAM element to this method to retrieve the URL of a Web Page to display in the <b>Now Playing</b> feature.
     * 
     * g_szItemInfo_ListArtURL
     * 
     * The <i>pContext</i> parameter supplies a <b>VT_UI4</b> that is the ID of a list in the online store's catalog.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the URL of the art that Windows Media Player will display for the list.
     * 
     * g_szItemInfo_LoginFailureURL
     * 
     * The <i>pContext</i> parameter supplies a <b>VT_UI4</b> that is the index of a webpage, provided by the online store, that Windows Media Player will display after a log-in failure.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the URL of the webpage.
     * 
     * Windows Media Player previously obtained the index when the online store's plug-in called <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-notify">IWMPContentPartnerCallback::Notify</a>, passing wmpcnLoginStateChange in the <i>type</i> parameter. The indexes of log-in failure webpages are not interpreted by Windows Media Player; they have meaning only to the online store.
     * 
     * g_szItemInfo_PopupURL
     * 
     * The <i>pContext</i> parameter supplies a <b>VT_I4</b> that is the index of a pop-up webpage, provided by the online store, that Windows Media Player will display in a modal window.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the URL of the webpage to display in the modal window. Indexes of pop-up webpages are not interpreted by Windows Media Player; they have meaning only to the online store.
     * 
     * g_szItemInfo_PopupCaption
     * 
     * The <i>pContext</i> parameter supplies a <b>VT_I4</b> that is the index of a pop-up caption created by the online store.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the caption for the window that Windows Media Player will open to host the pop-up webpage. Pop-up caption indexes are not interpreted by Windows Media Player; they have meaning only to the online store.
     * 
     * g_szItemInfo_RadioArtURL
     * 
     * The <i>pContext</i> parameter supplies a <b>VT_UI4</b> that is the ID of a radio feed in the online store's catalog.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the URL of the art that Windows Media Player will display for the radio feed.
     * 
     * g_szItemInfo_SubGenreArtURL
     * 
     * The <i>pContext</i> parameter supplies a <b>VT_UI4</b> that is the ID of a subgenre in the online store's catalog.
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that is the URL of the art that Windows Media Player will display for the subgenre.
     * @param {BSTR} bstrInfoName <b>BSTR</b> specifying the item for which information will be retrieved. See Remarks for possible values.
     * @param {Pointer<VARIANT>} pContext Pointer to a <b>VARIANT</b> that supplies contextual information for the requested information.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> that receives the information.
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-getiteminfo
     */
    GetItemInfo(bstrInfoName, pContext) {
        if(bstrInfoName is String) {
            pin := BSTR.Alloc(bstrInfoName)
            bstrInfoName := pin.Value
        }

        pData := VARIANT()
        result := ComCall(5, this, "ptr", bstrInfoName, "ptr", pContext, "ptr", pData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pData
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetContentPartnerInfo method retrieves specific information about the online store.
     * @remarks
     * The following list gives the possible values for <i>bstrInfoName</i> along with the corresponding values returned in <i>pData</i>.
     * 
     * g_szContentPartnerInfo_LoginState
     * 
     * The <i>pData</i> parameter receives a <b>VT_BOOL</b> that indicates whether the user is currently signed in. VARIANT_TRUE indicates that the user is signed in; VARIANT_FALSE indicates that the user is not signed in.
     * 
     * g_szContentPartnerInfo_MediaPlayerAccountType
     * 
     * The <i>pData</i> parameter receives a <b>WMPAccountType</b> enumeration value (<b>VT_UI4</b>) that indicates the account type. This value is used by Windows Media Player.
     * 
     * g_szContentPartnerInfo_AccountType
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that contains the account type string for the online store. This value is not used by Windows Media Player but might be displayed to the user.
     * 
     * g_szContentPartnerInfo_HasCachedCredentials
     * 
     * The <i>pData</i> parameter receives a <b>VT_BOOL</b> that indicates whether the plug-in has cached the user's credentials (user name and password). VARIANT_TRUE indicates that the plug-in has cached the credentials; VARIANT_FALSE indicates that the plug-in has not cached the credentials.
     * 
     * g_szContentPartnerInfo_LicenseRefreshAdvanceWarning
     * 
     * The <i>pData</i> parameter receives a <b>VT_UI4</b> that indicates the number of days before expiration within which the online store can preemptively renew a license. For example, if the plug-in can support renewing a license for subscription content 5 days before the license expires, <i>pData</i> receives the value 5.
     * 
     * g_szContentPartnerInfo_PurchasedTrackRequiresReDownload
     * 
     * The <i>pData</i> parameter receives a <b>VT_BOOL</b> that indicates whether a track being purchased must be downloaded even though the content was downloaded in the past. VARIANT_TRUE indicates that the track must be downloaded; VARIANT_FALSE indicates that the track does not have to be downloaded.
     * 
     * g_szContentPartnerInfo_MaximumTrackPurchasePerPurchase
     * 
     * The <i>pData</i> parameter receives a <b>VT_UI4</b> that indicates the maximum number of tracks that the online store can handle in a single call to <b>IWMPContentPartner::Buy</b>. If there is no maximum, <i>pData</i> receives a value of 0.
     * 
     * g_szContentPartnerInfo_AccountBalance
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that indicates the user's account balance. Windows Media Player displays this string but does not interpret it.
     * 
     * g_szContentPartnerInfo_UserName
     * 
     * The <i>pData</i> parameter receives a <b>VT_BSTR</b> that indicates the user name of the user that is currently logged in. Windows Media Player displays this string but does not interpret it.
     * @param {BSTR} bstrInfoName A <b>BSTR</b> that specifies the type of information to retrieve. See Remarks for a list of possible values.
     * @returns {VARIANT} Address of a <b>VARIANT</b> that receives the information.
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-getcontentpartnerinfo
     */
    GetContentPartnerInfo(bstrInfoName) {
        if(bstrInfoName is String) {
            pin := BSTR.Alloc(bstrInfoName)
            bstrInfoName := pin.Value
        }

        pData := VARIANT()
        result := ComCall(6, this, "ptr", bstrInfoName, "ptr", pData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pData
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetCommands method retrieves context menu commands.
     * @remarks
     * This method must call <b>CoTaskMemAlloc</b> to allocate the array that it returns in <i>pprgItems</i>.
     * @param {BSTR} location_ A <a href="https://docs.microsoft.com/windows/desktop/WMP/library-location-constants">library location constant</a> that specifies the type of library view where the user right-clicked. For example, the constant g_szCPGenreID indicates that the user right-clicked in the view of a particular genre
     * @param {Pointer<VARIANT>} pLocationContext The ID of the specific view where the user right-clicked. For example, if <i>location</i> is g_szCPGenreID, this parameter is the ID of the particular genre the user was viewing when he or she right-clicked.
     * @param {BSTR} itemLocation A library location constant that indicates the type of the media item or items that were selected when the user right-clicked. For example, the constant g_szCPAlbumID specifies that the user right-clicked when one or more albums were selected.
     * @param {Integer} cItemIDs The number of items that were selected when the user right-clicked. This is the number of elements in the <i>prgItemIDs</i> array.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-getcommands
     */
    GetCommands(location_, pLocationContext, itemLocation, cItemIDs, prgItemIDs, pcItemIDs, pprgItems) {
        if(location_ is String) {
            pin := BSTR.Alloc(location_)
            location_ := pin.Value
        }
        if(itemLocation is String) {
            pin := BSTR.Alloc(itemLocation)
            itemLocation := pin.Value
        }

        prgItemIDsMarshal := prgItemIDs is VarRef ? "uint*" : "ptr"
        pcItemIDsMarshal := pcItemIDs is VarRef ? "uint*" : "ptr"
        pprgItemsMarshal := pprgItems is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", location_, "ptr", pLocationContext, "ptr", itemLocation, "uint", cItemIDs, prgItemIDsMarshal, prgItemIDs, pcItemIDsMarshal, pcItemIDs, pprgItemsMarshal, pprgItems, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The InvokeCommand method invokes a context menu command.
     * @param {Integer} dwCommandID ID of the command to invoke. Windows Media Player previously obtained this command ID from the content partner plug-in by calling <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getcommands">IWMPContentPartner::GetCommands</a>.
     * @param {BSTR} location_ A library location constant that specifies the type of library view where the user right-clicked. For example, the constant g_szCPGenreID specifies that the user right-clicked in the view of a particular genre.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-invokecommand
     */
    InvokeCommand(dwCommandID, location_, pLocationContext, itemLocation, cItemIDs, rgItemIDs) {
        if(location_ is String) {
            pin := BSTR.Alloc(location_)
            location_ := pin.Value
        }
        if(itemLocation is String) {
            pin := BSTR.Alloc(itemLocation)
            itemLocation := pin.Value
        }

        rgItemIDsMarshal := rgItemIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", dwCommandID, "ptr", location_, "ptr", pLocationContext, "ptr", itemLocation, "uint", cItemIDs, rgItemIDsMarshal, rgItemIDs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * The format of the string returned in <i>pbstrTotalPrice</i> is known only to the online store. Windows Media Player displays, but does not interpret, price strings. For more information about how Windows Media Player and the content partner plug-in exchange price information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/purchasing-media-content">Purchasing Media Content</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-canbuysilent
     */
    CanBuySilent(pInfo, pbstrTotalPrice, pSilentOK) {
        pSilentOKMarshal := pSilentOK is VarRef ? "short*" : "ptr"

        result := ComCall(9, this, "ptr", pInfo, "ptr", pbstrTotalPrice, pSilentOKMarshal, pSilentOK, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Buy method initiates the purchase of digital media content.
     * @remarks
     * You must call <b>IWMPContentPartnerCallback::BuyComplete</b> exactly once for each call to <b>Buy</b>. Call <b>BuyComplete</b> when the transaction is finished, even if it failed for some reason.
     * 
     * If the user has an expired license for content previously purchased, you can simply update the license.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-buy
     */
    Buy(pInfo, cookie) {
        result := ComCall(10, this, "ptr", pInfo, "uint", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetStreamingURL method retrieves the streaming URL of a track.
     * @param {Integer} st A member of the <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/ne-contentpartner-wmpstreamingtype">WMPStreamingType</a> enumeration that specifies the type (music, video, or radio) of the media item to be streamed.
     * @param {Pointer<VARIANT>} pStreamContext Pointer to a <b>VARIANT</b> that contains the ID of the media item to be streamed. The ID is in the <b>ulVal</b> member of the <b>VARIANT</b>, which has a type of <b>VT_UI4</b>.
     * @returns {BSTR} Address of a <b>BSTR</b> that receives the URL of the track.
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-getstreamingurl
     */
    GetStreamingURL(st, pStreamContext) {
        pbstrURL := BSTR()
        result := ComCall(11, this, "int", st, "ptr", pStreamContext, "ptr", pbstrURL, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrURL
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Download method initiates the download of a set of media items.
     * @remarks
     * This method initiates the process of inspecting the container list passed in <i>pInfo</i> and then returns immediately. As the plug-in inspects the container list, it calls <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-downloadtrack">IWMPContentPartnerCallback::DownloadTrack</a> once for each track in the container list. For more information about the download procedure, see <a href="https://docs.microsoft.com/windows/desktop/WMP/downloading-media-content">Downloading Media Content</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-download
     */
    Download(pInfo, cookie) {
        result := ComCall(12, this, "ptr", pInfo, "uint", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * To learn how the Player and the plug-in work together to download a set of tracks, see <a href="https://docs.microsoft.com/windows/desktop/WMP/downloading-media-content">Downloading Media Content</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-downloadtrackcomplete
     */
    DownloadTrackComplete(hrResult, contentID, downloadTrackParam) {
        if(downloadTrackParam is String) {
            pin := BSTR.Alloc(downloadTrackParam)
            downloadTrackParam := pin.Value
        }

        result := ComCall(13, this, "int", hrResult, "uint", contentID, "ptr", downloadTrackParam, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The RefreshLicense method initiates the update of a license for the specified media file.
     * @remarks
     * This method must not display a user interface.
     * 
     * This method initiates the license update and then returns immediately. When the online store has completed the license update, the online store's plug-in calls <b>IWMPContentPartnerCallback::RefreshLicenseComplete</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-refreshlicense
     */
    RefreshLicense(dwCookie, fLocal, bstrURL, type, contentID, bstrRefreshReason, pReasonContext) {
        if(bstrURL is String) {
            pin := BSTR.Alloc(bstrURL)
            bstrURL := pin.Value
        }
        if(bstrRefreshReason is String) {
            pin := BSTR.Alloc(bstrRefreshReason)
            bstrRefreshReason := pin.Value
        }

        result := ComCall(14, this, "uint", dwCookie, "short", fLocal, "ptr", bstrURL, "int", type, "uint", contentID, "ptr", bstrRefreshReason, "ptr", pReasonContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * We recommend that the catalog URL specify the version as part of the path. For example, http://www.contoso.com/Catalogs/210/catalog.wmdb.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-getcatalogurl
     */
    GetCatalogURL(dwCatalogVersion, dwCatalogSchemaVersion, catalogLCID, pdwNewCatalogVersion, pbstrCatalogURL, pExpirationDate) {
        pdwNewCatalogVersionMarshal := pdwNewCatalogVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", dwCatalogVersion, "uint", dwCatalogSchemaVersion, "uint", catalogLCID, pdwNewCatalogVersionMarshal, pdwNewCatalogVersion, "ptr", pbstrCatalogURL, "ptr", pExpirationDate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * Windows Media Player calls this method when the view changes in the <b>Library</b>, <b>Sync</b>, or <b>Burn</b> pane. The Player also calls this method when one of those three panes becomes active. The pane or view can change as a result of user navigation or as the result of a call from the discovery page.
     * 
     * When the discovery page calls <a href="https://docs.microsoft.com/windows/desktop/WMP/external-changeview">External.changeView</a>, it sets the <i>ViewParams</i> parameter to whatever context it wants to associate with the new view. Windows Media Player passes that context along to the plug-in in the <i>bstrViewParams</i> parameter of <b>GetTemplate</b>.
     * 
     * When the discovery page calls <a href="https://docs.microsoft.com/windows/desktop/WMP/external-changeviewonlinelist">External.changeViewOnlineList</a>, it sets the <i>Params</i> parameter to whatever context it wants to associate with the new view. Windows Media Player passes that context along to the plug-in in the <i>bstrViewParams</i> parameter of <b>GetTemplate</b>.
     * 
     * If the view changes as a result of user navigation, Windows Media Player sets the <i>bstrParams</i> parameter to <b>NULL</b> when it calls <b>GetTemplate</b>.
     * 
     * Windows Media Player calls <b>GetTemplate</b> to retrieve the URL of the discovery page that it should display in the new view. The Player also receives a <b>WMPTemplateSize</b> value that indicates what portion of the new view should be occupied by the discovery page.
     * @param {Integer} task A member of the <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/ne-contentpartner-wmptasktype">WMPTaskType</a> enumeration that specifies the active task pane.
     * @param {BSTR} location_ A <a href="https://docs.microsoft.com/windows/desktop/WMP/library-location-constants">library location constant</a> that specifies the type of library view the user is currently seeing. For example, the constant g_szCPListID specifies that the user is viewing a pane that shows a particular playlist.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-gettemplate
     */
    GetTemplate(task, location_, pContext, clickLocation, pClickContext, bstrFilter, bstrViewParams, pbstrTemplateURL, pTemplateSize) {
        if(location_ is String) {
            pin := BSTR.Alloc(location_)
            location_ := pin.Value
        }
        if(clickLocation is String) {
            pin := BSTR.Alloc(clickLocation)
            clickLocation := pin.Value
        }
        if(bstrFilter is String) {
            pin := BSTR.Alloc(bstrFilter)
            bstrFilter := pin.Value
        }
        if(bstrViewParams is String) {
            pin := BSTR.Alloc(bstrViewParams)
            bstrViewParams := pin.Value
        }

        pTemplateSizeMarshal := pTemplateSize is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, "int", task, "ptr", location_, "ptr", pContext, "ptr", clickLocation, "ptr", pClickContext, "ptr", bstrFilter, "ptr", bstrViewParams, "ptr", pbstrTemplateURL, pTemplateSizeMarshal, pTemplateSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-updatedevicecomplete">IWMPContentPartnerCallback::UpdateDeviceComplete</a> exactly once for each call to <b>UpdateDevice</b> from which you return a success code.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-updatedevice
     */
    UpdateDevice(bstrDeviceName) {
        if(bstrDeviceName is String) {
            pin := BSTR.Alloc(bstrDeviceName)
            bstrDeviceName := pin.Value
        }

        result := ComCall(17, this, "ptr", bstrDeviceName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetListContents method initiates the retrieval of a dynamic list.
     * @remarks
     * Retrieving list contents is an asynchronous operation. This method should initiate the retrieval and return immediately. Then the plug-in must make one or more calls to <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-addlistcontents">IWMPContentPartnerCallback::AddListContents</a> to supply Windows Media Player with the requested list contents. When the plug-in has supplied all the data, it must call <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-listcontentscomplete">IWMPContentPartnerCallback::ListContentsComplete</a> to signal the end of the operation. In each case, the plug-in passes the cookie provided in <i>dwListCookie</i> to identify the correct list retrieval session.
     * @param {BSTR} location_ A library location constant that specifies the type of library view that will have its list retrieved. For example, the constant g_szCPListID specifies that a particular list will be retrieved.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-getlistcontents
     */
    GetListContents(location_, pContext, bstrListType, bstrParams, dwListCookie) {
        if(location_ is String) {
            pin := BSTR.Alloc(location_)
            location_ := pin.Value
        }
        if(bstrListType is String) {
            pin := BSTR.Alloc(bstrListType)
            bstrListType := pin.Value
        }
        if(bstrParams is String) {
            pin := BSTR.Alloc(bstrParams)
            bstrParams := pin.Value
        }

        result := ComCall(18, this, "ptr", location_, "ptr", pContext, "ptr", bstrListType, "ptr", bstrParams, "uint", dwListCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Login method logs the user in to the online store.
     * @remarks
     * Usually, this method is called in response to a specific request by the user to log in to the online store. Sometimes, the need to log in is implied by other user actions, such as burning a music file that requires an updated license.
     * 
     * The plug-in must call <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-notify">IWMPContentPartnerCallback::Notify</a> to notify Windows Media Player when the log-in state changes.
     * 
     * To decrypt the user name and password, use the <b>CryptUnprotectData</b> function. <b>CryptUnprotectData</b> is documented in the Cryptography section of the Platform SDK. You must use the CRYPTPROTECT_UI_FORBIDDEN flag in the <i>dwFlags</i> parameter of <b>CryptUnprotectData</b>. Set the optional and reserved parameters to <b>NULL</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-login
     */
    Login(userInfo, pwdInfo, fUsedCachedCreds, fOkToCache) {
        result := ComCall(19, this, "ptr", userInfo, "ptr", pwdInfo, "short", fUsedCachedCreds, "short", fOkToCache, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Authenticate method initiates an attempt to authenticate the user.
     * @remarks
     * Certain links on a discovery page have targets that should be displayed only after the user has been authenticated. The discovery page, Windows Media Player, and the online store's plug-in use the following steps to authenticate the user and display the target webpage:
     * 
     * <ol>
     * <li>Script on a discovery page calls the <a href="https://docs.microsoft.com/windows/desktop/WMP/external-authenticate">External.authenticate</a> method.</li>
     * <li>Windows Media Player displays a dialog box to obtain a user name and password.</li>
     * <li>Windows Media Player calls <b>IWMPContentPartner::Authenticate</b>, which initiates the authentication attempt and returns immediately.</li>
     * <li>When the authentication attempt is complete, the online store's plug-in calls <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-notify">IWMPContentPartnerCallback::Notify</a>, passing wmpcnAuthResult and a Boolean value that indicates whether the attempt was successful.</li>
     * <li>If the authentication attempt was successful, Windows Media Player calls <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getiteminfo">IWMPContentPartner::GetItemInfo</a>, passing g_szItemInfo_AuthenticationSuccessURL, to obtain the URL of an authentication-success webpage. In this call, Windows Media Player passes the same index that the discovery page passed to the <b>External.authenticate</b> method.</li>
     * <li>Windows Media Player displays the authentication-success webpage.</li>
     * </ol>
     * To decrypt the information supplied in <i>userInfo</i> and <i>pwdInfo</i>, use the <b>CryptUnprotectData</b> function, which is documented in the Cryptography section of the Windows SDK. You must set the CRYPTPROTECT_UI_FORBIDDEN flag in the <i>dwFlags</i> parameter. Set the optional and reserved parameters to <b>NULL</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-authenticate
     */
    Authenticate(userInfo, pwdInfo) {
        result := ComCall(20, this, "ptr", userInfo, "ptr", pwdInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Logout method ends the user's online store session.
     * @remarks
     * The plug-in must call <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-notify">IWMPContentPartnerCallback::Notify</a> to notify Windows Media Player when the log-in state changes.
     * 
     * The <b>Logout</b> method should delete any cached credentials.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-logout
     */
    Logout() {
        result := ComCall(21, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The SendMessage method enables discovery pages to send messages to the plug-in.
     * @remarks
     * The plug-in must call <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-sendmessagecomplete">IWMPContentPartnerCallback::SendMessageComplete</a> to notify Windows Media Player that the message has been processed. This causes the <a href="https://docs.microsoft.com/windows/desktop/WMP/external-onsendmessagecomplete-event">OnSendMessageComplete</a> event to occur in the discovery page.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-sendmessage
     */
    SendMessage(bstrMsg, bstrParam) {
        if(bstrMsg is String) {
            pin := BSTR.Alloc(bstrMsg)
            bstrMsg := pin.Value
        }
        if(bstrParam is String) {
            pin := BSTR.Alloc(bstrParam)
            bstrParam := pin.Value
        }

        result := ComCall(22, this, "ptr", bstrMsg, "ptr", bstrParam, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * This method is called to enable logging of certain ASX events when an ASX file created by the online store is played.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-stationevent
     */
    StationEvent(bstrStationEventType, StationId, PlaylistIndex, TrackID, TrackData, dwSecondsPlayed) {
        if(bstrStationEventType is String) {
            pin := BSTR.Alloc(bstrStationEventType)
            bstrStationEventType := pin.Value
        }
        if(TrackData is String) {
            pin := BSTR.Alloc(TrackData)
            TrackData := pin.Value
        }

        result := ComCall(23, this, "ptr", bstrStationEventType, "uint", StationId, "uint", PlaylistIndex, "uint", TrackID, "ptr", TrackData, "uint", dwSecondsPlayed, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The CompareContainerListPrices method compares the price of two content container lists.
     * @param {IWMPContentContainerList} pListBase Pointer to the <b>IWMPContentContainerList</b> interface representing the base content container list.
     * @param {IWMPContentContainerList} pListCompare Pointer to the <b>IWMPContentContainerList</b> interface representing the comparison content container list.
     * @returns {Integer} Address of a <b>long</b> that receives the result of the comparison. Return less than 0 when the base price is less than the comparison price; return 0 when the base and comparison lists have equal prices; return greater than 0 when the base price is greater than the comparison price.
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-comparecontainerlistprices
     */
    CompareContainerListPrices(pListBase, pListCompare) {
        result := ComCall(24, this, "ptr", pListBase, "ptr", pListCompare, "int*", &pResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pResult
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * The <b>VerifyPermission</b> method initiates a permission verification and then returns immediately. When the online store has completed the verification, it calls <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-verifypermissioncomplete">IWMPContentPartnerCallback::VerifyPermissionComplete</a> to notify Windows Media Player that permission has been granted or denied.
     * 
     * The following list gives the possible values for <i>bstrPermission</i> along with the corresponding meanings of <i>pContext</i>.
     * 
     * g_szVerifyPermissionSync
     * 
     * Windows Media Player is requesting permission from the online store to synchronize the content on a portable device. The <i>pContext</i> parameter is a <b>VT_BSTR</b> that specifies the canonical device name.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentpartner-verifypermission
     */
    VerifyPermission(bstrPermission, pContext) {
        if(bstrPermission is String) {
            pin := BSTR.Alloc(bstrPermission)
            bstrPermission := pin.Value
        }

        result := ComCall(25, this, "ptr", bstrPermission, "ptr", pContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
