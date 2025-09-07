#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data for the OPM_SET_PROTECTION_LEVEL command in Output Protection Manager (OPM).
 * @remarks
 * The layout of this structure is identical to the <a href="https://docs.microsoft.com/windows/win32/api/dxva9typ/ns-dxva9typ-dxva_coppsetprotectionlevelcmddata">DXVA_COPPSetProtectionLevelCmdData</a> structure used in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_set_protection_level_parameters
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_SET_PROTECTION_LEVEL_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * Identifies the protection mechanism. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/opm-protection-type-flags">OPM Protection Type Flags</a>.
     * @type {Integer}
     */
    ulProtectionType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the protection level. The meaning of this value depends on the protection mechanism that is queried. For each protection mechanism, the value is a flag from a different enumeration, as shown in the following table.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Protection mechanism</th>
     * <th>Enumeration</th>
     * </tr>
     * <tr>
     * <td>ACP</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/ne-opmapi-opm_acp_protection_level">OPM_ACP_PROTECTION_LEVEL</a>
     * </td>
     * </tr>
     * <tr>
     * <td>CGMS-A</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/cgms-a-protection-flags">CGMS-A Protection Flags</a>
     * </td>
     * </tr>
     * <tr>
     * <td>DPCP</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/ne-opmapi-opm_dpcp_protection_level">OPM_DPCP_PROTECTION_LEVEL</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HDCP</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/ne-opmapi-opm_hdcp_protection_level">OPM_HDCP_PROTECTION_LEVEL</a>
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ulProtectionLevel {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved for future use. Set to zero.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved for future use. Set to zero.
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
