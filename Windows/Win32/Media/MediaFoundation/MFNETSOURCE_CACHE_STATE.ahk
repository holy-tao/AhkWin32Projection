#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the status of the cache for a media file or entry.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfnetsource_cache_state
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFNETSOURCE_CACHE_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The cache for a file or entry does not exist.
     * @type {Integer (Int32)}
     */
    static MFNETSOURCE_CACHE_UNAVAILABLE => 0

    /**
     * The cache for a file or entry is growing.
     * @type {Integer (Int32)}
     */
    static MFNETSOURCE_CACHE_ACTIVE_WRITING => 1

    /**
     * The cache for a file or entry is completed.
     * @type {Integer (Int32)}
     */
    static MFNETSOURCE_CACHE_ACTIVE_COMPLETE => 2
}
