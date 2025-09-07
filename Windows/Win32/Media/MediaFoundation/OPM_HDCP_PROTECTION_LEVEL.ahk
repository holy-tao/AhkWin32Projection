#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the protection level for High-Bandwidth Digital Content Protection (HDCP).
 * @remarks
 * This enumeration is numerically equivalent to the <b>COPP_HDCP_Protection_Level</b> enumeration used in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ne-opmapi-opm_hdcp_protection_level
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_HDCP_PROTECTION_LEVEL{

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
