#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines protection levels for MFPROTECTION_ACP.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_opm_acp_protection_level
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_OPM_ACP_PROTECTION_LEVEL extends Win32Enum {

    /**
     * Specifies ACP is disabled.
     * Native name: MF_OPM_ACP_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * Specifies ACP is level one.
     * Native name: MF_OPM_ACP_LEVEL_ONE
     * @type {Integer (Int32)}
     */
    static ONE => 1

    /**
     * Specifies ACP is level two.
     * Native name: MF_OPM_ACP_LEVEL_TWO
     * @type {Integer (Int32)}
     */
    static TWO => 2

    /**
     * Specifies ACP is level three.
     * Native name: MF_OPM_ACP_LEVEL_THREE
     * @type {Integer (Int32)}
     */
    static THREE => 3
}
