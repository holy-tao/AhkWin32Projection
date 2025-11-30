#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies what to do with caches that are to be discarded from memory if their dirty bit has been set.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/ne-oleidl-discardcache
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class DISCARDCACHE extends Win32Enum{

    /**
     * The cache is to be saved to disk.
     * @type {Integer (Int32)}
     */
    static DISCARDCACHE_SAVEIFDIRTY => 0

    /**
     * The cache can be discarded without saving it.
     * @type {Integer (Int32)}
     */
    static DISCARDCACHE_NOSAVE => 1
}
