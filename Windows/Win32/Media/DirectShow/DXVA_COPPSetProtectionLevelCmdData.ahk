#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data for the Set Protection Level command in Certified Output Protection Protocol (COPP).
 * @see https://docs.microsoft.com/windows/win32/api//dxva9typ/ns-dxva9typ-dxva_coppsetprotectionlevelcmddata
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DXVA_COPPSetProtectionLevelCmdData extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Identifies the protection mechanism. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/copp-protection-type-flags">COPP Protection Type Flags</a>.
     * @type {Integer}
     */
    ProtType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the protection level. The meaning of this value depends on the protection mechanism that is queried. For each protection mechanism, the value of the <c>ProtLevel</c> member is a flag from a different enumeration, as shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Protection mechanism</th>
     * <th>Enumeration</th>
     * </tr>
     * <tr>
     * <td>ACP</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_acp_protection_level">COPP_ACP_Protection_Level</a>
     * </td>
     * </tr>
     * <tr>
     * <td>CGMS-A</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_cgmsa_protection_level">COPP_CGMSA_Protection_Level</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HDCP</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_hdcp_protection_level">COPP_HDCP_Protection_Level</a>
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ProtLevel {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved. Must be zero.
     * @type {Integer}
     */
    ExtendedInfoChangeMask {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved. Must be zero.
     * @type {Integer}
     */
    ExtendedInfoData {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
