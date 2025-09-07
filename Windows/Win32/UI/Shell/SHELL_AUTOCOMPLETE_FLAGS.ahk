#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHELL_AUTOCOMPLETE_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static SHACF_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHACF_FILESYSTEM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SHACF_URLALL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SHACF_URLHISTORY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SHACF_URLMRU => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SHACF_USETAB => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SHACF_FILESYS_ONLY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SHACF_FILESYS_DIRS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SHACF_VIRTUAL_NAMESPACE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SHACF_AUTOSUGGEST_FORCE_ON => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static SHACF_AUTOSUGGEST_FORCE_OFF => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static SHACF_AUTOAPPEND_FORCE_ON => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SHACF_AUTOAPPEND_FORCE_OFF => 2147483648
}
