#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies what to do with caches that are to be discarded from memory if their dirty bit has been set.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-discardcache
 * @namespace Windows.Win32.System.Ole
 */
class DISCARDCACHE extends Win32Enum {

    /**
     * The cache is to be saved to disk.
     * Native name: DISCARDCACHE_SAVEIFDIRTY
     * @type {Integer (Int32)}
     */
    static SAVEIFDIRTY => 0

    /**
     * The cache can be discarded without saving it.
     * Native name: DISCARDCACHE_NOSAVE
     * @type {Integer (Int32)}
     */
    static NOSAVE => 1
}
