#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PPP_LCP.ahk" { PPP_LCP }
#Import ".\PPP_LCP_INFO_AUTH_DATA.ahk" { PPP_LCP_INFO_AUTH_DATA }

/**
 * The PPP_LCP_INFO structure contains information that describes the results of a PPP Link Control Protocol (LCP) negotiation.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ppp_lcp_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PPP_LCP_INFO {
    #StructPack 4

    /**
     * Specifies the error that occurred if the negotiation was unsuccessful.
     */
    dwError : UInt32

    dwAuthenticationProtocol : PPP_LCP

    dwAuthenticationData : PPP_LCP_INFO_AUTH_DATA

    /**
     * Specifies the authentication protocol used to authenticate the remote computer. See the <b>dwAuthenticationProtocol</b> member for a list of possible values.
     */
    dwRemoteAuthenticationProtocol : UInt32

    /**
     * Specifies additional information about the authentication protocol specified by <b>dwRemoteAuthenticationProtocol</b>. See the <b>dwAuthenticationData</b> member for a list of possible values.
     */
    dwRemoteAuthenticationData : UInt32

    /**
     * Specifies the reason the connection was terminated by the local computer. This member always has a value of zero.
     */
    dwTerminateReason : UInt32

    /**
     * Specifies the reason the connection was terminated by the remote computer. This member always has a value of zero.
     */
    dwRemoteTerminateReason : UInt32

    /**
     * Specifies information about LCP options in use by the local computer. This member is a combination of the following flags. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_MULTILINK_FRAMING"></a><a id="ppp_lcp_multilink_framing"></a><dl>
     * <dt><b>PPP_LCP_MULTILINK_FRAMING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using multilink
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_PFC"></a><a id="raslcpo_pfc"></a><dl>
     * <dt><b>RASLCPO_PFC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Protocol Field Compression (see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-request-for-comments">RFC 1172</a>)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_ACFC"></a><a id="raslcpo_acfc"></a><dl>
     * <dt><b>RASLCPO_ACFC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Address and Control Field Compression (see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-request-for-comments">RFC 1172</a>)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_SSHF"></a><a id="raslcpo_sshf"></a><dl>
     * <dt><b>RASLCPO_SSHF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Short Sequence Number Header Format (see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-request-for-comments">RFC 1990</a>)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_DES_56"></a><a id="raslcpo_des_56"></a><dl>
     * <dt><b>RASLCPO_DES_56</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DES 56-bit encryption
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_3_DES"></a><a id="raslcpo_3_des"></a><dl>
     * <dt><b>RASLCPO_3_DES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Triple DES Encryption
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwOptions : UInt32

    /**
     * Specifies information about LCP options in use by the remote computer. This member is a combination of the following flags. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_MULTILINK_FRAMING"></a><a id="ppp_lcp_multilink_framing"></a><dl>
     * <dt><b>PPP_LCP_MULTILINK_FRAMING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using multilink.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_PFC"></a><a id="raslcpo_pfc"></a><dl>
     * <dt><b>RASLCPO_PFC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Protocol Field Compression (see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-request-for-comments">RFC 1172</a>)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_ACFC"></a><a id="raslcpo_acfc"></a><dl>
     * <dt><b>RASLCPO_ACFC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Address and Control Field Compression (see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-request-for-comments">RFC 1172</a>)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_SSHF"></a><a id="raslcpo_sshf"></a><dl>
     * <dt><b>RASLCPO_SSHF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Short Sequence Number Header Format (see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-request-for-comments">RFC 1990</a>)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_DES_56"></a><a id="raslcpo_des_56"></a><dl>
     * <dt><b>RASLCPO_DES_56</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DES 56-bit encryption
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_3_DES"></a><a id="raslcpo_3_des"></a><dl>
     * <dt><b>RASLCPO_3_DES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Triple DES Encryption
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwRemoteOptions : UInt32

    /**
     * Specifies the type identifier of the Extensible Authentication Protocol (EAP) used to authenticate the local computer. The value of this member is valid only if <b>dwAuthenticationProtocol</b> is PPP_LCP_EAP.
     */
    dwEapTypeId : UInt32

    /**
     * Specifies the type identifier of the Extensible Authentication Protocol (EAP) used to authenticate the remote computer. The value of this member is valid only if <b>dwRemoteAuthenticationProtocol</b> is PPP_LCP_EAP.
     */
    dwRemoteEapTypeId : UInt32

}
