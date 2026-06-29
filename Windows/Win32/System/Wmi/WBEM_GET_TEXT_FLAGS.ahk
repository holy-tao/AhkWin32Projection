#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WBEM_GET_TEXT_FLAGS {
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
    static WBEMPATH_COMPRESSED => 1

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_GET_RELATIVE_ONLY => 2

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_GET_SERVER_TOO => 4

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_GET_SERVER_AND_NAMESPACE_ONLY => 8

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_GET_NAMESPACE_ONLY => 16

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_GET_ORIGINAL => 32
}
