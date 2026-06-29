#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_TYPE_ENFORCEMENT_HDCP_PROTECTION_LEVEL {
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
    static OPM_TYPE_ENFORCEMENT_HDCP_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static OPM_TYPE_ENFORCEMENT_HDCP_ON_WITH_NO_TYPE_RESTRICTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static OPM_TYPE_ENFORCEMENT_HDCP_ON_WITH_TYPE1_RESTRICTION => 2
}
