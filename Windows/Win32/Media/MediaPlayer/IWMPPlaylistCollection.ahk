#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IWMPPlaylistArray.ahk" { IWMPPlaylistArray }
#Import ".\IWMPPlaylist.ahk" { IWMPPlaylist }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IWMPPlaylistCollection interface provides methods for manipulating the IWMPPlaylist and IWMPPlaylistArray interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpplaylistcollection
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPPlaylistCollection extends IDispatch {
    /**
     * The interface identifier for IWMPPlaylistCollection
     * @type {Guid}
     */
    static IID := Guid("{10a13217-23a7-439b-b1c0-d847c79b7774}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPPlaylistCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        newPlaylist    : IntPtr
        getAll         : IntPtr
        getByName      : IntPtr
        remove         : IntPtr
        setDeleted     : IntPtr
        isDeleted      : IntPtr
        importPlaylist : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPPlaylistCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The newPlaylist method creates a new, empty playlist in the library.
     * @remarks
     * This method creates an empty playlist in the library. To fill the playlist with media items, use <b>IWMPPlaylist::appendItem</b> or <b>IWMPPlaylist::insertItem</b>.
     * 
     * Multiple playlists having the same name are permitted in the library. To avoid creating a duplicate playlist name with this method, use the <b>getByName</b> method and <b>IWMPPlaylistArray::count</b> to determine whether a playlist with a particular name already exists.
     * 
     * Leading and trailing spaces are not permitted in playlist names, and are automatically removed from the value specified for the bstrName parameter.
     * 
     * Before calling this method, you must have full access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {BSTR} bstrName String containing the name of the new playlist.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface for the new playlist.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylistcollection-newplaylist
     */
    newPlaylist(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, BSTR, bstrName, "ptr*", &ppItem := 0, "HRESULT")
        return IWMPPlaylist(ppItem)
    }

    /**
     * The getAll method retrieves a pointer to an IWMPPlaylistArray interface representing all of the playlists in the library.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @returns {IWMPPlaylistArray} Pointer to a pointer to an <b>IWMPPlaylistArray</b> interface for the retrieved array of playlists.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylistcollection-getall
     */
    getAll() {
        result := ComCall(8, this, "ptr*", &ppPlaylistArray := 0, "HRESULT")
        return IWMPPlaylistArray(ppPlaylistArray)
    }

    /**
     * The getByName method retrieves a pointer to an IWMPPlaylistArray interface on an object containing playlists with the specified name, if any exist.
     * @remarks
     * Use <b>IWMPPlaylistArray::count</b> to determine whether a playlist exists. If <b>count</b> is zero, the array is empty.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {BSTR} bstrName String containing the name.
     * @returns {IWMPPlaylistArray} Pointer to a pointer to an <b>IWMPPlaylistArray</b> interface for the retrieved array of playlists.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylistcollection-getbyname
     */
    getByName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, BSTR, bstrName, "ptr*", &ppPlaylistArray := 0, "HRESULT")
        return IWMPPlaylistArray(ppPlaylistArray)
    }

    /**
     * The remove method removes a playlist from the library.
     * @remarks
     * Before calling this method, you must have full access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {IWMPPlaylist} pItem Pointer to an <b>IWMPPlaylist</b> interface for the playlist that this method will remove.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylistcollection-remove
     */
    remove(pItem) {
        result := ComCall(10, this, "ptr", pItem, "HRESULT")
        return result
    }

    /**
     * The IWMPPlaylistCollection interface provides methods for manipulating the IWMPPlaylist and IWMPPlaylistArray interfaces.
     * @param {IWMPPlaylist} pItem 
     * @param {VARIANT_BOOL} varfIsDeleted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpplaylistcollection
     */
    setDeleted(pItem, varfIsDeleted) {
        result := ComCall(11, this, "ptr", pItem, VARIANT_BOOL, varfIsDeleted, "HRESULT")
        return result
    }

    /**
     * The isDeleted method retrieves a value indicating whether the specified playlist is in the deleted items folder.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>VARIANT_BOOL</b> set to <b>FALSE</b>.
     * @param {IWMPPlaylist} pItem Pointer to an <b>IWMPPlaylist</b> interface for the queried playlist.
     * @param {Pointer<VARIANT_BOOL>} pvarfIsDeleted Pointer to a <b>VARIANT_BOOL</b> that specifies whether the given playlist was deleted.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylistcollection-isdeleted
     */
    isDeleted(pItem, pvarfIsDeleted) {
        pvarfIsDeletedMarshal := pvarfIsDeleted is VarRef ? "short*" : "ptr"

        result := ComCall(12, this, "ptr", pItem, pvarfIsDeletedMarshal, pvarfIsDeleted, "HRESULT")
        return result
    }

    /**
     * The importPlaylist method adds a static playlist to the library.
     * @remarks
     * Playlists that do not contain any media items cannot be added to the library by using this method. To create an empty playlist in the library, use the <b>newPlaylist</b> method. You can then fill the resulting playlist with media items by using <b>IWMPPlaylist::appendItem</b> or <b>IWMPPlaylist::insertItem</b>.
     * 
     * If you pass this method an auto playlist, the query is executed once and the result is added to the library as a static playlist. To add an auto playlist to the library and preserve its automatic behavior, use <b>IWMPMediaCollection::add</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/static-and-auto-playlists">Static and Auto Playlists</a>.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {IWMPPlaylist} pItem Pointer to an <b>IWMPPlaylist</b> interface for the playlist that this method will add.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface for the added playlist.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylistcollection-importplaylist
     */
    importPlaylist(pItem) {
        result := ComCall(13, this, "ptr", pItem, "ptr*", &ppImportedItem := 0, "HRESULT")
        return IWMPPlaylist(ppImportedItem)
    }

    Query(iid) {
        if (IWMPPlaylistCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.newPlaylist := CallbackCreate(GetMethod(implObj, "newPlaylist"), flags, 3)
        this.vtbl.getAll := CallbackCreate(GetMethod(implObj, "getAll"), flags, 2)
        this.vtbl.getByName := CallbackCreate(GetMethod(implObj, "getByName"), flags, 3)
        this.vtbl.remove := CallbackCreate(GetMethod(implObj, "remove"), flags, 2)
        this.vtbl.setDeleted := CallbackCreate(GetMethod(implObj, "setDeleted"), flags, 3)
        this.vtbl.isDeleted := CallbackCreate(GetMethod(implObj, "isDeleted"), flags, 3)
        this.vtbl.importPlaylist := CallbackCreate(GetMethod(implObj, "importPlaylist"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.newPlaylist)
        CallbackFree(this.vtbl.getAll)
        CallbackFree(this.vtbl.getByName)
        CallbackFree(this.vtbl.remove)
        CallbackFree(this.vtbl.setDeleted)
        CallbackFree(this.vtbl.isDeleted)
        CallbackFree(this.vtbl.importPlaylist)
    }
}
