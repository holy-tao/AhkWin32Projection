#Requires AutoHotkey v2.0.0 64-bit

/**
 * Is used in the RAS_PROJECTION_INFO structure to represent either a RASPPP_PROJECTION_INFO or RASIKEV2_PROJECTION_INFO structure.
 * @see https://docs.microsoft.com/windows/win32/api//ras/ne-ras-rasprojection_info_type
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RASPROJECTION_INFO_TYPE{

    /**
     * Represents a <a href="https://docs.microsoft.com/windows/desktop/api/ras/ns-ras-rasppp_projection_info">RASPPP_PROJECTION_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static PROJECTION_INFO_TYPE_PPP => 1

    /**
     * Represents a <a href="https://docs.microsoft.com/windows/desktop/api/ras/ns-ras-rasikev2_projection_info">RASIKEV2_PROJECTION_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static PROJECTION_INFO_TYPE_IKEv2 => 2
}
