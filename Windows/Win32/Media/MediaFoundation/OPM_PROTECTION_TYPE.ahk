#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_PROTECTION_TYPE {
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
    static OPM_PROTECTION_TYPE_OTHER => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static OPM_PROTECTION_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static OPM_PROTECTION_TYPE_COPP_COMPATIBLE_HDCP => 1

    /**
     * @type {Integer (Int32)}
     */
    static OPM_PROTECTION_TYPE_ACP => 2

    /**
     * @type {Integer (Int32)}
     */
    static OPM_PROTECTION_TYPE_CGMSA => 4

    /**
     * @type {Integer (Int32)}
     */
    static OPM_PROTECTION_TYPE_HDCP => 8

    /**
     * @type {Integer (Int32)}
     */
    static OPM_PROTECTION_TYPE_DPCP => 16

    /**
     * @type {Integer (Int32)}
     */
    static OPM_PROTECTION_TYPE_TYPE_ENFORCEMENT_HDCP => 32
}
