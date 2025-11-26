#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPMedia.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPPlaylist interface provides methods for manipulating lists of media items.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpplaylist
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPlaylist extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPPlaylist
     * @type {Guid}
     */
    static IID => Guid("{d5f0f4f1-130c-11d3-b14e-00c04f79faa6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_count", "get_name", "put_name", "get_attributeCount", "get_attributeName", "get_item", "getItemInfo", "setItemInfo", "get_isIdentical", "clear", "insertItem", "appendItem", "removeItem", "moveItem"]

    /**
     */
    count {
        get => this.get_count()
    }

    /**
     */
    name {
        get => this.get_name()
        set => this.put_name(value)
    }

    /**
     */
    attributeCount {
        get => this.get_attributeCount()
    }

    /**
     * The get_count method retrieves the number of items in the playlist.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> containing the count.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylist-get_count
     */
    get_count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The get_name method retrieves the name of the playlist.
     * @param {Pointer<BSTR>} pbstrName Pointer to a <b>BSTR</b> containing the name.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylist-get_name
     */
    get_name(pbstrName) {
        result := ComCall(8, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * The put_name method specifies the name of the playlist.
     * @param {BSTR} bstrName String containing the name.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylist-put_name
     */
    put_name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * The get_attributeCount method retrieves the number of attributes associated with the playlist.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> containing the count.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylist-get_attributecount
     */
    get_attributeCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The get_attributeName method retrieves the name of an attribute specified by an index.
     * @param {Integer} lIndex <b>long</b> containing the index.
     * @param {Pointer<BSTR>} pbstrAttributeName Pointer to a <b>BSTR</b> containing the attribute name.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylist-get_attributename
     */
    get_attributeName(lIndex, pbstrAttributeName) {
        result := ComCall(11, this, "int", lIndex, "ptr", pbstrAttributeName, "HRESULT")
        return result
    }

    /**
     * The get_item method retrieves the media item at the specified index.
     * @param {Integer} lIndex <b>long</b> containing the index.
     * @returns {IWMPMedia} Pointer to a pointer to an <b>IWMPMedia</b> interface for the returned item.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylist-get_item
     */
    get_item(lIndex) {
        result := ComCall(12, this, "int", lIndex, "ptr*", &ppIWMPMedia := 0, "HRESULT")
        return IWMPMedia(ppIWMPMedia)
    }

    /**
     * The getItemInfo method retrieves the value of a playlist attribute specified by name.
     * @param {BSTR} bstrName <b>BSTR</b> containing the name.
     * @param {Pointer<BSTR>} pbstrVal Pointer to a <b>BSTR</b> containing the returned value.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylist-getiteminfo
     */
    getItemInfo(bstrName, pbstrVal) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(13, this, "ptr", bstrName, "ptr", pbstrVal, "HRESULT")
        return result
    }

    /**
     * The setItemInfo method specifies the value of an attribute of the current playlist. .
     * @param {BSTR} bstrName String containing the attribute name.
     * @param {BSTR} bstrValue String containing the attribute value.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylist-setiteminfo
     */
    setItemInfo(bstrName, bstrValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(14, this, "ptr", bstrName, "ptr", bstrValue, "HRESULT")
        return result
    }

    /**
     * The get_isIdentical method retrieves a value indicating whether the specified playlist is identical to the current playlist.
     * @param {IWMPPlaylist} pIWMPPlaylist Pointer to an <b>IWMPPlaylist</b> interface for the playlist that this method compares to the current playlist.
     * @param {Pointer<VARIANT_BOOL>} pvbool <b>VARIANT_BOOL</b> that specifies whether the compared playlists were identical.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylist-get_isidentical
     */
    get_isIdentical(pIWMPPlaylist, pvbool) {
        pvboolMarshal := pvbool is VarRef ? "short*" : "ptr"

        result := ComCall(15, this, "ptr", pIWMPPlaylist, pvboolMarshal, pvbool, "HRESULT")
        return result
    }

    /**
     * The clear method is reserved for future use.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylist-clear
     */
    clear() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * The insertItem method adds a media item at the specified location in the playlist.
     * @param {Integer} lIndex <b>long</b> containing the index at which this method will add the item.
     * @param {IWMPMedia} pIWMPMedia Pointer to an <b>IWMPMedia</b> interface for the inserted item.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylist-insertitem
     */
    insertItem(lIndex, pIWMPMedia) {
        result := ComCall(17, this, "int", lIndex, "ptr", pIWMPMedia, "HRESULT")
        return result
    }

    /**
     * The appendItem method adds a media item to the end of the playlist.
     * @param {IWMPMedia} pIWMPMedia Pointer to an <b>IWMPMedia</b> interface.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylist-appenditem
     */
    appendItem(pIWMPMedia) {
        result := ComCall(18, this, "ptr", pIWMPMedia, "HRESULT")
        return result
    }

    /**
     * The removeItem method removes the specified media item from the playlist.
     * @param {IWMPMedia} pIWMPMedia Pointer to an <b>IWMPMedia</b> interface for the item to remove.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylist-removeitem
     */
    removeItem(pIWMPMedia) {
        result := ComCall(19, this, "ptr", pIWMPMedia, "HRESULT")
        return result
    }

    /**
     * The moveItem method changes the location of a media item in the playlist.
     * @param {Integer} lIndexOld <b>long</b> containing the original index.
     * @param {Integer} lIndexNew <b>long</b> containing the new index.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylist-moveitem
     */
    moveItem(lIndexOld, lIndexNew) {
        result := ComCall(20, this, "int", lIndexOld, "int", lIndexNew, "HRESULT")
        return result
    }
}
