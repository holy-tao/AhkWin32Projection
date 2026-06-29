#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the cache options used by the IThumbnailStreamCache interface.
 * @see https://learn.microsoft.com/windows/win32/api/thumbnailstreamcache/ne-thumbnailstreamcache-thumbnailstreamcacheoptions
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ThumbnailStreamCacheOptions {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Return the cached thumbnail if it is already cached, otherwise extract the thumbnail to the cache.
     * @type {Integer (Int32)}
     */
    static ExtractIfNotCached => 0

    /**
     * Return the thumbnail only if it is already cached.
     * @type {Integer (Int32)}
     */
    static ReturnOnlyIfCached => 1

    /**
     * Resize the thumbnail to match the requested size.
     * @type {Integer (Int32)}
     */
    static ResizeThumbnail => 2

    /**
     * Can return a cached thumbnail that is smaller than the requested size.
     * @type {Integer (Int32)}
     */
    static AllowSmallerSize => 4
}
