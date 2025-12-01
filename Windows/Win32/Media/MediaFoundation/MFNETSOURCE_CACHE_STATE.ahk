#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the status of the cache for a media file or entry.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfnetsource_cache_state
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFNETSOURCE_CACHE_STATE extends Win32Enum{

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
