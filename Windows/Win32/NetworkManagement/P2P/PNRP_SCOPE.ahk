#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PNRP_SCOPE {
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
    static PNRP_SCOPE_ANY => 0

    /**
     * @type {Integer (Int32)}
     */
    static PNRP_GLOBAL_SCOPE => 1

    /**
     * @type {Integer (Int32)}
     */
    static PNRP_SITE_LOCAL_SCOPE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PNRP_LINK_LOCAL_SCOPE => 3
}
