#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the protection level for DisplayPort Content Protection (DPCP).
 * @see https://docs.microsoft.com/windows/win32/api//opmapi/ne-opmapi-opm_dpcp_protection_level
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_DPCP_PROTECTION_LEVEL{

    /**
     * DPCP is disabled.
     * @type {Integer (Int32)}
     */
    static OPM_DPCP_OFF => 0

    /**
     * DPCP is enabled.
     * @type {Integer (Int32)}
     */
    static OPM_DPCP_ON => 1
}
