#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods for a system thumbnail cache that is shared across applications.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api//content/thumbcache/nn-thumbcache-ithumbnailcache
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IThumb extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IThumb
     * @type {Guid}
     */
    static IID => Guid("{e8b2b281-0d6a-45cf-b333-2402b037f099}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsDragging", "add_DragStarted", "remove_DragStarted", "add_DragDelta", "remove_DragDelta", "add_DragCompleted", "remove_DragCompleted", "CancelDrag"]

    /**
     * @type {Boolean} 
     */
    IsDragging {
        get => this.get_IsDragging()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDragging() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {DragStartedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragStarted(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragStarted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DragDeltaEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragDelta(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragDelta(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DragCompletedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelDrag() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
