#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WBEM_PATH_CREATE_FLAG {
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
    static WBEMPATH_CREATE_ACCEPT_RELATIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_CREATE_ACCEPT_ABSOLUTE => 2

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_CREATE_ACCEPT_ALL => 4

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_TREAT_SINGLE_IDENT_AS_NS => 8
}
