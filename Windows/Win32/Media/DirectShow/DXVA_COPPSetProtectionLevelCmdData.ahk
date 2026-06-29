#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains data for the Set Protection Level command in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ns-dxva9typ-dxva_coppsetprotectionlevelcmddata
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DXVA_COPPSetProtectionLevelCmdData {
    #StructPack 4

    /**
     * Identifies the protection mechanism. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/copp-protection-type-flags">COPP Protection Type Flags</a>.
     */
    ProtType : UInt32

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
     */
    ProtLevel : UInt32

    /**
     * Reserved. Must be zero.
     */
    ExtendedInfoChangeMask : UInt32

    /**
     * Reserved. Must be zero.
     */
    ExtendedInfoData : UInt32

}
