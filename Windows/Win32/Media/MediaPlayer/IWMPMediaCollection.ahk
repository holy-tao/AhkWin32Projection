#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPMedia.ahk
#Include .\IWMPPlaylist.ahk
#Include .\IWMPStringCollection.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPMediaCollection interface provides methods that can be used to organize a large collection of media items.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpmediacollection
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPMediaCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPMediaCollection
     * @type {Guid}
     */
    static IID => Guid("{8363bc22-b4b4-4b19-989d-1cd765749dd1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add", "getAll", "getByName", "getByGenre", "getByAuthor", "getByAlbum", "getByAttribute", "remove", "getAttributeStringCollection", "getMediaAtom", "setDeleted", "isDeleted"]

    /**
     * The add method adds a new media item or playlist to the library.
     * @remarks
     * This method loads an existing media item or playlist into the library, given a path. This method does not move or change the file. This method fails if given an invalid local path, but media items themselves are not checked for validity before they are added to the library.
     * 
     * This method accepts both static and auto playlist files. The <b>IWMPPlaylistCollection::importPlaylist</b> method can also be used to add a static playlist to the library.
     * 
     * Before calling this method, you must have full access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {BSTR} bstrURL String containing the URL that specifies the location of the media item or playlist.
     * @returns {IWMPMedia} Pointer to a pointer to the <b>IWMPMedia</b> interface for the added item or playlist.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-add
     */
    add(bstrURL) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(7, this, "ptr", bstrURL, "ptr*", &ppItem := 0, "HRESULT")
        return IWMPMedia(ppItem)
    }

    /**
     * The getAll method retrieves a pointer to an IWMPPlaylist interface. This interface corresponds to the playlist that contains all media items in the library.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * There are two ways you ways you can retrieve an <b>IWMPMediaCollection</b> interface, and the behavior of the <b>getAll</b> method depends on which of those two ways you use. If you retrieve the interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpcore-get_mediacollection">IWMPCore::get_mediaCollection</a>, then the <b>getAll</b> method returns all the media items in the library.If you retrieve the interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmplibrary-get_mediacollection">IWMPLibrary::get_mediaCollection</a>, then the <b>getAll</b> method returns only the audio items in the library.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface for the playlist that contains all of the requested media items.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getall
     */
    getAll() {
        result := ComCall(8, this, "ptr*", &ppMediaItems := 0, "HRESULT")
        return IWMPPlaylist(ppMediaItems)
    }

    /**
     * The getByName method retrieves a pointer to an IWMPPlaylist interface. This interface contains the media items with the specified name.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * There are two ways you ways you can retrieve an <b>IWMPMediaCollection</b> interface, and the behavior of the <b>getByName</b> method depends on which of those two ways you use. If you retrieve the interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpcore-get_mediacollection">IWMPCore::get_mediaCollection</a>, then the <b>getByName</b> method returns all the media items in the library that have the specified name. If you retrieve the interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmplibrary-get_mediacollection">IWMPLibrary::get_mediaCollection</a>, then the <b>getByName</b> method returns only the audio items in the library that have the specified name.
     * @param {BSTR} bstrName String containing the specified name.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface for the retrieved media items.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getbyname
     */
    getByName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, "ptr", bstrName, "ptr*", &ppMediaItems := 0, "HRESULT")
        return IWMPPlaylist(ppMediaItems)
    }

    /**
     * The getByGenre method retrieves a pointer to an IWMPPlaylist interface. This interface contains the media items with the specified genre.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * There are two ways you ways you can retrieve an <b>IWMPMediaCollection</b> interface, and the behavior of the <b>getByGenre</b> method depends on which of those two ways you use. If you retrieve the interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpcore-get_mediacollection">IWMPCore::get_mediaCollection</a>, then the <b>getByGenre</b> method returns all the media items in the library that belong to the specified genre. If you retrieve the interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmplibrary-get_mediacollection">IWMPLibrary::get_mediaCollection</a>, then the <b>getByGenre</b> method returns only the audio items in the library that belong to the specified genre.
     * @param {BSTR} bstrGenre String containing the genre.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface for the retrieved media items.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getbygenre
     */
    getByGenre(bstrGenre) {
        bstrGenre := bstrGenre is String ? BSTR.Alloc(bstrGenre).Value : bstrGenre

        result := ComCall(10, this, "ptr", bstrGenre, "ptr*", &ppMediaItems := 0, "HRESULT")
        return IWMPPlaylist(ppMediaItems)
    }

    /**
     * The getByAuthor method retrieves a pointer to an IWMPPlaylist interface. This interface contains the media items for the specified author.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * There are two ways you ways you can retrieve an <b>IWMPMediaCollection</b> interface, and the behavior of the <b>getByAuthor</b> method depends on which of those two ways you use. If you retrieve the interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpcore-get_mediacollection">IWMPCore::get_mediaCollection</a>, then the <b>getByAuthor</b> method returns all the media items in the library that have the specified author. If you retrieve the interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmplibrary-get_mediacollection">IWMPLibrary::get_mediaCollection</a>, then the <b>getByAuthor</b> method returns only the audio items in the library that have the specified author.
     * @param {BSTR} bstrAuthor String containing the specified author.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface for the retrieved media items.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getbyauthor
     */
    getByAuthor(bstrAuthor) {
        bstrAuthor := bstrAuthor is String ? BSTR.Alloc(bstrAuthor).Value : bstrAuthor

        result := ComCall(11, this, "ptr", bstrAuthor, "ptr*", &ppMediaItems := 0, "HRESULT")
        return IWMPPlaylist(ppMediaItems)
    }

    /**
     * The getByAlbum method retrieves a pointer to an IWMPPlaylist interface. This interface contains the media items from the specified album.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * There are two ways you ways you can retrieve an <b>IWMPMediaCollection</b> interface, and the behavior of the <b>getByAlbum</b> method depends on which of those two ways you use. If you retrieve the interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpcore-get_mediacollection">IWMPCore::get_mediaCollection</a>, then the <b>getByAlbum</b> method returns all the media items in the library that belong to the specified album. If you retrieve the interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmplibrary-get_mediacollection">IWMPLibrary::get_mediaCollection</a>, then the <b>getByAlbum</b> method returns only the audio items in the library that belong to the specified album.
     * @param {BSTR} bstrAlbum String containing the album.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface for the retrieved media items.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getbyalbum
     */
    getByAlbum(bstrAlbum) {
        bstrAlbum := bstrAlbum is String ? BSTR.Alloc(bstrAlbum).Value : bstrAlbum

        result := ComCall(12, this, "ptr", bstrAlbum, "ptr*", &ppMediaItems := 0, "HRESULT")
        return IWMPPlaylist(ppMediaItems)
    }

    /**
     * The getByAttribute method retrieves a pointer to an IWMPPlaylist interface. This interface corresponds to the specified attribute having the specified value.
     * @remarks
     * This method can be used to create a generic query for media items that match a value for an attribute in the database. This is useful in the case of user-defined attributes. If the attribute does not exist, an error will result.
     * 
     * You can use this method to retrieve all of the media items of a specific type. Use the attribute name "MediaType" and one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Value
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>audio</td>
     * <td>Music and other audio-only items</td>
     * </tr>
     * <tr>
     * <td>other</td>
     * <td>Other items, such as an .asf file or the URL of a stream.</td>
     * </tr>
     * <tr>
     * <td>photo</td>
     * <td>Photo items. Requires Windows Media Player 10.</td>
     * </tr>
     * <tr>
     * <td>playlist</td>
     * <td>Playlists represented as media items.</td>
     * </tr>
     * <tr>
     * <td>radio</td>
     * <td>Radio station items. Not used by Windows Media Player 10.</td>
     * </tr>
     * <tr>
     * <td>video</td>
     * <td>Video items.</td>
     * </tr>
     * </table>
     *  
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * There are two ways you ways you can retrieve an <b>IWMPMediaCollection</b> interface, and the behavior of the <b>getByAttribute</b> method depends on which of those two ways you use. If you retrieve the interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpcore-get_mediacollection">IWMPCore::get_mediaCollection</a>, then the <b>getByAttribute</b> method returns all the media items in the library that have the specified attribute and value. If you retrieve the interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmplibrary-get_mediacollection">IWMPLibrary::get_mediaCollection</a>, then the <b>getByAttribute</b> method returns only the audio items in the library that have the specified attribute and value.
     * @param {BSTR} bstrAttribute String containing the specified attribute.
     * @param {BSTR} bstrValue String containing the specified value.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface for the retrieved media items.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getbyattribute
     */
    getByAttribute(bstrAttribute, bstrValue) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(13, this, "ptr", bstrAttribute, "ptr", bstrValue, "ptr*", &ppMediaItems := 0, "HRESULT")
        return IWMPPlaylist(ppMediaItems)
    }

    /**
     * The remove method removes a specified item from the media collection.
     * @remarks
     * This method deletes an item from the library. This method does not delete files from the user's computer.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {IWMPMedia} pItem Pointer to an <b>IWMPMedia</b> interface that identifies the item to remove.
     * @param {VARIANT_BOOL} varfDeleteFile Specifies whether the method should remove the specified item.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-remove
     */
    remove(pItem, varfDeleteFile) {
        result := ComCall(14, this, "ptr", pItem, "short", varfDeleteFile, "HRESULT")
        return result
    }

    /**
     * The getAttributeStringCollection method retrieves a pointer to an IWMPStringCollection interface. This interface represents the set of all values for a given attribute within a given media type.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * For information about the attributes supported by Windows Media Player, see the <a href="https://docs.microsoft.com/windows/desktop/WMP/attribute-reference">Attribute Reference</a> section.
     * @param {BSTR} bstrAttribute String containing the attribute for which the values are retrieved.
     * @param {BSTR} bstrMediaType String containing the media type for which the values are retrieved.
     * @returns {IWMPStringCollection} Pointer to a pointer to an <b>IWMPStringCollection</b> interface for the retrieved values.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getattributestringcollection
     */
    getAttributeStringCollection(bstrAttribute, bstrMediaType) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrMediaType := bstrMediaType is String ? BSTR.Alloc(bstrMediaType).Value : bstrMediaType

        result := ComCall(15, this, "ptr", bstrAttribute, "ptr", bstrMediaType, "ptr*", &ppStringCollection := 0, "HRESULT")
        return IWMPStringCollection(ppStringCollection)
    }

    /**
     * The getMediaAtom method retrieves the index at which a given attribute resides within the set of available attributes.
     * @remarks
     * The index number retrieved with this method can be passed to the <b>IWMPMedia::getItemInfoByAtom</b> to access attribute values. This technique is generally more efficient when working with large playlists than accessing an attribute value by name through <b>IWMPMedia::getItemInfo</b>.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {BSTR} bstrItemName String containing the name of the item for which the index should be retrieved.
     * @param {Pointer<Integer>} plAtom Pointer to a <b>long</b> containing the index.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getmediaatom
     */
    getMediaAtom(bstrItemName, plAtom) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        plAtomMarshal := plAtom is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, "ptr", bstrItemName, plAtomMarshal, plAtom, "HRESULT")
        return result
    }

    /**
     * The setDeleted method moves the specified media item to the deleted items folder.
     * @remarks
     * This method does not remove files from the user's computer.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method always returns E_INVALIDARG.
     * @param {IWMPMedia} pItem Pointer to an <b>IWMPMedia</b> interface for the item to be moved.
     * @param {VARIANT_BOOL} varfIsDeleted Specifies whether the item should be moved. This value must always be true.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-setdeleted
     */
    setDeleted(pItem, varfIsDeleted) {
        result := ComCall(17, this, "ptr", pItem, "short", varfIsDeleted, "HRESULT")
        return result
    }

    /**
     * The IWMPMediaCollection interface provides methods that can be used to organize a large collection of media items.
     * @param {IWMPMedia} pItem 
     * @param {Pointer<VARIANT_BOOL>} pvarfIsDeleted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpmediacollection
     */
    isDeleted(pItem, pvarfIsDeleted) {
        pvarfIsDeletedMarshal := pvarfIsDeleted is VarRef ? "short*" : "ptr"

        result := ComCall(18, this, "ptr", pItem, pvarfIsDeletedMarshal, pvarfIsDeleted, "HRESULT")
        return result
    }
}
