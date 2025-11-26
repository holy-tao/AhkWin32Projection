#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets or sets the thumbnail stream. This interface is for internal use only and can only be called by the photos application.
 * @see https://docs.microsoft.com/windows/win32/api//thumbnailstreamcache/nn-thumbnailstreamcache-ithumbnailstreamcache
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IThumbnailStreamCache extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IThumbnailStreamCache
     * @type {Guid}
     */
    static IID => Guid("{90e11430-9569-41d8-ae75-6d4d2ae7cca0}")

    /**
     * The class identifier for ThumbnailStreamCache
     * @type {Guid}
     */
    static CLSID => Guid("{cbe0fed3-4b91-4e90-8354-8a8c84ec6872}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetThumbnailStream", "SetThumbnailStream"]

    /**
     * Gets the thumbnail stream. This method is for internal use only and can only be called by the photos application.
     * @param {PWSTR} path The path to the thumbnail.
     * @param {Integer} cacheId The identifier of the thumbnail.
     * @param {Integer} options The cache options for the thumbnail stream.
     * @param {Integer} requestedThumbnailSize The requested size of the thumbnail.
     * @param {Pointer<SIZE>} thumbnailSize The actual size of the returned thumbnail.
     * @param {Pointer<IStream>} thumbnailStream The requested thumbnail.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//thumbnailstreamcache/nf-thumbnailstreamcache-ithumbnailstreamcache-getthumbnailstream
     */
    GetThumbnailStream(path, cacheId, options, requestedThumbnailSize, thumbnailSize, thumbnailStream) {
        path := path is String ? StrPtr(path) : path

        result := ComCall(3, this, "ptr", path, "uint", cacheId, "int", options, "uint", requestedThumbnailSize, "ptr", thumbnailSize, "ptr*", thumbnailStream, "HRESULT")
        return result
    }

    /**
     * Sets the thumbnail stream. This method is for internal use only and can only be called by the photos application.
     * @param {PWSTR} path The path to the thumbnail.
     * @param {Integer} cacheId The identifier of the thumbnail.
     * @param {SIZE} thumbnailSize The size of the thumbnail.
     * @param {IStream} thumbnailStream The pointer to the thumbnail stream.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//thumbnailstreamcache/nf-thumbnailstreamcache-ithumbnailstreamcache-setthumbnailstream
     */
    SetThumbnailStream(path, cacheId, thumbnailSize, thumbnailStream) {
        path := path is String ? StrPtr(path) : path

        result := ComCall(4, this, "ptr", path, "uint", cacheId, "ptr", thumbnailSize, "ptr", thumbnailStream, "HRESULT")
        return result
    }
}
