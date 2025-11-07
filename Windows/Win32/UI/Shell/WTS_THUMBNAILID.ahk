#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a unique identifier for a thumbnail in the system thumbnail cache.
 * @remarks
 * 
 * A <b>WTS_THUMBNAILID</b> may be retrieved from <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailcache-getthumbnail">IThumbnailCache::GetThumbnail</a> when a new thumbnail is cached. To access the cached thumbnail by its ID, the <b>WTS_THUMBNAILID</b> may then be passed to <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailcache-getthumbnailbyid">IThumbnailCache::GetThumbnailByID</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//thumbcache/ns-thumbcache-wts_thumbnailid
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class WTS_THUMBNAILID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * Type: <b>BYTE[16]</b>
     * 
     * An array of 16 bytes that make up a unique identifier for a thumbnail in the system thumbnail cache.
     * @type {Array<Byte>}
     */
    rgbKey{
        get {
            if(!this.HasProp("__rgbKeyProxyArray"))
                this.__rgbKeyProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__rgbKeyProxyArray
        }
    }
}
