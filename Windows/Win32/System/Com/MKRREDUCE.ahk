#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how far a moniker should be reduced.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-mkrreduce
 * @namespace Windows.Win32.System.Com
 */
export default struct MKRREDUCE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Performs only one step of reducing the moniker. In general, the caller must have specific knowledge about the particular kind of moniker to take advantage of this option.
     * @type {Integer (Int32)}
     */
    static MKRREDUCE_ONE => 196608

    /**
     * Reduces the moniker to a form that the user identifies as a persistent object. If no such point exists, then this option should be treated as MKRREDUCE_ALL.
     * @type {Integer (Int32)}
     */
    static MKRREDUCE_TOUSER => 131072

    /**
     * Reduces the moniker to where any further reduction would reduce it to a form that the user does not identify as a persistent object. Often, this is the same stage as MKRREDUCE_TOUSER.
     * @type {Integer (Int32)}
     */
    static MKRREDUCE_THROUGHUSER => 65536

    /**
     * Reduces the moniker until it is in its simplest form, that is, reduce it to itself.
     * @type {Integer (Int32)}
     */
    static MKRREDUCE_ALL => 0
}
