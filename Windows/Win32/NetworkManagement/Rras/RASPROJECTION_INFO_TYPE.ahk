#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Is used in the RAS_PROJECTION_INFO structure to represent either a RASPPP_PROJECTION_INFO or RASIKEV2_PROJECTION_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/ras/ne-ras-rasprojection_info_type
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASPROJECTION_INFO_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
