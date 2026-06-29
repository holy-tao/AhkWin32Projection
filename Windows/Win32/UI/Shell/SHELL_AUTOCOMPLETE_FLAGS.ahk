#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHELL_AUTOCOMPLETE_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
