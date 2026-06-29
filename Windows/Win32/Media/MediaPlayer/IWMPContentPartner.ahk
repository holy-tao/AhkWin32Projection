#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WMPTemplateSize.ahk" { WMPTemplateSize }
#Import ".\WMPPartnerNotification.ahk" { WMPPartnerNotification }
#Import ".\WMPStreamingType.ahk" { WMPStreamingType }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWMPContentContainerList.ahk" { IWMPContentContainerList }
#Import "..\..\System\Com\BLOB.ahk" { BLOB }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\WMPTaskType.ahk" { WMPTaskType }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WMPContextMenuInfo.ahk" { WMPContextMenuInfo }
#Import ".\IWMPContentPartnerCallback.ahk" { IWMPContentPartnerCallback }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nn-contentpartner-iwmpcontentpartner
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPContentPartner extends IUnknown {
    /**
     * The interface identifier for IWMPContentPartner
     * @type {Guid}
     */
    static IID := Guid("{55455073-41b5-4e75-87b8-f13bdb291d08}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPContentPartner interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetCallback                : IntPtr
        Notify                     : IntPtr
        GetItemInfo                : IntPtr
        GetContentPartnerInfo      : IntPtr
        GetCommands                : IntPtr
        InvokeCommand              : IntPtr
        CanBuySilent               : IntPtr
        Buy                        : IntPtr
        GetStreamingURL            : IntPtr
        Download                   : IntPtr
        DownloadTrackComplete      : IntPtr
        RefreshLicense             : IntPtr
        GetCatalogURL              : IntPtr
        GetTemplate                : IntPtr
        UpdateDevice               : IntPtr
        GetListContents            : IntPtr
        Login                      : IntPtr
        Authenticate               : IntPtr
        Logout                     : IntPtr
        SendMessage                : IntPtr
        StationEvent               : IntPtr
        CompareContainerListPrices : IntPtr
        VerifyPermission           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPContentPartner.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-setcallback
     */
    SetCallback(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * The data type for <i>pContext</i> is <b>VT_EMPTY</b> for all notifications except wmpsnCatalogDownloadFailure. In the case of a catalog download failure, the data type is <b>VT_ERROR</b> and the variable contains an <b>HRESULT</b> error code.
     * @param {WMPPartnerNotification} type The notification type, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/ne-contentpartner-wmppartnernotification">WMPPartnerNotification</a> enumeration.
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-notify
     */
    Notify(type, pContext) {
        result := ComCall(4, this, WMPPartnerNotification, type, VARIANT.Ptr, pContext, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getiteminfo
     */
    GetItemInfo(bstrInfoName, pContext) {
        bstrInfoName := bstrInfoName is String ? BSTR.Alloc(bstrInfoName).Value : bstrInfoName

        pData := VARIANT()
        result := ComCall(5, this, BSTR, bstrInfoName, VARIANT.Ptr, pContext, VARIANT.Ptr, pData, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getcontentpartnerinfo
     */
    GetContentPartnerInfo(bstrInfoName) {
        bstrInfoName := bstrInfoName is String ? BSTR.Alloc(bstrInfoName).Value : bstrInfoName

        pData := VARIANT()
        result := ComCall(6, this, BSTR, bstrInfoName, VARIANT.Ptr, pData, "HRESULT")
        return pData
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetCommands method retrieves context menu commands.
     * @remarks
     * This method must call <b>CoTaskMemAlloc</b> to allocate the array that it returns in <i>pprgItems</i>.
     * @param {BSTR} _location A <a href="https://docs.microsoft.com/windows/desktop/WMP/library-location-constants">library location constant</a> that specifies the type of library view where the user right-clicked. For example, the constant g_szCPGenreID indicates that the user right-clicked in the view of a particular genre
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getcommands
     */
    GetCommands(_location, pLocationContext, itemLocation, cItemIDs, prgItemIDs, pcItemIDs, pprgItems) {
        _location := _location is String ? BSTR.Alloc(_location).Value : _location
        itemLocation := itemLocation is String ? BSTR.Alloc(itemLocation).Value : itemLocation

        prgItemIDsMarshal := prgItemIDs is VarRef ? "uint*" : "ptr"
        pcItemIDsMarshal := pcItemIDs is VarRef ? "uint*" : "ptr"
        pprgItemsMarshal := pprgItems is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, BSTR, _location, VARIANT.Ptr, pLocationContext, BSTR, itemLocation, "uint", cItemIDs, prgItemIDsMarshal, prgItemIDs, pcItemIDsMarshal, pcItemIDs, pprgItemsMarshal, pprgItems, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The InvokeCommand method invokes a context menu command.
     * @param {Integer} dwCommandID ID of the command to invoke. Windows Media Player previously obtained this command ID from the content partner plug-in by calling <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getcommands">IWMPContentPartner::GetCommands</a>.
     * @param {BSTR} _location A library location constant that specifies the type of library view where the user right-clicked. For example, the constant g_szCPGenreID specifies that the user right-clicked in the view of a particular genre.
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-invokecommand
     */
    InvokeCommand(dwCommandID, _location, pLocationContext, itemLocation, cItemIDs, rgItemIDs) {
        _location := _location is String ? BSTR.Alloc(_location).Value : _location
        itemLocation := itemLocation is String ? BSTR.Alloc(itemLocation).Value : itemLocation

        rgItemIDsMarshal := rgItemIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", dwCommandID, BSTR, _location, VARIANT.Ptr, pLocationContext, BSTR, itemLocation, "uint", cItemIDs, rgItemIDsMarshal, rgItemIDs, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-canbuysilent
     */
    CanBuySilent(pInfo, pbstrTotalPrice, pSilentOK) {
        pSilentOKMarshal := pSilentOK is VarRef ? "short*" : "ptr"

        result := ComCall(9, this, "ptr", pInfo, BSTR.Ptr, pbstrTotalPrice, pSilentOKMarshal, pSilentOK, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-buy
     */
    Buy(pInfo, cookie) {
        result := ComCall(10, this, "ptr", pInfo, "uint", cookie, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetStreamingURL method retrieves the streaming URL of a track.
     * @param {WMPStreamingType} st A member of the <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/ne-contentpartner-wmpstreamingtype">WMPStreamingType</a> enumeration that specifies the type (music, video, or radio) of the media item to be streamed.
     * @param {Pointer<VARIANT>} pStreamContext Pointer to a <b>VARIANT</b> that contains the ID of the media item to be streamed. The ID is in the <b>ulVal</b> member of the <b>VARIANT</b>, which has a type of <b>VT_UI4</b>.
     * @returns {BSTR} Address of a <b>BSTR</b> that receives the URL of the track.
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getstreamingurl
     */
    GetStreamingURL(st, pStreamContext) {
        pbstrURL := BSTR.Owned()
        result := ComCall(11, this, WMPStreamingType, st, VARIANT.Ptr, pStreamContext, BSTR.Ptr, pbstrURL, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-download
     */
    Download(pInfo, cookie) {
        result := ComCall(12, this, "ptr", pInfo, "uint", cookie, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-downloadtrackcomplete
     */
    DownloadTrackComplete(hrResult, contentID, downloadTrackParam) {
        downloadTrackParam := downloadTrackParam is String ? BSTR.Alloc(downloadTrackParam).Value : downloadTrackParam

        result := ComCall(13, this, "int", hrResult, "uint", contentID, BSTR, downloadTrackParam, "HRESULT")
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
     * @param {WMPStreamingType} type A member of the <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/ne-contentpartner-wmpstreamingtype">WMPStreamingType</a> enumeration that specifies the type (music, video, or radio) of the media file.
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-refreshlicense
     */
    RefreshLicense(dwCookie, fLocal, bstrURL, type, contentID, bstrRefreshReason, pReasonContext) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL
        bstrRefreshReason := bstrRefreshReason is String ? BSTR.Alloc(bstrRefreshReason).Value : bstrRefreshReason

        result := ComCall(14, this, "uint", dwCookie, VARIANT_BOOL, fLocal, BSTR, bstrURL, WMPStreamingType, type, "uint", contentID, BSTR, bstrRefreshReason, VARIANT.Ptr, pReasonContext, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getcatalogurl
     */
    GetCatalogURL(dwCatalogVersion, dwCatalogSchemaVersion, catalogLCID, pdwNewCatalogVersion, pbstrCatalogURL, pExpirationDate) {
        pdwNewCatalogVersionMarshal := pdwNewCatalogVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", dwCatalogVersion, "uint", dwCatalogSchemaVersion, "uint", catalogLCID, pdwNewCatalogVersionMarshal, pdwNewCatalogVersion, BSTR.Ptr, pbstrCatalogURL, VARIANT.Ptr, pExpirationDate, "HRESULT")
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
     * @param {WMPTaskType} task A member of the <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/ne-contentpartner-wmptasktype">WMPTaskType</a> enumeration that specifies the active task pane.
     * @param {BSTR} _location A <a href="https://docs.microsoft.com/windows/desktop/WMP/library-location-constants">library location constant</a> that specifies the type of library view the user is currently seeing. For example, the constant g_szCPListID specifies that the user is viewing a pane that shows a particular playlist.
     * @param {Pointer<VARIANT>} pContext The ID of the specific item the user is currently seeing. For example, if <i>location</i> is g_szCPListID, then this parameter specifies the ID of the particular playlist that the user is seeing.
     * @param {BSTR} clickLocation A library location constant that specifies the type of item the user has selected. For example, the constant g_szCPTrackID specifies that the user has selected a particular music track.
     * @param {Pointer<VARIANT>} pClickContext The ID of the particular item the user has selected. For example, if <i>clickLocation</i> is g_szCPTrackID, then this parameter specifies the ID of the particular track that the user has selected.
     * @param {BSTR} bstrFilter The filter for the current library view. This is the text that the user entered in the Player's word wheel control.
     * @param {BSTR} bstrViewParams Parameters, meaningful only to the online store, associated with the new library location. See Remarks.
     * @param {Pointer<BSTR>} pbstrTemplateURL Pointer to a <b>BSTR</b> that receives the URL of the discovery page to display.
     * @param {Pointer<WMPTemplateSize>} pTemplateSize Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/ne-contentpartner-wmptemplatesize">WMPTemplateSize</a> enumeration that indicates the size of the template in which the Player will display the discovery page.
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-gettemplate
     */
    GetTemplate(task, _location, pContext, clickLocation, pClickContext, bstrFilter, bstrViewParams, pbstrTemplateURL, pTemplateSize) {
        _location := _location is String ? BSTR.Alloc(_location).Value : _location
        clickLocation := clickLocation is String ? BSTR.Alloc(clickLocation).Value : clickLocation
        bstrFilter := bstrFilter is String ? BSTR.Alloc(bstrFilter).Value : bstrFilter
        bstrViewParams := bstrViewParams is String ? BSTR.Alloc(bstrViewParams).Value : bstrViewParams

        pTemplateSizeMarshal := pTemplateSize is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, WMPTaskType, task, BSTR, _location, VARIANT.Ptr, pContext, BSTR, clickLocation, VARIANT.Ptr, pClickContext, BSTR, bstrFilter, BSTR, bstrViewParams, BSTR.Ptr, pbstrTemplateURL, pTemplateSizeMarshal, pTemplateSize, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-updatedevice
     */
    UpdateDevice(bstrDeviceName) {
        bstrDeviceName := bstrDeviceName is String ? BSTR.Alloc(bstrDeviceName).Value : bstrDeviceName

        result := ComCall(17, this, BSTR, bstrDeviceName, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetListContents method initiates the retrieval of a dynamic list.
     * @remarks
     * Retrieving list contents is an asynchronous operation. This method should initiate the retrieval and return immediately. Then the plug-in must make one or more calls to <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-addlistcontents">IWMPContentPartnerCallback::AddListContents</a> to supply Windows Media Player with the requested list contents. When the plug-in has supplied all the data, it must call <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartnercallback-listcontentscomplete">IWMPContentPartnerCallback::ListContentsComplete</a> to signal the end of the operation. In each case, the plug-in passes the cookie provided in <i>dwListCookie</i> to identify the correct list retrieval session.
     * @param {BSTR} _location A library location constant that specifies the type of library view that will have its list retrieved. For example, the constant g_szCPListID specifies that a particular list will be retrieved.
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getlistcontents
     */
    GetListContents(_location, pContext, bstrListType, bstrParams, dwListCookie) {
        _location := _location is String ? BSTR.Alloc(_location).Value : _location
        bstrListType := bstrListType is String ? BSTR.Alloc(bstrListType).Value : bstrListType
        bstrParams := bstrParams is String ? BSTR.Alloc(bstrParams).Value : bstrParams

        result := ComCall(18, this, BSTR, _location, VARIANT.Ptr, pContext, BSTR, bstrListType, BSTR, bstrParams, "uint", dwListCookie, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-login
     */
    Login(userInfo, pwdInfo, fUsedCachedCreds, fOkToCache) {
        result := ComCall(19, this, BLOB, userInfo, BLOB, pwdInfo, VARIANT_BOOL, fUsedCachedCreds, VARIANT_BOOL, fOkToCache, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-authenticate
     */
    Authenticate(userInfo, pwdInfo) {
        result := ComCall(20, this, BLOB, userInfo, BLOB, pwdInfo, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-logout
     */
    Logout() {
        result := ComCall(21, this, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-sendmessage
     */
    SendMessage(bstrMsg, bstrParam) {
        bstrMsg := bstrMsg is String ? BSTR.Alloc(bstrMsg).Value : bstrMsg
        bstrParam := bstrParam is String ? BSTR.Alloc(bstrParam).Value : bstrParam

        result := ComCall(22, this, BSTR, bstrMsg, BSTR, bstrParam, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-stationevent
     */
    StationEvent(bstrStationEventType, StationId, PlaylistIndex, TrackID, TrackData, dwSecondsPlayed) {
        bstrStationEventType := bstrStationEventType is String ? BSTR.Alloc(bstrStationEventType).Value : bstrStationEventType
        TrackData := TrackData is String ? BSTR.Alloc(TrackData).Value : TrackData

        result := ComCall(23, this, BSTR, bstrStationEventType, "uint", StationId, "uint", PlaylistIndex, "uint", TrackID, BSTR, TrackData, "uint", dwSecondsPlayed, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The CompareContainerListPrices method compares the price of two content container lists.
     * @param {IWMPContentContainerList} pListBase Pointer to the <b>IWMPContentContainerList</b> interface representing the base content container list.
     * @param {IWMPContentContainerList} pListCompare Pointer to the <b>IWMPContentContainerList</b> interface representing the comparison content container list.
     * @returns {Integer} Address of a <b>long</b> that receives the result of the comparison. Return less than 0 when the base price is less than the comparison price; return 0 when the base and comparison lists have equal prices; return greater than 0 when the base price is greater than the comparison price.
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-comparecontainerlistprices
     */
    CompareContainerListPrices(pListBase, pListCompare) {
        result := ComCall(24, this, "ptr", pListBase, "ptr", pListCompare, "int*", &pResult := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentpartner-verifypermission
     */
    VerifyPermission(bstrPermission, pContext) {
        bstrPermission := bstrPermission is String ? BSTR.Alloc(bstrPermission).Value : bstrPermission

        result := ComCall(25, this, BSTR, bstrPermission, VARIANT.Ptr, pContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPContentPartner.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetCallback := CallbackCreate(GetMethod(implObj, "SetCallback"), flags, 2)
        this.vtbl.Notify := CallbackCreate(GetMethod(implObj, "Notify"), flags, 3)
        this.vtbl.GetItemInfo := CallbackCreate(GetMethod(implObj, "GetItemInfo"), flags, 4)
        this.vtbl.GetContentPartnerInfo := CallbackCreate(GetMethod(implObj, "GetContentPartnerInfo"), flags, 3)
        this.vtbl.GetCommands := CallbackCreate(GetMethod(implObj, "GetCommands"), flags, 8)
        this.vtbl.InvokeCommand := CallbackCreate(GetMethod(implObj, "InvokeCommand"), flags, 7)
        this.vtbl.CanBuySilent := CallbackCreate(GetMethod(implObj, "CanBuySilent"), flags, 4)
        this.vtbl.Buy := CallbackCreate(GetMethod(implObj, "Buy"), flags, 3)
        this.vtbl.GetStreamingURL := CallbackCreate(GetMethod(implObj, "GetStreamingURL"), flags, 4)
        this.vtbl.Download := CallbackCreate(GetMethod(implObj, "Download"), flags, 3)
        this.vtbl.DownloadTrackComplete := CallbackCreate(GetMethod(implObj, "DownloadTrackComplete"), flags, 4)
        this.vtbl.RefreshLicense := CallbackCreate(GetMethod(implObj, "RefreshLicense"), flags, 8)
        this.vtbl.GetCatalogURL := CallbackCreate(GetMethod(implObj, "GetCatalogURL"), flags, 7)
        this.vtbl.GetTemplate := CallbackCreate(GetMethod(implObj, "GetTemplate"), flags, 10)
        this.vtbl.UpdateDevice := CallbackCreate(GetMethod(implObj, "UpdateDevice"), flags, 2)
        this.vtbl.GetListContents := CallbackCreate(GetMethod(implObj, "GetListContents"), flags, 6)
        this.vtbl.Login := CallbackCreate(GetMethod(implObj, "Login"), flags, 5)
        this.vtbl.Authenticate := CallbackCreate(GetMethod(implObj, "Authenticate"), flags, 3)
        this.vtbl.Logout := CallbackCreate(GetMethod(implObj, "Logout"), flags, 1)
        this.vtbl.SendMessage := CallbackCreate(GetMethod(implObj, "SendMessage"), flags, 3)
        this.vtbl.StationEvent := CallbackCreate(GetMethod(implObj, "StationEvent"), flags, 7)
        this.vtbl.CompareContainerListPrices := CallbackCreate(GetMethod(implObj, "CompareContainerListPrices"), flags, 4)
        this.vtbl.VerifyPermission := CallbackCreate(GetMethod(implObj, "VerifyPermission"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetCallback)
        CallbackFree(this.vtbl.Notify)
        CallbackFree(this.vtbl.GetItemInfo)
        CallbackFree(this.vtbl.GetContentPartnerInfo)
        CallbackFree(this.vtbl.GetCommands)
        CallbackFree(this.vtbl.InvokeCommand)
        CallbackFree(this.vtbl.CanBuySilent)
        CallbackFree(this.vtbl.Buy)
        CallbackFree(this.vtbl.GetStreamingURL)
        CallbackFree(this.vtbl.Download)
        CallbackFree(this.vtbl.DownloadTrackComplete)
        CallbackFree(this.vtbl.RefreshLicense)
        CallbackFree(this.vtbl.GetCatalogURL)
        CallbackFree(this.vtbl.GetTemplate)
        CallbackFree(this.vtbl.UpdateDevice)
        CallbackFree(this.vtbl.GetListContents)
        CallbackFree(this.vtbl.Login)
        CallbackFree(this.vtbl.Authenticate)
        CallbackFree(this.vtbl.Logout)
        CallbackFree(this.vtbl.SendMessage)
        CallbackFree(this.vtbl.StationEvent)
        CallbackFree(this.vtbl.CompareContainerListPrices)
        CallbackFree(this.vtbl.VerifyPermission)
    }
}
