#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WFD_ROLE_TYPE {
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
    static WFD_ROLE_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WFD_ROLE_TYPE_DEVICE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WFD_ROLE_TYPE_GROUP_OWNER => 2

    /**
     * @type {Integer (Int32)}
     */
    static WFD_ROLE_TYPE_CLIENT => 4

    /**
     * @type {Integer (Int32)}
     */
    static WFD_ROLE_TYPE_MAX => 5
}
