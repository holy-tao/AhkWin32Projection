#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PPP_LCP_INFO structure contains information that describes the results of an PPP Link Control Protocol (LCP) negotiation.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-ppp_lcp_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PPP_LCP_INFO extends Win32Struct
{
    static sizeof => 44

    static packingSize => 4

    /**
     * Specifies the error that occurred if the negotiation was unsuccessful.
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwAuthenticationProtocol {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    dwAuthenticationData {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the authentication protocol used to authenticate the remote computer. See the <b>dwAuthenticationProtocol</b> member for a list of possible values.
     * @type {Integer}
     */
    dwRemoteAuthenticationProtocol {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies additional information about the authentication protocol specified by <b>dwRemoteAuthenticationProtocol</b>. See the <b>dwAuthenticationData</b> member for a list of possible values.
     * @type {Integer}
     */
    dwRemoteAuthenticationData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the reason the connection was terminated by the local computer. This member always has a value of zero.
     * @type {Integer}
     */
    dwTerminateReason {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies the reason the connection was terminated by the remote computer. This member always has a value of zero.
     * @type {Integer}
     */
    dwRemoteTerminateReason {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

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
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

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
     * @type {Integer}
     */
    dwRemoteOptions {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Specifies the type identifier of the Extensible Authentication Protocol (EAP) used to authenticate the local computer. The value of this member is valid only if <b>dwAuthenticationProtocol</b> is PPP_LCP_EAP.
     * @type {Integer}
     */
    dwEapTypeId {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Specifies the type identifier of the Extensible Authentication Protocol (EAP) used to authenticate the remote computer. The value of this member is valid only if <b>dwRemoteAuthenticationProtocol</b> is PPP_LCP_EAP.
     * @type {Integer}
     */
    dwRemoteEapTypeId {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
