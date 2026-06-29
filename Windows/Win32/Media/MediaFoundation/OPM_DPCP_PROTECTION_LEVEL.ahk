#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the protection level for DisplayPort Content Protection (DPCP).
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ne-opmapi-opm_dpcp_protection_level
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_DPCP_PROTECTION_LEVEL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
