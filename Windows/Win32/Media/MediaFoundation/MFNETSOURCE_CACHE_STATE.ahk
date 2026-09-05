#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the status of the cache for a media file or entry.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfnetsource_cache_state
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFNETSOURCE_CACHE_STATE extends Win32Enum {

    /**
     * The cache for a file or entry does not exist.
     * Native name: MFNETSOURCE_CACHE_UNAVAILABLE
     * @type {Integer (Int32)}
     */
    static UNAVAILABLE => 0

    /**
     * The cache for a file or entry is growing.
     * Native name: MFNETSOURCE_CACHE_ACTIVE_WRITING
     * @type {Integer (Int32)}
     */
    static ACTIVE_WRITING => 1

    /**
     * The cache for a file or entry is completed.
     * Native name: MFNETSOURCE_CACHE_ACTIVE_COMPLETE
     * @type {Integer (Int32)}
     */
    static ACTIVE_COMPLETE => 2
}
