#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PROP_INFO_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static PROP_INFO_NAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROP_INFO_TYPE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROP_INFO_VALUE => 4

    /**
     * @type {Integer (Int32)}
     */
    static PROP_INFO_FULLNAME => 32

    /**
     * @type {Integer (Int32)}
     */
    static PROP_INFO_ATTRIBUTES => 8

    /**
     * @type {Integer (Int32)}
     */
    static PROP_INFO_DEBUGPROP => 16

    /**
     * @type {Integer (Int32)}
     */
    static PROP_INFO_AUTOEXPAND => 134217728
}
