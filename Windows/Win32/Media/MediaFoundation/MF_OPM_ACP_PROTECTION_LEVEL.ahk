#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines protection levels for MFPROTECTION_ACP.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mf_opm_acp_protection_level
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_OPM_ACP_PROTECTION_LEVEL{

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
