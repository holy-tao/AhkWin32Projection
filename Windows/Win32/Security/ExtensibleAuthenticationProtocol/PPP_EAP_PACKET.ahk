#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PPP_EAP_PACKET structure specifies information about a packet being processed by the authentication protocol.
 * @see https://learn.microsoft.com/windows/win32/api/raseapif/ns-raseapif-ppp_eap_packet
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class PPP_EAP_PACKET extends Win32Struct
{
    static sizeof => 5

    static packingSize => 1

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
     * @type {Integer}
     */
    Code {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies the identifier of the packet. The authentication protocol is responsible for maintaining packet counts for sessions, as that packet count pertains to EAP activity.
     * @type {Integer}
     */
    Id {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Specifies the length of the packet.
     * @type {Array<Byte>}
     */
    Length{
        get {
            if(!this.HasProp("__LengthProxyArray"))
                this.__LengthProxyArray := Win32FixedArray(this.ptr + 2, 2, Primitive, "char")
            return this.__LengthProxyArray
        }
    }

    /**
     * Specifies the data transmitted by this packet. If the packet is a request or a response packet, the first byte of this member signifies its type. For more information about packet types and requirements for type reservation, refer to 
     * <a href="https://www.ietf.org/rfc/rfc2284.txt">RFC 2284</a>.
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
