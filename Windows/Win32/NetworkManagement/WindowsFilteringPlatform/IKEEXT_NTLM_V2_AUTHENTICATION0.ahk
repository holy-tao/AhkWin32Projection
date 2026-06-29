#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information needed for Microsoft Windows NT LAN Manager (NTLM) V2 authentication.
 * @remarks
 * <b>IKEEXT_NTLM_V2_AUTHENTICATION0</b> is a specific implementation of IKEEXT_NTLM_V2_AUTHENTICATION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_ntlm_v2_authentication0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_NTLM_V2_AUTHENTICATION0 {
    #StructPack 4

    /**
     * Possible value:
     * 
     * <table>
     * <tr>
     * <th>NTLM authentication flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IKEEXT_NTLM_V2_AUTH_DONT_ACCEPT_EXPLICIT_CREDENTIALS"></a><a id="ikeext_ntlm_v2_auth_dont_accept_explicit_credentials"></a><dl>
     * <dt><b>IKEEXT_NTLM_V2_AUTH_DONT_ACCEPT_EXPLICIT_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Refuse connections if the peer is using explicit credentials.
     * 
     * </td>
     * </tr>
     * </table>
     */
    flags : UInt32

}
