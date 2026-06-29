#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PPP_EAP_PACKET structure specifies information about a packet being processed by the authentication protocol.
 * @see https://learn.microsoft.com/windows/win32/api/raseapif/ns-raseapif-ppp_eap_packet
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct PPP_EAP_PACKET {
    #StructPack 1

    /**
     * Specifies the type of packet that is sent or received by the authentication protocol. This parameter is one of the four following values. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EAPCODE_Request"></a><a id="eapcode_request"></a><a id="EAPCODE_REQUEST"></a><dl>
     * <dt><b>EAPCODE_Request</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The packet is a request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EAPCODE_Response"></a><a id="eapcode_response"></a><a id="EAPCODE_RESPONSE"></a><dl>
     * <dt><b>EAPCODE_Response</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The packet is a response.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EAPCODE_Success"></a><a id="eapcode_success"></a><a id="EAPCODE_SUCCESS"></a><dl>
     * <dt><b>EAPCODE_Success</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The packet indicates success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EAPCODE_Failure"></a><a id="eapcode_failure"></a><a id="EAPCODE_FAILURE"></a><dl>
     * <dt><b>EAPCODE_Failure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The packet indicates failure.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Code : Int8

    /**
     * Specifies the identifier of the packet. The authentication protocol is responsible for maintaining packet counts for sessions, as that packet count pertains to EAP activity.
     */
    Id : Int8

    /**
     * Specifies the length of the packet.
     */
    Length : Int8[2]

    /**
     * Specifies the data transmitted by this packet. If the packet is a request or a response packet, the first byte of this member signifies its type. For more information about packet types and requirements for type reservation, refer to 
     * <a href="https://www.ietf.org/rfc/rfc2284.txt">RFC 2284</a>.
     */
    Data : Int8[1]

}
