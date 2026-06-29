#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies what to do with caches that are to be discarded from memory if their dirty bit has been set.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-discardcache
 * @namespace Windows.Win32.System.Ole
 */
export default struct DISCARDCACHE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
