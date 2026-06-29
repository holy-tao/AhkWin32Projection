#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the protection level for High-Bandwidth Digital Content Protection (HDCP).
 * @remarks
 * This enumeration is numerically equivalent to the <b>COPP_HDCP_Protection_Level</b> enumeration used in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ne-opmapi-opm_hdcp_protection_level
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_HDCP_PROTECTION_LEVEL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * HDCP is disabled.
     * @type {Integer (Int32)}
     */
    static OPM_HDCP_OFF => 0

    /**
     * HDCP is enabled.
     * @type {Integer (Int32)}
     */
    static OPM_HDCP_ON => 1
}
