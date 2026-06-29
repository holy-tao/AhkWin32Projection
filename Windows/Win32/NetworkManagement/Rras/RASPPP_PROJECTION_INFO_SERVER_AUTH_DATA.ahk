#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASPPP_PROJECTION_INFO_SERVER_AUTH_DATA {
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
    static RASLCPAD_CHAP_MD5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPAD_CHAP_MS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPAD_CHAP_MSV2 => 129
}
