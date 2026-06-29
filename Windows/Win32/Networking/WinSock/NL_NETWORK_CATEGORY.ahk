#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct NL_NETWORK_CATEGORY {
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
    static NetworkCategoryPublic => 0

    /**
     * @type {Integer (Int32)}
     */
    static NetworkCategoryPrivate => 1

    /**
     * @type {Integer (Int32)}
     */
    static NetworkCategoryDomainAuthenticated => 2

    /**
     * @type {Integer (Int32)}
     */
    static NetworkCategoryUnchanged => -1

    /**
     * @type {Integer (Int32)}
     */
    static NetworkCategoryUnknown => -1
}
