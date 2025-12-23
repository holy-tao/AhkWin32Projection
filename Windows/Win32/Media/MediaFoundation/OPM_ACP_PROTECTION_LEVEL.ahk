#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the protection level for Analog Copy Protection (ACP).
 * @remarks
 * This enumeration is numerically equivalent to the <b>COPP_ACP_Protection_Level</b> enumeration used in Certified Output Protection Protocol. The OPM_ACP_OFF flag corresponds to COPP_ACP_Level0.
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ne-opmapi-opm_acp_protection_level
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_ACP_PROTECTION_LEVEL extends Win32Enum{

    /**
     * ACP is disabled.
     * @type {Integer (Int32)}
     */
    static OPM_ACP_OFF => 0

    /**
     * ACP protection level 1.
     * @type {Integer (Int32)}
     */
    static OPM_ACP_LEVEL_ONE => 1

    /**
     * ACP protection level 2.
     * @type {Integer (Int32)}
     */
    static OPM_ACP_LEVEL_TWO => 2

    /**
     * ACP protection level 3.
     * @type {Integer (Int32)}
     */
    static OPM_ACP_LEVEL_THREE => 3
}
