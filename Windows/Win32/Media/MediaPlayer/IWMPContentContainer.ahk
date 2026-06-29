#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nn-contentpartner-iwmpcontentcontainer
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPContentContainer extends IUnknown {
    /**
     * The interface identifier for IWMPContentContainer
     * @type {Guid}
     */
    static IID := Guid("{ad7f4d9c-1a9f-4ed2-9815-ecc0b58cb616}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPContentContainer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetID           : IntPtr
        GetPrice        : IntPtr
        GetType         : IntPtr
        GetContentCount : IntPtr
        GetContentPrice : IntPtr
        GetContentID    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPContentContainer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetID method retrieves the ID of the album or list represented by the content container.
     * @remarks
     * A list, in this context, is a set of tracks that the online store offers as a bundle. The online store provides an ID and a price for the list as a whole.
     * 
     * If the container does not represent an album or list, this method retrieves -1.
     * @returns {Integer} Pointer to a <b>ULONG</b> that receives the ID.
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainer-getid
     */
    GetID() {
        result := ComCall(3, this, "uint*", &pContentID := 0, "HRESULT")
        return pContentID
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * The format of the string returned in <i>pbstrPrice</i> is known only to the online store. Windows Media Player displays, but does not interpret, price strings. For more information about how Windows Media Player and the content partner plug-in exchange price information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/purchasing-media-content">Purchasing Media Content</a>.
     * 
     * A list, in this context, is a set of tracks that the online store offers as a bundle. The online store provides an ID and a price for the list as a whole.
     * 
     * If the content container does not represent an album or list, this method retrieves g_szContentPrice_Unknown.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the price or one of the following constants.
     * 
     * <table>
     * <tr>
     * <th>String
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>g_szContentPrice_Unknown</td>
     * <td>The price of the content is unknown.</td>
     * </tr>
     * <tr>
     * <td>g_szContentPrice_CannotBuy</td>
     * <td>The content cannot be purchased.</td>
     * </tr>
     * <tr>
     * <td>g_szContentPrice_Free</td>
     * <td>The content is free.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainer-getprice
     */
    GetPrice() {
        pbstrPrice := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pbstrPrice, "HRESULT")
        return pbstrPrice
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetType method retrieves the type of the content container.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainer-gettype
     */
    GetType() {
        pbstrType := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, pbstrType, "HRESULT")
        return pbstrType
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @returns {Integer} Pointer to a <b>ULONG</b> that receives the count.
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainer-getcontentcount
     */
    GetContentCount() {
        result := ComCall(6, this, "uint*", &pcContent := 0, "HRESULT")
        return pcContent
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * The format of the string returned in <i>pbstrPrice</i> is known only to the online store. Windows Media Player displays, but does not interpret, price strings. For more information about how Windows Media Player and the content partner plug-in exchange price information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/purchasing-media-content">Purchasing Media Content</a>.
     * @param {Integer} idxContent Specifies the zero-based index of the media item for which to retrieve the price.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the price or one of the following constants.
     * 
     * <table>
     * <tr>
     * <th>String
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>g_szContentPrice_Unknown</td>
     * <td>The price of the content is unknown.</td>
     * </tr>
     * <tr>
     * <td>g_szContentPrice_CannotBuy</td>
     * <td>The content cannot be purchased.</td>
     * </tr>
     * <tr>
     * <td>g_szContentPrice_Free</td>
     * <td>The content is free.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainer-getcontentprice
     */
    GetContentPrice(idxContent) {
        pbstrPrice := BSTR.Owned()
        result := ComCall(7, this, "uint", idxContent, BSTR.Ptr, pbstrPrice, "HRESULT")
        return pbstrPrice
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {Integer} idxContent Specifies the zero-based index of the media item in the container..
     * @returns {Integer} Pointer to a <b>ULONG</b> that receives the ID of the media item.
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainer-getcontentid
     */
    GetContentID(idxContent) {
        result := ComCall(8, this, "uint", idxContent, "uint*", &pContentID := 0, "HRESULT")
        return pContentID
    }

    Query(iid) {
        if (IWMPContentContainer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetID := CallbackCreate(GetMethod(implObj, "GetID"), flags, 2)
        this.vtbl.GetPrice := CallbackCreate(GetMethod(implObj, "GetPrice"), flags, 2)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 2)
        this.vtbl.GetContentCount := CallbackCreate(GetMethod(implObj, "GetContentCount"), flags, 2)
        this.vtbl.GetContentPrice := CallbackCreate(GetMethod(implObj, "GetContentPrice"), flags, 3)
        this.vtbl.GetContentID := CallbackCreate(GetMethod(implObj, "GetContentID"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetID)
        CallbackFree(this.vtbl.GetPrice)
        CallbackFree(this.vtbl.GetType)
        CallbackFree(this.vtbl.GetContentCount)
        CallbackFree(this.vtbl.GetContentPrice)
        CallbackFree(this.vtbl.GetContentID)
    }
}
