#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines protection levels for MFPROTECTION_ACP.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_opm_acp_protection_level
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_OPM_ACP_PROTECTION_LEVEL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies ACP is disabled.
     * @type {Integer (Int32)}
     */
    static MF_OPM_ACP_OFF => 0

    /**
     * Specifies ACP is level one.
     * @type {Integer (Int32)}
     */
    static MF_OPM_ACP_LEVEL_ONE => 1

    /**
     * Specifies ACP is level two.
     * @type {Integer (Int32)}
     */
    static MF_OPM_ACP_LEVEL_TWO => 2

    /**
     * Specifies ACP is level three.
     * @type {Integer (Int32)}
     */
    static MF_OPM_ACP_LEVEL_THREE => 3
}
