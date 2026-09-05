#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the protection level for DisplayPort Content Protection (DPCP).
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ne-opmapi-opm_dpcp_protection_level
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class OPM_DPCP_PROTECTION_LEVEL extends Win32Enum {

    /**
     * DPCP is disabled.
     * Native name: OPM_DPCP_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * DPCP is enabled.
     * Native name: OPM_DPCP_ON
     * @type {Integer (Int32)}
     */
    static ON => 1
}
