#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_BEARER_KEY_TYPE_VERSION {
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
    static WS_SECURITY_BEARER_KEY_TYPE_VERSION_1_3_ORIGINAL_SPECIFICATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_BEARER_KEY_TYPE_VERSION_1_3_ORIGINAL_SCHEMA => 2

    /**
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_BEARER_KEY_TYPE_VERSION_1_3_ERRATA_01 => 3
}
