#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nn-contentpartner-iwmpcontentcontainer
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPContentContainer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPContentContainer
     * @type {Guid}
     */
    static IID => Guid("{ad7f4d9c-1a9f-4ed2-9815-ecc0b58cb616}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetID", "GetPrice", "GetType", "GetContentCount", "GetContentPrice", "GetContentID"]

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetID method retrieves the ID of the album or list represented by the content container.
     * @remarks
     * A list, in this context, is a set of tracks that the online store offers as a bundle. The online store provides an ID and a price for the list as a whole.
     * 
     * If the container does not represent an album or list, this method retrieves -1.
     * @returns {Integer} Pointer to a <b>ULONG</b> that receives the ID.
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentcontainer-getid
     */
    GetID() {
        result := ComCall(3, this, "uint*", &pContentID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentcontainer-getprice
     */
    GetPrice() {
        pbstrPrice := BSTR()
        result := ComCall(4, this, "ptr", pbstrPrice, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrPrice
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The GetType method retrieves the type of the content container.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentcontainer-gettype
     */
    GetType() {
        pbstrType := BSTR()
        result := ComCall(5, this, "ptr", pbstrType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrType
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @returns {Integer} Pointer to a <b>ULONG</b> that receives the count.
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentcontainer-getcontentcount
     */
    GetContentCount() {
        result := ComCall(6, this, "uint*", &pcContent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentcontainer-getcontentprice
     */
    GetContentPrice(idxContent) {
        pbstrPrice := BSTR()
        result := ComCall(7, this, "uint", idxContent, "ptr", pbstrPrice, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrPrice
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @param {Integer} idxContent Specifies the zero-based index of the media item in the container..
     * @returns {Integer} Pointer to a <b>ULONG</b> that receives the ID of the media item.
     * @see https://learn.microsoft.com/windows/win32/api//content/contentpartner/nf-contentpartner-iwmpcontentcontainer-getcontentid
     */
    GetContentID(idxContent) {
        result := ComCall(8, this, "uint", idxContent, "uint*", &pContentID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pContentID
    }
}
