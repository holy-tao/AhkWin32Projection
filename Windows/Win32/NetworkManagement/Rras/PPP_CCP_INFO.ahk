#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PPP_CCP_INFO structure contains information that describes the results of a Compression Control Protocol (CCP) negotiation.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-ppp_ccp_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PPP_CCP_INFO extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Specifies an error if the negotiation is unsuccessful.
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the compression algorithm used by the local computer. The following table shows the possible values for this member. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPCA_MPPC"></a><a id="rasccpca_mppc"></a><dl>
     * <dt><b>RASCCPCA_MPPC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Microsoft Point-to-Point Compression (MPPC) Protocol
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPCA_STAC"></a><a id="rasccpca_stac"></a><dl>
     * <dt><b>RASCCPCA_STAC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * STAC option 4
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwCompressionAlgorithm {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the compression options on the local computer. The following options are supported. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Option</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_COMPRESSION"></a><a id="ppp_ccp_compression"></a><dl>
     * <dt><b>PPP_CCP_COMPRESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Compression without encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_HISTORYLESS"></a><a id="ppp_ccp_historyless"></a><dl>
     * <dt><b>PPP_CCP_HISTORYLESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Microsoft Point-to-Point Encryption (MPPE) in stateless mode. The session key is changed after every packet. This mode improves performance on high latency networks, or networks that experience significant packet loss.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_ENCRYPTION40BITOLD"></a><a id="ppp_ccp_encryption40bitold"></a><dl>
     * <dt><b>PPP_CCP_ENCRYPTION40BITOLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE using 40-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_ENCRYPTION40BIT"></a><a id="ppp_ccp_encryption40bit"></a><dl>
     * <dt><b>PPP_CCP_ENCRYPTION40BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE using 40-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_ENCRYPTION56BIT"></a><a id="ppp_ccp_encryption56bit"></a><dl>
     * <dt><b>PPP_CCP_ENCRYPTION56BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE using 56-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_ENCRYPTION128BIT"></a><a id="ppp_ccp_encryption128bit"></a><dl>
     * <dt><b>PPP_CCP_ENCRYPTION128BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE using 128-bit keys.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the compression algorithm used by the remote computer. The following table shows the possible values for this member. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPCA_MPPC"></a><a id="rasccpca_mppc"></a><dl>
     * <dt><b>RASCCPCA_MPPC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Microsoft Point-to-Point Compression (MPPC) Protocol
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPCA_STAC"></a><a id="rasccpca_stac"></a><dl>
     * <dt><b>RASCCPCA_STAC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * STAC option 4
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwRemoteCompressionAlgorithm {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the compression options on the remote computer. The following options are supported. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Option</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_COMPRESSION"></a><a id="ppp_ccp_compression"></a><dl>
     * <dt><b>PPP_CCP_COMPRESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Compression without encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_HISTORYLESS"></a><a id="ppp_ccp_historyless"></a><dl>
     * <dt><b>PPP_CCP_HISTORYLESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Microsoft Point-to-Point Encryption (MPPE) in stateless mode. The session key is changed after every packet. This mode improves performance on high latency networks, or networks that experience significant packet loss.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_ENCRYPTION40BITOLD"></a><a id="ppp_ccp_encryption40bitold"></a><dl>
     * <dt><b>PPP_CCP_ENCRYPTION40BITOLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE using 40-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_ENCRYPTION40BIT"></a><a id="ppp_ccp_encryption40bit"></a><dl>
     * <dt><b>PPP_CCP_ENCRYPTION40BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE using 40-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_ENCRYPTION56BIT"></a><a id="ppp_ccp_encryption56bit"></a><dl>
     * <dt><b>PPP_CCP_ENCRYPTION56BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE using 56-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_ENCRYPTION128BIT"></a><a id="ppp_ccp_encryption128bit"></a><dl>
     * <dt><b>PPP_CCP_ENCRYPTION128BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE using 128-bit keys.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwRemoteOptions {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
