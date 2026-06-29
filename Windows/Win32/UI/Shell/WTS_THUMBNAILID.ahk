#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a unique identifier for a thumbnail in the system thumbnail cache.
 * @remarks
 * A <b>WTS_THUMBNAILID</b> may be retrieved from <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailcache-getthumbnail">IThumbnailCache::GetThumbnail</a> when a new thumbnail is cached. To access the cached thumbnail by its ID, the <b>WTS_THUMBNAILID</b> may then be passed to <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailcache-getthumbnailbyid">IThumbnailCache::GetThumbnailByID</a>.
 * @see https://learn.microsoft.com/windows/win32/api/thumbcache/ns-thumbcache-wts_thumbnailid
 * @namespace Windows.Win32.UI.Shell
 */
export default struct WTS_THUMBNAILID {
    #StructPack 1

    /**
     * Type: <b>BYTE[16]</b>
     * 
     * An array of 16 bytes that make up a unique identifier for a thumbnail in the system thumbnail cache.
     */
    rgbKey : Int8[16]

}
