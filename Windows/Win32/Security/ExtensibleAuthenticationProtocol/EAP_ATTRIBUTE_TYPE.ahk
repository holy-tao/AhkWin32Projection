#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of possible EAP attribute types available on an authenticating entity.
 * @see https://docs.microsoft.com/windows/win32/api//eaptypes/ne-eaptypes-eap_attribute_type
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_ATTRIBUTE_TYPE{

    /**
     * Specifies a value equal to zero, and used as the <b>NULL</b> terminator in any array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> structures. 
 * 
 * This attribute type is consumed by PPP client supplicants.
     * @type {Integer (Int32)}
     */
    static eatMinimum => 0

    /**
     * Specifies the name of the user to be authenticated. This attribute type is also used when the user's password is changed. For Routing and Remote Access Service (RRAS) authentication sessions, the identity string (name) of the authenticating user is sent to IAS as part of the request attributes. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a multi-byte string with no NULL termination character. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
 * 
 * This attribute type is exported  by MS-CHAPv2 methods and by PEAP methods. It is consumed by PPP server supplicants.
     * @type {Integer (Int32)}
     */
    static eatUserName => 1

    /**
     * Specifies the password of the user to be authenticated. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatUserPassword => 2

    /**
     * Specifies the password provided by the user in response to an MD5 Challenge Handshake Authentication Protocol (CHAP) challenge. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatMD5CHAPPassword => 3

    /**
     * Specifies the IP address of the Network Access Server (NAS) that is requesting user authentication. An Access-Request should specify either an NAS IP address or an NAS identifier. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatNASIPAddress => 4

    /**
     * Specifies the physical or virtual private network (VPN) through which the user is connecting to the NAS. Note that this value is not a port number in the sense of TCP or UDP. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatNASPort => 5

    /**
     * Specifies the type of service the user has requested or the type of service to be provided. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatServiceType => 6

    /**
     * Specifies the type of framed protocol to use for framed access, for example SLIP, PPP, or ARAP (AppleTalk Remote Access Protocol). The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatFramedProtocol => 7

    /**
     * Specifies the IP address that is configured for the user requesting authentication. This attribute is typically returned by the authentication provider. However, the NAS may use it in an authentication request to specify a preferred IP address. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatFramedIPAddress => 8

    /**
     * Specifies the IP network mask for a user that is a router to a network. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatFramedIPNetmask => 9

    /**
     * Specifies the routing method for a user that is a router to a network. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatFramedRouting => 10

    /**
     * Specifies the name of the filter list for the user requesting authentication. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatFilterId => 11

    /**
     * Specifies the Maximum Transmission Unit (MTU) for the user. This attribute is used in cases where the MTU is not negotiated through some other means, such as PPP. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatFramedMTU => 12

    /**
     * Specifies a compression protocol to use for the connection. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatFramedCompression => 13

    /**
     * Specifies the system with which to connect the user. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatLoginIPHost => 14

    /**
     * Specifies the service to use to connect the user to the host specified by <b>eatLoginIPHost</b>. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatLoginService => 15

    /**
     * Specifies the port to which to connect the user. This attribute is present only if the <b>eatLoginService</b> attribute is present. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatLoginTCPPort => 16

    /**
     * This value is currently unassigned.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatUnassigned17 => 17

    /**
     * Specifies a message to display to the user. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
 * 
 * This attribute type consumed by the PPP server supplicant. This attribute type should not be used by any other method or supplicant. <b>eatEAPMessage</b> should be used to sent displayable messages whenever possible. For more information, see <a href="https://www.ietf.org/rfc/rfc3580.txt">RFC 3580</a>.
     * @type {Integer (Int32)}
     */
    static eatReplyMessage => 18

    /**
     * Specifies a callback number. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatCallbackNumber => 19

    /**
     * Specifies a location to call back. The value of this attribute is interpreted by the NAS. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatCallbackId => 20

    /**
     * This value is currently unassigned.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatUnassigned21 => 21

    /**
     * Specifies routing information to configure on the NAS for the user. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>. 
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatFramedRoute => 22

    /**
     * Specifies the IPX network number to configure for the user. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>. 
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatFramedIPXNetwork => 23

    /**
     * Specifies state information provided to the client by the server. For RRAS authentication sessions, if authentication completed successfully and IAS returned attributes, then this state information is saved and used as input when constructing the request attributes for IAS during the next packet cycle.  The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. Refer to 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for detailed information about this value. 
 * 
 * This attribute type is consumed by PPP server supplicants.
     * @type {Integer (Int32)}
     */
    static eatState => 24

    /**
     * Specifies a value that is provided to the NAS by the authentication provider. The NAS should use this value when communicating with the accounting provider. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatClass => 25

    /**
     * Specifies a field for vendor-supplied extended attributes. 
 * 
 * This field is used to store Microsoft Point-to-Point Encryption (MPPE) keys consumed by the <a href="https://docs.microsoft.com/previous-versions/windows/embedded/ms890287(v=msdn.10)">802.1X</a> supplicant. For more information, see <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
 * 
 * The following table shows the structure of the data pointed to by the <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type. 
 * 
 * <table>
 * <tr>
 * <th>First Byte</th>
 * <th>Last Byte </th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>0</td>
 * <td>3</td>
 * <td>Length: 4 bytesThe vendor identifier. This field always has a value of 311.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>4</td>
 * <td>4</td>
 * <td>Length: 1 byteThe type of MPPE key. If the attribute refers to a MPPE send key, then this field has a value of 16. If the attribute refers to a MPPE receive key, then this field has a value of 17. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>5</td>
 * <td>5</td>
 * <td>Length: 1 byteThe MPPE vendor-specific attribute length. This field always has a value of 52.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>6</td>
 * <td>7</td>
 * <td>Length: 2 bytesSalt. This field always has a value of 0.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>8</td>
 * <td>8</td>
 * <td>Length: 1 byteThe MPPE key length. This field always has a value of 32.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>9</td>
 * <td>40</td>
 * <td>Length: 32 bytesThe MPPE key. The field contents are as follows:<ul>
 * <li>For MPPE send keys   used on a client, this field contains the first 32 bytes (bytes 0-31) of the master session key (MSK). </li>
 * <li>For MPPE send keys used on a server, this field contains the second 32 bytes (bytes 32-63) of the MSK.</li>
 * <li>For MPPE receive keys   used on a client, this field contains the second 32 bytes (bytes 32-63) of the MSK. </li>
 * <li>For MPPE receive keys used on a server, this field contains the first 32 bytes (bytes 0-31) of the MSK.</li>
 * </ul>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>41</td>
 * <td>55</td>
 * <td>Length: 15 bytesPadding.
 * 
 * </td>
 * </tr>
 * </table>
 * 
 * This attribute type is consumed by 802.1X supplicants.
     * @type {Integer (Int32)}
     */
    static eatVendorSpecific => 26

    /**
     * Specifies the maximum number of seconds for which to provide service to the user. After this time, the session is terminated.  The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
 * 
 * This attribute type is typically used by EAP methods to set the timeout duration for authentication within an Access-Challenge packet. The duration of the timeout is determined by IAS, not the EAP method. 
 * 
 * For RRAS authentication sessions, if authentication succeeded and there is a pending packet to be sent, the packet is sent with an interactive timeout if the corresponding <b>eatSessionTimeout</b> value is greater than 10.
 * 
 * This attribute type is consumed by PPP server supplicants.
     * @type {Integer (Int32)}
     */
    static eatSessionTimeout => 27

    /**
     * Specifies the maximum number of consecutive seconds the session can be idle. If the idle time exceeds this value, the session is terminated. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>. 
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatIdleTimeout => 28

    /**
     * Specifies an action the server performs when time the connection terminates. Refer to the above-referenced files for detailed information about this value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatTerminationAction => 29

    /**
     * Specifies the phone number called using Dialed Number Identification (DNIS) or similar technology. The phone number called by the user may be different than the phone number from which the call originated. This attribute type may also be used to store other types of information, such as MAC addresses. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see <a href="https://www.ietf.org/rfc/rfc3580.txt">RFC 3580</a>.
     * @type {Integer (Int32)}
     */
    static eatCalledStationId => 30

    /**
     * Specifies the originating phone number for a call, using Automatic Number Identification (ANI) or similar technology. This attribute type may also be used to store other types of information, such as MAC addresses. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see <a href="https://www.ietf.org/rfc/rfc3580.txt">RFC 3580</a>.
     * @type {Integer (Int32)}
     */
    static eatCallingStationId => 31

    /**
     * Specifies the NAS identifier. An Access-Request should specify either an NAS identifier or an NAS IP address. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatNASIdentifier => 32

    /**
     * Specifies a value that a proxy server includes when forwarding an authentication request. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatProxyState => 33

    /**
     * Not used. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatLoginLATService => 34

    /**
     * Not used. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatLoginLATNode => 35

    /**
     * Not used. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatLoginLATGroup => 36

    /**
     * Specifies the AppleTalk network number for the user when the user is another router. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatFramedAppleTalkLink => 37

    /**
     * Specifies the AppleTalk network number that the NAS should use to allocate an AppleTalk node for the user. This attribute is used only when the user is not another router. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatFramedAppleTalkNetwork => 38

    /**
     * Specifies the AppleTalk default zone for the user. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatFramedAppleTalkZone => 39

    /**
     * Specifies whether the accounting provider should start or stop accounting for the user. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatAcctStatusType => 40

    /**
     * Specifies the length of time that the client has been attempting to send the current request. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatAcctDelayTime => 41

    /**
     * Specifies the number of octets that have been received during the current accounting session. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatAcctInputOctets => 42

    /**
     * Specifies the number of octets that were sent during the current accounting session. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatAcctOutputOctets => 43

    /**
     * Specifies a value to enable the identification of matching start and stop records within a log file. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatAcctSessionId => 44

    /**
     * Specifies, to the accounting provider, how the user was authenticated; for example by Directory Services, RADIUS, or some other authentication provider. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatAcctAuthentic => 45

    /**
     * Specifies the number of seconds that have elapsed in the current accounting session. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatAcctSessionTime => 46

    /**
     * Specifies the number of packets that have been received during the current accounting session. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatAcctInputPackets => 47

    /**
     * Specifies the number of packets that have been sent during the current accounting session.  For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatAcctOutputPackets => 48

    /**
     * Specifies how the current accounting session was terminated. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatAcctTerminateCause => 49

    /**
     * Specifies a value to enable the identification of related accounting sessions within a log file. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatAcctMultiSessionId => 50

    /**
     * Specifies the number of links if the current accounting session is using a multilink connection. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatAcctLinkCount => 51

    /**
     * Specifies an attribute that is included in an accounting request packet. It specifies the time that the event took place. For more information, see <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatAcctEventTimeStamp => 55

    /**
     * Specifies the CHAP challenge sent by the NAS to a CHAP user. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatMD5CHAPChallenge => 60

    /**
     * Specifies the type of the port through which NAS is authenticating the user, for example, asynchronous, ISDN, virtual. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatNASPortType => 61

    /**
     * Specifies the number of ports the NAS should make available to the user for multilink sessions. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatPortLimit => 62

    /**
     * Not used. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static eatLoginLATPort => 63

    /**
     * Specifies the tunneling protocol used. 
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatTunnelType => 64

    /**
     * Specifies which transport medium to use when creating a tunnel for those protocols (such as L2TP) that can operate over multiple transports. 
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatTunnelMediumType => 65

    /**
     * Points to the address of the initiator end of the tunnel.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatTunnelClientEndpoint => 66

    /**
     * Points to the address of the server end of the tunnel.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatTunnelServerEndpoint => 67

    /**
     * Specifies a password to use for AppleTalk Remote Access Protocol (ARAP) authentication. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatARAPPassword => 70

    /**
     * Specifies information that an NAS should send back to the user in an ARAP "feature flags" packet. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatARAPFeatures => 71

    /**
     * Specifies how to use the ARAP zone list for the user. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatARAPZoneAccess => 72

    /**
     * Specifies an ARAP security module to use during a secondary authentication phase between the NAS and the user. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatARAPSecurity => 73

    /**
     * Specifies the data to use with an ARAP security module. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatARAPSecurityData => 74

    /**
     * Specifies the number of password retry attempts to permit the user access. This attribute type is deprecated for EAP and RADIUS/EAP. For more information, see <a href="https://www.ietf.org/rfc/rfc3579.txt">RFC 3579</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatPasswordRetry => 75

    /**
     * Specifies whether the NAS should echo the user response to a challenge. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatPrompt => 76

    /**
     * Specifies information about the type of connection the user is using. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatConnectInfo => 77

    /**
     * Specifies user-profile information in communications between RADIUS Proxy Servers and RADIUS Proxy Clients. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatConfigurationToken => 78

    /**
     * Specifies that EAP information be sent directly between the user and the authentication provider. For RRAS authentication sessions, this attribute type is used to retrieve the EAP message from the authenticator and send the message to the  client. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
 * 
 * This attribute type is consumed by PPP server supplicants.
     * @type {Integer (Int32)}
     */
    static eatEAPMessage => 79

    /**
     * Specifies a signature to include with CHAP, EAP, or ARAP packets. For more information, 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatSignature => 80

    /**
     * Specifies the response to a Apple Remote Access Protocol (ARAP) challenge. In ARAP, either the server or the client may respond to challenges. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatARAPChallengeResponse => 84

    /**
     * Specifies the time, in seconds, between accounting updates. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatAcctInterimInterval => 85

    /**
     * The IPv6 address of the NAS requesting user authentication. This address should be unique to the NAS within the scope of the RADIUS server. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a>.
     * @type {Integer (Int32)}
     */
    static eatNASIPv6Address => 95

    /**
     * The IPv6 interface identifier to be configured for the user. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a>.
     * @type {Integer (Int32)}
     */
    static eatFramedInterfaceId => 96

    /**
     * The IPv6 prefix (and corresponding route) to be configured for the user. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string. For more information, see <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a>.
     * @type {Integer (Int32)}
     */
    static eatFramedIPv6Prefix => 97

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static eatLoginIPv6Host => 98

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static eatFramedIPv6Route => 99

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static eatFramedIPv6Pool => 100

    /**
     * Specifies a Apple Remote Access Protocol (ARAP) guest logon. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
 * 
 * This attribute type is not used by EAPHost methods or supplicants.
     * @type {Integer (Int32)}
     */
    static eatARAPGuestLogon => 8096

    /**
     * The object identifier (OID) present on the certificate. This attribute type is used in certificate-based authentication sessions. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string.  
 * 
 * This attribute type is exported  by EAP-TLS and NPS methods.
     * @type {Integer (Int32)}
     */
    static eatCertificateOID => 8097

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static eatEAPConfiguration => 8098

    /**
     * The identifier of the inner EAP method used in PEAP authentication.  The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a DWORD.  Only the least significant byte of the DWORD is meaningful. 
 * 
 * This attribute type is exported  by PEAP methods and is not consumed by any supplicant.
     * @type {Integer (Int32)}
     */
    static eatPEAPEmbeddedEAPTypeId => 8099

    /**
     * Specifies whether PEAP fast reconnect is used by the authenticator.  The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a DWORD.  If  <b>pValue</b> points to 0, then fast reconnect is not used by the authenticator. If <b>pValue</b> points to a nonzero value, then fast reconnect is used by the authenticator.
 * 
 * This attribute type is exported  by PEAP methods and consumed by PPP client supplicants.
     * @type {Integer (Int32)}
     */
    static eatPEAPFastRoamedSession => 8100

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static eatFastRoamedSession => 8100

    /**
     * An EAP-TLV attribute. This attribute type is used to handle statement of health (SoH) requests and SoH responses from the server. 
 * 
 * The following table shows the structure of the data pointed to by the <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type. 
 * 
 * <table>
 * <tr>
 * <th>First Byte</th>
 * <th>Last Byte </th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>0</td>
 * <td>1</td>
 * <td>Length: 2 bytesThe buffer type. This field always has a value of 7. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>2</td>
 * <td>3</td>
 * <td>Length: 2 bytesThe length of the remaining contents of the buffer. For SoH requests from the server, this field has a value of 6. For SoH responses from the server, calculate the length by adding 8 to the number of bytes in the SoH payload.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>4</td>
 * <td>7</td>
 * <td>Length: 4 bytesThe vendor identifier. This field always has a value of 311.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>8</td>
 * <td>9</td>
 * <td>Length: 2 bytesThe SoH type. For SoH requests from the server, this field has a value of 2. For SoH responses from the server, this field has a value of 3. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>10</td>
 * <td>11</td>
 * <td>Length: 2 bytesThe number of bytes of data in the SoH payload.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>12</td>
 * <td></td>
 * <td>Length: VariableThe SoH payload returned by the NAP system. The supplicant should not attempt to interpret this data.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * This attribute type is consumed by PPP client supplicants and by EAPHost supplicants.
     * @type {Integer (Int32)}
     */
    static eatEAPTLV => 8102

    /**
     * Specifies whether credentials have changed during EAP authentication. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a DWORD.  If  <b>pValue</b> points to 0, then the credentials have not changed. If <b>pValue</b> points to a nonzero value, then credentials have changed.
 * 
 * This attribute type may be exported by MS-CHAPv2 methods, and is consumed by PPP client supplicants.
     * @type {Integer (Int32)}
     */
    static eatCredentialsChanged => 8103

    /**
     * The inner EAP method used inside native tunnel methods. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure. 
 * 
 * This attribute type is exported by EAP methods.
     * @type {Integer (Int32)}
     */
    static eatInnerEapMethodType => 8104

    /**
     * The password, in clear text, of the user to be authenticated. This attribute type is sent by EAP methods that use EAPHost to raise the identity user interface. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure. 
 * 
 * This attribute type is exported by EAPHost.
     * @type {Integer (Int32)}
     */
    static eatClearTextPassword => 8107

    /**
     * Contains SoH request and response information used during EAP authentication.  The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string.  
 * 
 * This attribute type is exported by EAPHost and PEAP methods, and consumed by PPP server supplicants.
     * @type {Integer (Int32)}
     */
    static eatQuarantineSoH => 8150

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static eatCertificateThumbprint => 8250

    /**
     * The peer identity provided in the identity response message (EAP-Response/Identity). This identity may be different than the peer identity authenticated by the EAP method.   The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to an ASCII string. The string will be <b>NULL</b> if the EAP peer identity does not exist. For more information, see the <a href="https://www.ietf.org/">Key Management Framework draft specification</a>. 
 * 
 * This attribute type is exported by EAP methods and consumed by supplicants.
     * @type {Integer (Int32)}
     */
    static eatPeerId => 9000

    /**
     * The identity of the server used when the EAP method authenticates to the server. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to an ASCII string. The string will be <b>NULL</b> if an EAP method does not define a method-specific peer identity. For more information, see the <a href="https://www.ietf.org/">Key Management Framework draft specification</a>. 
 * 
 * This attribute type is exported by EAP methods and consumed by supplicants.
     * @type {Integer (Int32)}
     */
    static eatServerId => 9001

    /**
     * A temporally unique method identifier that identifies an EAP session of a given type between an peer and a server. Any EAP method that derives keys must specify this attribute type. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a DWORD. For more information, see the <a href="https://www.ietf.org/">Key Management Framework draft specification</a>. 
 * 
 * This attribute type is exported by EAPHost methods and other EAP methods, and consumed by supplicants.
     * @type {Integer (Int32)}
     */
    static eatMethodId => 9002

    /**
     * The extended session master key (EMSK). This key material is derived  between the peer and the server, and should not be shared with a third party. The <b>pValue</b> member  of  
 * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> for this type points to a byte string, which should contain at least 64 octets of key material. For more information, see the <a href="https://www.ietf.org/">Key Management Framework draft specification</a>. 
 * 
 * This attribute type is exported by EAP methods and consumed by supplicants.
     * @type {Integer (Int32)}
     */
    static eatEMSK => 9003

    /**
     * Windows Vista with SP1 or later: An attribute type that carries the session identity.
     * @type {Integer (Int32)}
     */
    static eatSessionId => 9004

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static eatReserved => -1
}
