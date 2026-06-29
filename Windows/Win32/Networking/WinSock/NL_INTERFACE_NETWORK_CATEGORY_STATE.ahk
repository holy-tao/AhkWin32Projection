#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct NL_INTERFACE_NETWORK_CATEGORY_STATE {
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
    static NlincCategoryUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static NlincPublic => 1

    /**
     * @type {Integer (Int32)}
     */
    static NlincPrivate => 2

    /**
     * @type {Integer (Int32)}
     */
    static NlincDomainAuthenticated => 3

    /**
     * @type {Integer (Int32)}
     */
    static NlincCategoryStateMax => 4
}
