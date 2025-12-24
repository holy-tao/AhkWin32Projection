#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for a system thumbnail cache that is shared across applications.
 * @remarks
 * 
 * The Thumbnail Cache API is designed to provide applications with a unified method to retrieve and cache thumbnails. In Windows XP, thumbnail caching is done on a per-folder basis, and the cache is maintained in a Thumbs.db file within each folder. While this approach provides spatial locality, it does not support previews and queries across folders. The thumbnail cache in Windows Vista addresses this shortcoming by providing a global cache.
 * 
 * To cache a thumbnail, an application must first obtain an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that represents the item for which a thumbnail will be obtained, and then pass the <b>IShellItem</b> to a call to <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailcache-getthumbnail">IThumbnailCache::GetThumbnail</a>. If the flags parameter to <b>IThumbnailCache::GetThumbnail</b> includes the flag WTS_EXTRACT, and the thumbnail is not already cached, a thumbnail will be extracted and placed in the cache. If the flag WTS_FORCEEXTRACTION is set, the cache is ignored and a new thumbnail is always extracted. See the <b>IThumbnailCache::GetThumbnail</b> topic for more details on the flags passed to <b>IThumbnailCache::GetThumbnail</b>.
 * 
 * If a thumbnail is not already in the cache, it will be automatically extracted 
 * from the source file using the existing implementation(s) of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iextractimage">IExtractImage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nn-thumbcache-ithumbnailprovider">IThumbnailProvider</a> that is registered on the operating system. Your application does not have to provide an implementation of the thumbnail extractor.
 * 
 * When <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailcache-getthumbnail">IThumbnailCache::GetThumbnail</a> returns, its <i>pThumbnailID</i> parameter receives a WTS_THUMBNAILID structure that contains the unique ID of the thumbnail. If this ID is saved, it can then be passed to <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailcache-getthumbnailbyid">IThumbnailCache::GetThumbnailByID</a> to retrieve the cached thumbnail. Alternatively, <b>IThumbnailCache::GetThumbnail</b> may be called with the WTS_CACHEONLY flag set. In this case, a thumbnail will be returned only if it is already cached. The disadvantage of using <b>IThumbnailCache::GetThumbnail</b> rather than <b>IThumbnailCache::GetThumbnailByID</b>, is that an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> must still be provided.
 * 
 * Multiple threads can be used to access the thumbnail cache to improve performance.
 * <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailcache-getthumbnail">IThumbnailCache::GetThumbnail</a> may be called on a higher priority thread with either the WTS_INCACHEONLY or the WTS_FASTEXTRACT flag set, so that cached thumbnails are retrieved immediately. Then if the image is not in the cache, or WTS_LOWQUALITY indicates the cached image was not of ideal quality, a lower priority thread may be used to call <b>IThumbnailCache::GetThumbnail</b> with the WTS_EXTRACT flag set, 
 * so that a thumbnail may be extracted.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//thumbcache/nn-thumbcache-ithumbnailcache
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IThumbnailCache extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IThumbnailCache
     * @type {Guid}
     */
    static IID => Guid("{f676c15d-596a-4ce2-8234-33996f445db1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetThumbnail", "GetThumbnailByID"]

    /**
     * Gets a cached thumbnail for a given Shell item.
     * @param {IShellItem} pShellItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the Shell item for which to retrieve a thumbnail.
     * @param {Integer} cxyRequestedThumbSize Type: <b>UINT</b>
     * 
     * The requested thumbnail size in pixels. The maximum value is 1024.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/ne-thumbcache-wts_flags">WTS_FLAGS</a></b>
     * 
     * A combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/ne-thumbcache-wts_flags">WTS_FLAGS</a> enumeration. See the Remarks section for rules and a list of possible combinations.
     * @param {Pointer<ISharedBitmap>} ppvThumb Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nn-thumbcache-isharedbitmap">ISharedBitmap</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nn-thumbcache-isharedbitmap">ISharedBitmap</a> pointer that, when this method returns successfully, receives the object used to access the thumbnail. This parameter may be <b>NULL</b>.
     * @param {Pointer<Integer>} pOutFlags Type: <b>WTS_CACHEFLAGS*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives a combination of the following flags from the WTS_CACHEFLAGS enumeration.
     * @param {Pointer<WTS_THUMBNAILID>} pThumbnailID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/ns-thumbcache-wts_thumbnailid">WTS_THUMBNAILID</a>*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives a unique ID for the returned thumbnail. This parameter may be <b>NULL</b>, in which case the thumbnail ID is discarded.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful or a standard COM error value otherwise, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WTS_E_FAILEDEXTRACTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Shell item does not support thumbnail extraction. For example, .exe or .lnk items.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WTS_E_EXTRACTIONTIMEDOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The extraction took longer than the maximum allowable time. The extraction was not completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WTS_E_SURROGATEUNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A surrogate process was not available to be used for the extraction process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WTS_E_FASTEXTRACTIONNOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The WTS_FASTEXTRACT flag was set, but fast extraction is not available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//thumbcache/nf-thumbcache-ithumbnailcache-getthumbnail
     */
    GetThumbnail(pShellItem, cxyRequestedThumbSize, flags, ppvThumb, pOutFlags, pThumbnailID) {
        pOutFlagsMarshal := pOutFlags is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pShellItem, "uint", cxyRequestedThumbSize, "int", flags, "ptr*", ppvThumb, pOutFlagsMarshal, pOutFlags, "ptr", pThumbnailID, "HRESULT")
        return result
    }

    /**
     * Gets a thumbnail from the thumbnail cache, given its ID.
     * @param {WTS_THUMBNAILID} thumbnailID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/ns-thumbcache-wts_thumbnailid">WTS_THUMBNAILID</a></b>
     * 
     * The ID of the thumbnail to retrieve. The ID is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailcache-getthumbnail">GetThumbnail</a>.
     * @param {Integer} cxyRequestedThumbSize Type: <b>UINT</b>
     * 
     * The requested thumbnail size in pixels. This value cannot be larger than 1024.
     * @param {Pointer<ISharedBitmap>} ppvThumb Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nn-thumbcache-isharedbitmap">ISharedBitmap</a>**</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nn-thumbcache-isharedbitmap">ISharedBitmap</a> interface pointer that, when this method returns successfully, receives the object for accessing the requested thumbnail. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pOutFlags Type: <b>WTS_CACHEFLAGS*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives a combination of the following flags. This value can be set to <b>NULL</b> if this information is not needed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WTS_E_FAILEDEXTRACTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Shell item does not support thumbnail extraction. For example, .exe or .lnk items.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WTS_E_EXTRACTIONTIMEDOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The extraction took longer than the maximum allowable time. The extraction was not completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WTS_E_SURROGATEUNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A surrogate process was not available to be used for the extraction process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WTS_E_FASTEXTRACTIONNOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The WTS_FASTEXTRACT flag was set, but fast extraction is not available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//thumbcache/nf-thumbcache-ithumbnailcache-getthumbnailbyid
     */
    GetThumbnailByID(thumbnailID, cxyRequestedThumbSize, ppvThumb, pOutFlags) {
        pOutFlagsMarshal := pOutFlags is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", thumbnailID, "uint", cxyRequestedThumbSize, "ptr*", ppvThumb, pOutFlagsMarshal, pOutFlags, "HRESULT")
        return result
    }
}
