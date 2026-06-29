#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWMPMedia.ahk" { IWMPMedia }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IWMPPlaylist interface provides methods for manipulating lists of media items.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpplaylist
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPPlaylist extends IDispatch {
    /**
     * The interface identifier for IWMPPlaylist
     * @type {Guid}
     */
    static IID := Guid("{d5f0f4f1-130c-11d3-b14e-00c04f79faa6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPPlaylist interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_count          : IntPtr
        get_name           : IntPtr
        put_name           : IntPtr
        get_attributeCount : IntPtr
        get_attributeName  : IntPtr
        get_item           : IntPtr
        getItemInfo        : IntPtr
        setItemInfo        : IntPtr
        get_isIdentical    : IntPtr
        clear              : IntPtr
        insertItem         : IntPtr
        appendItem         : IntPtr
        removeItem         : IntPtr
        moveItem           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPPlaylist.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    count {
        get => this.get_count()
    }

    /**
     * @type {BSTR} 
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
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-get_count
     */
    get_count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The get_name method retrieves the name of the playlist.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-get_name
     */
    get_name(pbstrName) {
        result := ComCall(8, this, BSTR.Ptr, pbstrName, "HRESULT")
        return result
    }

    /**
     * The put_name method specifies the name of the playlist.
     * @remarks
     * Before calling this method, you must have full access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_INVALIDARG.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-put_name
     */
    put_name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, BSTR, bstrName, "HRESULT")
        return result
    }

    /**
     * The get_attributeCount method retrieves the number of attributes associated with the playlist.
     * @remarks
     * Because playlists can come from many different sources, they can have several different sets of properties. This method retrieves the total number of properties available so that the other methods of the <b>Playlist</b> object can access them.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * For information about the attributes supported by Windows Media Player, see the Windows Media Player <a href="https://docs.microsoft.com/windows/desktop/WMP/attribute-reference">Attribute Reference</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-get_attributecount
     */
    get_attributeCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The get_attributeName method retrieves the name of an attribute specified by an index.
     * @remarks
     * The number of attributes is retrieved by the <b>get_attributeCount</b> method.
     * 
     * The <i>pbstAttributeName</i> string can be supplied to the <b>setItemInfo</b> or <b>getItemInfo</b> methods to specify or retrieve a value for the named attribute.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * For information about the attributes supported by Windows Media Player, see the Windows Media Player <a href="https://docs.microsoft.com/windows/desktop/WMP/attribute-reference">Attribute Reference</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-get_attributename
     */
    get_attributeName(lIndex, pbstrAttributeName) {
        result := ComCall(11, this, "int", lIndex, BSTR.Ptr, pbstrAttributeName, "HRESULT")
        return result
    }

    /**
     * The get_item method retrieves the media item at the specified index.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {Integer} lIndex <b>long</b> containing the index.
     * @returns {IWMPMedia} Pointer to a pointer to an <b>IWMPMedia</b> interface for the returned item.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-get_item
     */
    get_item(lIndex) {
        result := ComCall(12, this, "int", lIndex, "ptr*", &ppIWMPMedia := 0, "HRESULT")
        return IWMPMedia(ppIWMPMedia)
    }

    /**
     * The getItemInfo method retrieves the value of a playlist attribute specified by name.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-getiteminfo
     */
    getItemInfo(bstrName, pbstrVal) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(13, this, BSTR, bstrName, BSTR.Ptr, pbstrVal, "HRESULT")
        return result
    }

    /**
     * The setItemInfo method specifies the value of an attribute of the current playlist. .
     * @remarks
     * Before calling this method, you must have full access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_INVALIDARG.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-setiteminfo
     */
    setItemInfo(bstrName, bstrValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(14, this, BSTR, bstrName, BSTR, bstrValue, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-get_isidentical
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-clear
     */
    clear() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * The insertItem method adds a media item at the specified location in the playlist.
     * @remarks
     * All items after the inserted item will have their index numbers increased by one.
     * 
     * Before calling this method, you must have full access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-insertitem
     */
    insertItem(lIndex, pIWMPMedia) {
        result := ComCall(17, this, "int", lIndex, "ptr", pIWMPMedia, "HRESULT")
        return result
    }

    /**
     * The appendItem method adds a media item to the end of the playlist.
     * @remarks
     * Before calling this method, you must have full access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-appenditem
     */
    appendItem(pIWMPMedia) {
        result := ComCall(18, this, "ptr", pIWMPMedia, "HRESULT")
        return result
    }

    /**
     * The removeItem method removes the specified media item from the playlist.
     * @remarks
     * If the item removed is the currently playing track, playback stops and the next item in the playlist becomes the current one.
     * 
     * If there is no next item, the previous item is used. If there are no other items, then the <b>IWMPCore::get_currentMedia</b> method will return <b>NULL</b>.
     * 
     * Before calling this method, you must have full access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-removeitem
     */
    removeItem(pIWMPMedia) {
        result := ComCall(19, this, "ptr", pIWMPMedia, "HRESULT")
        return result
    }

    /**
     * The moveItem method changes the location of a media item in the playlist.
     * @remarks
     * All items after the inserted item will have their index numbers increased by one.
     * 
     * Before calling this method, you must have full access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylist-moveitem
     */
    moveItem(lIndexOld, lIndexNew) {
        result := ComCall(20, this, "int", lIndexOld, "int", lIndexNew, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPPlaylist.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_count := CallbackCreate(GetMethod(implObj, "get_count"), flags, 2)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.put_name := CallbackCreate(GetMethod(implObj, "put_name"), flags, 2)
        this.vtbl.get_attributeCount := CallbackCreate(GetMethod(implObj, "get_attributeCount"), flags, 2)
        this.vtbl.get_attributeName := CallbackCreate(GetMethod(implObj, "get_attributeName"), flags, 3)
        this.vtbl.get_item := CallbackCreate(GetMethod(implObj, "get_item"), flags, 3)
        this.vtbl.getItemInfo := CallbackCreate(GetMethod(implObj, "getItemInfo"), flags, 3)
        this.vtbl.setItemInfo := CallbackCreate(GetMethod(implObj, "setItemInfo"), flags, 3)
        this.vtbl.get_isIdentical := CallbackCreate(GetMethod(implObj, "get_isIdentical"), flags, 3)
        this.vtbl.clear := CallbackCreate(GetMethod(implObj, "clear"), flags, 1)
        this.vtbl.insertItem := CallbackCreate(GetMethod(implObj, "insertItem"), flags, 3)
        this.vtbl.appendItem := CallbackCreate(GetMethod(implObj, "appendItem"), flags, 2)
        this.vtbl.removeItem := CallbackCreate(GetMethod(implObj, "removeItem"), flags, 2)
        this.vtbl.moveItem := CallbackCreate(GetMethod(implObj, "moveItem"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_count)
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.put_name)
        CallbackFree(this.vtbl.get_attributeCount)
        CallbackFree(this.vtbl.get_attributeName)
        CallbackFree(this.vtbl.get_item)
        CallbackFree(this.vtbl.getItemInfo)
        CallbackFree(this.vtbl.setItemInfo)
        CallbackFree(this.vtbl.get_isIdentical)
        CallbackFree(this.vtbl.clear)
        CallbackFree(this.vtbl.insertItem)
        CallbackFree(this.vtbl.appendItem)
        CallbackFree(this.vtbl.removeItem)
        CallbackFree(this.vtbl.moveItem)
    }
}
