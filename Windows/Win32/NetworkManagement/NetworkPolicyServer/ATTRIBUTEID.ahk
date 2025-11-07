#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ATTRIBUTEID enumeration type enumerates the RADIUS attributes supported by the SDO API.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-attributeid
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ATTRIBUTEID{

    /**
     * Specifies a value equal to zero, and used as the <b>NULL</b> terminator in an array of attributes.
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_UNDEFINED => 0

    /**
     * Specifies the minimum value for values of this enumeration type.
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_MIN_VALUE => 1

    /**
     * Specifies the name of the user to be authenticated. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_USER_NAME => 1

    /**
     * Specifies the password of the user to be authenticated. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_USER_PASSWORD => 2

    /**
     * Specifies the password provided by the user in response to an MD5 Challenge Handshake Authentication Protocol (CHAP) challenge. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CHAP_PASSWORD => 3

    /**
     * Specifies the Network Access Server (NAS) IP address. An Access-Request should specify either an NAS IP address or an NAS identifier. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_NAS_IP_ADDRESS => 4

    /**
     * Specifies the physical or virtual private network (VPN) through which the user is connecting to the NAS. Note that this value is not a port number in the sense of TCP or UDP. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_NAS_PORT => 5

    /**
     * Specifies the type of service the user has requested or the type of service to be provided. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_SERVICE_TYPE => 6

    /**
     * Specifies the type of framed protocol to use for framed access, for example SLIP, PPP, or ARAP (AppleTalk Remote Access Protocol). For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_PROTOCOL => 7

    /**
     * Specifies the IP address that is configured for the user requesting authentication. This attribute is typically returned by the authentication provider. However, the NAS may use it in an authentication request to specify a preferred IP address. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_IP_ADDRESS => 8

    /**
     * Specifies the IP network mask for a user that is a router to a network. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_IP_NETMASK => 9

    /**
     * Specifies the routing method for a user that is a router to a network. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_ROUTING => 10

    /**
     * Specifies the filter list for the user requesting authentication. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FILTER_ID => 11

    /**
     * Specifies the Maximum Transmission Unit (MTU) for the user. This attribute is used in cases where the MTU is not negotiated through some other means, such as PPP. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_MTU => 12

    /**
     * Specifies a compression protocol to use for the connection. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_COMPRESSION => 13

    /**
     * Specifies the system with which to connect the user. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_LOGIN_IP_HOST => 14

    /**
     * Specifies the service to use to connect the user to the host specified by <b>raatLoginIPHost</b>. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_LOGIN_SERVICE => 15

    /**
     * Specifies the port to which to connect the user. This attribute is present only if the <b>raatLoginService</b> attribute is present. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_LOGIN_TCP_PORT => 16

    /**
     * This value is currently unassigned.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_UNASSIGNED1 => 17

    /**
     * Specifies a message to display to the user. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_REPLY_MESSAGE => 18

    /**
     * Specifies a callback number. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CALLBACK_NUMBER => 19

    /**
     * Specifies a location to call back. The value of this attribute is interpreted by the NAS. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CALLBACK_ID => 20

    /**
     * This value is currently unassigned. The value field in for this type is also undefined.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_UNASSIGNED2 => 21

    /**
     * Specifies routing information to configure on the NAS for the user. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_ROUTE => 22

    /**
     * Specifies the IPX network number to configure for the user. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_IPX_NETWORK => 23

    /**
     * Specifies state information provided to the client by the server. Refer to 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for detailed information about this value. The value field in for this type is a pointer.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_STATE => 24

    /**
     * Specifies a value that is provided to the NAS by the authentication provider. The NAS should use this value when communicating with the accounting provider. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CLASS => 25

    /**
     * Specifies a field for vendor-supplied extended attributes. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_VENDOR_SPECIFIC => 26

    /**
     * Specifies the maximum number of seconds for which to provide service to the user. After this time, the session is terminated. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_SESSION_TIMEOUT => 27

    /**
     * Specifies the maximum number of consecutive seconds the session can be idle. If the idle time exceeds this value, the session is terminated. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_IDLE_TIMEOUT => 28

    /**
     * Specifies an action the server performs when time the connection terminates. Refer to the above-referenced files for detailed information about this value. The value field in for this type is 32-bit integral value. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TERMINATION_ACTION => 29

    /**
     * Specifies the number that the user dialed to connect to the NAS. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CALLED_STATION_ID => 30

    /**
     * Specifies the number from which the user is calling. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CALLING_STATION_ID => 31

    /**
     * Specifies the NAS identifier. An Access-Request should specify either an NAS identifier or an NAS IP address. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_NAS_IDENTIFIER => 32

    /**
     * Specifies a value that a proxy server includes when forwarding an authentication request. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_PROXY_STATE => 33

    /**
     * Specifies an attribute that is not currently used for authentication on Windows. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_LOGIN_LAT_SERVICE => 34

    /**
     * Specifies an attribute that is not currently used for authentication on Windows. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_LOGIN_LAT_NODE => 35

    /**
     * Specifies an attribute that is not currently used for authentication on Windows. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_LOGIN_LAT_GROUP => 36

    /**
     * Specifies the AppleTalk network number for the user when the user is another router. The value field in for this type is 32-bit integral value. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_APPLETALK_LINK => 37

    /**
     * Specifies the AppleTalk network number that the NAS should use to allocate an AppleTalk node for the user. This attribute is used only when the user is not another router. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_APPLETALK_NET => 38

    /**
     * Specifies the AppleTalk default zone for the user. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_APPLETALK_ZONE => 39

    /**
     * Specifies whether the accounting provider should start or stop accounting for the user. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_STATUS_TYPE => 40

    /**
     * Specifies the length of time that the client has been attempting to send the current request. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_DELAY_TIME => 41

    /**
     * Specifies the number of octets that have been received during the current accounting session. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_INPUT_OCTETS => 42

    /**
     * Specifies the number of octets that were sent during the current accounting session. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_OUTPUT_OCTETS => 43

    /**
     * Specifies a value to enable the identification of matching start and stop records within a log file. The start and stop records are sent in the <b>raatAcctStatusType</b> attribute. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_SESSION_ID => 44

    /**
     * Specifies, to the accounting provider, how the user was authenticated; for example by Windows Directory Services, RADIUS, or some other authentication provider. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_AUTHENTIC => 45

    /**
     * Specifies the number of seconds that have elapsed in the current accounting session. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_SESSION_TIME => 46

    /**
     * Specifies the number of packets that are received during the current accounting session. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_INPUT_PACKETS => 47

    /**
     * Specifies the number of packets that are sent during the current accounting session. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_OUTPUT_PACKETS => 48

    /**
     * Specifies how the current accounting session was terminated. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_TERMINATE_CAUSE => 49

    /**
     * Specifies a value to enable the identification of related accounting sessions within a log file. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_MULTI_SSN_ID => 50

    /**
     * Specifies the number of links if the current accounting session is using a multilink connection. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_LINK_COUNT => 51

    /**
     * Specifies the CHAP challenge sent by the NAS to a CHAP user. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CHAP_CHALLENGE => 60

    /**
     * Specifies the type of the port through which the user is connecting, for example, asynchronous, ISDN, virtual. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_NAS_PORT_TYPE => 61

    /**
     * Specifies the number of ports the NAS should make available to the user for multilink sessions. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_PORT_LIMIT => 62

    /**
     * Specifies an attribute that is not currently used for authentication on Windows. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_LOGIN_LAT_PORT => 63

    /**
     * Specifies the tunneling protocol used. The following list lists valid tunnel types.
     * 
     * <table>
     * <tr>
     * <th>Tunnel type value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Point-to-Point Tunneling Protocol (PPTP)</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Layer Two Forwarding (L2F)</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Layer Two Tunneling Protocol (L2TP)</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>Ascend Tunnel Management Protocol (ATMP)</td>
     * </tr>
     * <tr>
     * <td>5</td>
     * <td>Virtual Tunneling Protocol (VTP)</td>
     * </tr>
     * <tr>
     * <td>6</td>
     * <td>IP Authentication Header in the Tunnel-mode</td>
     * </tr>
     * <tr>
     * <td>7</td>
     * <td>IP-in-IP Encapsulation (IP-IP)</td>
     * </tr>
     * <tr>
     * <td>8</td>
     * <td>Minimal IP-in-IP Encapsulation (MIN-IP-IP)</td>
     * </tr>
     * <tr>
     * <td>9</td>
     * <td>IP Encapsulating Security Payload in the Tunnel-mode (ESP)</td>
     * </tr>
     * <tr>
     * <td>10</td>
     * <td>Generic Route Encapsulation (GRE)</td>
     * </tr>
     * <tr>
     * <td>11</td>
     * <td>Bay Dial Virtual Services (DVS)</td>
     * </tr>
     * <tr>
     * <td>12</td>
     * <td>IP-in-IP Tunneling</td>
     * </tr>
     * </table>
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TUNNEL_TYPE => 64

    /**
     * Specifies which transport medium to use when creating a tunnel for those protocols (such as L2TP) that can operate over multiple transports. The following list lists valid medium types.
     * 
     * <table>
     * <tr>
     * <th>Medium type value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>IPv4 (IP version 4)</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>IPv6 (IP version 6)</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>OSI Network Service Access Points (NSAP) Signaling Protocol (see ISO 8348 and ITU-T X.213).</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>High-Level Data Link Control (HDLC) Protocol (8-bit multidrop)</td>
     * </tr>
     * <tr>
     * <td>5</td>
     * <td>Bolt Beranek and Newman, Inc. (BBN) Report 1822</td>
     * </tr>
     * <tr>
     * <td>6</td>
     * <td>IEEE 802 (includes all 802 media plus Ethernet "canonical format")</td>
     * </tr>
     * <tr>
     * <td>7</td>
     * <td>E.163 Plain Old Telephone Service (POTS)</td>
     * </tr>
     * <tr>
     * <td>8</td>
     * <td>E.164 Switched Multimegabit Data Service (SMDS), Frame Relay, Asynchronous Transfer Mode (ATM)</td>
     * </tr>
     * <tr>
     * <td>9</td>
     * <td>F.69 (Telex)</td>
     * </tr>
     * <tr>
     * <td>10</td>
     * <td>X.121 (X.25, Frame Relay)</td>
     * </tr>
     * <tr>
     * <td>11</td>
     * <td>Internetwork Packet Exchange (IPX)</td>
     * </tr>
     * <tr>
     * <td>12</td>
     * <td>AppleTalk</td>
     * </tr>
     * <tr>
     * <td>13</td>
     * <td>Decnet IV</td>
     * </tr>
     * <tr>
     * <td>14</td>
     * <td>Banyan Vines</td>
     * </tr>
     * <tr>
     * <td>15</td>
     * <td>E.164 with NSAP format subaddress</td>
     * </tr>
     * </table>
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TUNNEL_MEDIUM_TYPE => 65

    /**
     * Specifies the address of the initiator end of the tunnel.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TUNNEL_CLIENT_ENDPT => 66

    /**
     * Specifies the address of the server end of the tunnel.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TUNNEL_SERVER_ENDPT => 67

    /**
     * Specifies an identifier assigned to the tunnel
     *          session. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2867.txt">RFC 2867</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_TUNNEL_CONN => 68

    /**
     * The password for authenticating to the remote server.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TUNNEL_PASSWORD => 69

    /**
     * Specifies a password to use for AppleTalk Remote Access Protocol (ARAP) authentication. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ARAP_PASSWORD => 70

    /**
     * Specifies information that an NAS should send back to the user in an ARAP "feature flags" packet. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ARAP_FEATURES => 71

    /**
     * Specifies how to use the ARAP zone list for the user. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ARAP_ZONE_ACCESS => 72

    /**
     * Specifies an ARAP security module to use during a secondary authentication phase between the NAS and the user. The value field for this type is a 32-bit integral. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ARAP_SECURITY => 73

    /**
     * Specifies the data to use with an ARAP security module. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ARAP_SECURITY_DATA => 74

    /**
     * Specifies the number of password retry attempts to permit the user access. The value field for this type is a 32-bit integral value.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_PASSWORD_RETRY => 75

    /**
     * Specifies whether the NAS should echo the user response to a challenge. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_PROMPT => 76

    /**
     * Specifies information about the type of connection the user is using. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CONNECT_INFO => 77

    /**
     * Specifies user-profile information in communications between RADIUS Proxy Servers and RADIUS Proxy Clients. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_CONFIGURATION_TOKEN => 78

    /**
     * Specifies that EAP information be sent directly between the user and the authentication provider. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_EAP_MESSAGE => 79

    /**
     * Specifies a signature to include with CHAP, EAP, or ARAP packets. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_SIGNATURE => 80

    /**
     * Group ID for a particular tunneled session.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TUNNEL_PVT_GROUP_ID => 81

    /**
     * Specifies a tunnel to which a session is assigned.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TUNNEL_ASSIGNMENT_ID => 82

    /**
     * Relative preference assigned to each tunnel when more than one set of tunneling attributes is returned to the tunnel initiator.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_TUNNEL_PREFERENCE => 83

    /**
     * Specifies the response to a Apple Remote Access Protocol (ARAP) challenge. In ARAP, either the server or the client responds to challenges. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ARAP_CHALLENGE_RESPONSE => 84

    /**
     * Indicates the number of seconds between each interim update for this specific session. This value can only appear in the Access-Accept message. For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_ACCT_INTERIM_INTERVAL => 85

    /**
     * Specifies the IPv6 Address of the NAS that requests authentication of the user. It should be unique to the NAS within the scope of the RADIUS server. It is only used in an Access-Request packet. For more information, see the NAS-IPv6-Address section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_NAS_IPv6_ADDRESS => 95

    /**
     * Specifies the IPv6 interface identifier to be
     *       configured for the user.  It may be used in an Access-Accept packet.
     *       For more information, see the Framed-Interface-Id section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_INTERFACE_ID => 96

    /**
     * Specifies an IPv6 prefix (and corresponding route)
     *       to be configured for the user.  It may be used in an Access-Accept
     *       packet and can appear multiple times.  For more information, see the Framed-IPv6-Prefix section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_IPv6_PREFIX => 97

    /**
     * Specifies the system with which to connect the
     *       user, when the ratLoginService attribute is included.  It may be
     *       used in an Access-Accept packet.
     * For more information, see the Login-IPv6-Host section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_LOGIN_IPv6_HOST => 98

    /**
     * Specifies routing information to be configured for
     *       the user on the NAS.  It is used in an Access-Accept packet and
     *       can appear multiple times.
     * For more information, see the Framed-IPv6-Route section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_IPv6_ROUTE => 99

    /**
     * Specifies the name of an assigned pool that should
     *       be used to assign an IPv6 prefix for the user.  If a NAS does not
     *       support multiple prefix pools, the NAS must ignore this attribute.
     * 
     * For more information, see the Framed-IPv6-Pool section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a>.
     * @type {Integer (UInt32)}
     */
    static RADIUS_ATTRIBUTE_FRAMED_IPv6_POOL => 100

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_IP_ADDRESS => 4096

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SAVED_RADIUS_CALLBACK_NUMBER => 4097

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NP_CALLING_STATION_ID => 4098

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SAVED_NP_CALLING_STATION_ID => 4099

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_ROUTE => 4100

    /**
     * Specifies that the user's dial-in properties are ignored.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_IGNORE_USER_DIALIN_PROPERTIES => 4101

    /**
     * Time periods and days of week during which user is allowed to connect.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NP_TIME_OF_DAY => 4102

    /**
     * Phone number dialed by user.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NP_CALLED_STATION_ID => 4103

    /**
     * Port types permitted for a connection.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NP_ALLOWED_PORT_TYPES => 4104

    /**
     * Authentication types permitted for a connection.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NP_AUTHENTICATION_TYPE => 4105

    /**
     * EAP encryption modes permitted for a connection.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NP_ALLOWED_EAP_TYPE => 4106

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SHARED_SECRET => 4107

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CLIENT_IP_ADDRESS => 4108

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CLIENT_PACKET_HEADER => 4109

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_TOKEN_GROUPS => 4110

    /**
     * Specifies whether dial-in access is available for a given user.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_ALLOW_DIALIN => 4111

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_REQUEST_ID => 4112

    /**
     * The target data to which an attribute manipulation rule is applied. Attribute manipulation was previously known as 'realms processing'. See the online help for Internet Authentication Service for more information on attribute manipulation.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_MANIPULATION_TARGET => 4113

    /**
     * The manipulation rule to apply to the data specified by the Manipulation-Target attribute. See the online help for Internet Authentication Service for more information on attribute manipulation.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_MANIPULATION_RULE => 4114

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_ORIGINAL_USER_NAME => 4115

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CLIENT_VENDOR_TYPE => 4116

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CLIENT_UDP_PORT => 4117

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_CHALLENGE => 4118

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_RESPONSE => 4119

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_DOMAIN => 4120

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_ERROR => 4121

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_CPW1 => 4122

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_CPW2 => 4123

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_LM_ENC_PW => 4124

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_NT_ENC_PW => 4125

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP_MPPE_KEYS => 4126

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_AUTHENTICATION_TYPE => 4127

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CLIENT_NAME => 4128

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NT4_ACCOUNT_NAME => 4129

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_FULLY_QUALIFIED_USER_NAME => 4130

    /**
     * Specifies groups used for the policy conditions.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NTGROUPS => 4131

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_EAP_FRIENDLY_NAME => 4132

    /**
     * The type of authentication provider to use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_AUTH_PROVIDER_TYPE => 4133

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_ACCT_AUTH_TYPE => 4134

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_ACCT_EAP_TYPE => 4135

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PACKET_TYPE => 4136

    /**
     * The name of the RADIUS server or server group that provides authentication.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_AUTH_PROVIDER_NAME => 4137

    /**
     * The type of accounting provider to use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_ACCT_PROVIDER_TYPE => 4138

    /**
     * The name of the RADIUS server that provides accounting.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_ACCT_PROVIDER_NAME => 4139

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_MPPE_SEND_KEY => 4140

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_MPPE_RECV_KEY => 4141

    /**
     * Specifies an MS-CHAP reason-for-failure code. This attribute is returned in the Failure packet Message field. For more information, see Request for Comments (RFC) 
     * <a href="https://www.ietf.org/rfc/rfc2433.txt">2433</a>.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_REASON_CODE => 4142

    /**
     * See Request for Comments (RFC) 
     * <a href="https://www.ietf.org/rfc/rfc2548.txt">2548</a>, Microsoft Vendor-specific RADIUS Attributes.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_FILTER => 4143

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP2_RESPONSE => 4144

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP2_SUCCESS => 4145

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_CHAP2_CPW => 4146

    /**
     * See Request for Comments (RFC) 
     * <a href="https://www.ietf.org/rfc/rfc2548.txt">2548</a>, Microsoft Vendor-specific RADIUS Attributes.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_RAS_VENDOR => 4147

    /**
     * See Request for Comments (RFC) 
     * <a href="https://www.ietf.org/rfc/rfc2548.txt">2548</a>, Microsoft Vendor-specific RADIUS Attributes.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_RAS_VERSION => 4148

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NP_NAME => 4149

    /**
     * See Request for Comments (RFC) 
     * <a href="https://www.ietf.org/rfc/rfc2548.txt">2548</a>, Microsoft Vendor-specific RADIUS Attributes.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_PRIMARY_DNS_SERVER => 4150

    /**
     * See Request for Comments (RFC) 
     * <a href="https://www.ietf.org/rfc/rfc2548.txt">2548</a>, Microsoft Vendor-specific RADIUS Attributes.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_SECONDARY_DNS_SERVER => 4151

    /**
     * See Request for Comments (RFC) 
     * <a href="https://www.ietf.org/rfc/rfc2548.txt">2548</a>, Microsoft Vendor-specific RADIUS Attributes.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_PRIMARY_NBNS_SERVER => 4152

    /**
     * See Request for Comments (RFC) 
     * <a href="https://www.ietf.org/rfc/rfc2548.txt">2548</a>, Microsoft Vendor-specific RADIUS Attributes.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_SECONDARY_NBNS_SERVER => 4153

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PROXY_POLICY_NAME => 4154

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PROVIDER_TYPE => 4155

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PROVIDER_NAME => 4156

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_REMOTE_SERVER_ADDRESS => 4157

    /**
     * Specifies whether NPS automatically generates the class attribute. NPS automatically generates the class attribute by default.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_GENERATE_CLASS_ATTRIBUTE => 4158

    /**
     * Specifies the name of the client generating a request.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_RAS_CLIENT_NAME => 4159

    /**
     * Specifies the version of the client generating a request.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_RAS_CLIENT_VERSION => 4160

    /**
     * Specifies the certificate purpose or usage object identifiers (OIDs), in dotted decimal notation, that are allowed  when performing certificate-based authentication with EAP-TLS.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_ALLOWED_CERTIFICATE_EKU => 4161

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_EXTENSION_STATE => 4162

    /**
     * Specifies whether NPS automatically generates the session timeout based on user account expiration and time-of-day restrictions. NPS does not automatically generate the session timeout by default.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_GENERATE_SESSION_TIMEOUT => 4163

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SESSION_TIMEOUT => 4164

    /**
     * Specifies the IP traffic filter used by the Routing and Remote Access service when the connection is in a restricted state.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_QUARANTINE_IPFILTER => 4165

    /**
     * Specifies the time (in seconds) that the connection can remain in a restricted state before being disconnected.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_QUARANTINE_SESSION_TIMEOUT => 4166

    /**
     * Specifies the SID of the user requesting access.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_USER_SECURITY_IDENTITY => 4167

    /**
     * Specifies that Windows authorization is enabled for users authenticated by the remote RADIUS server for example, allows  use with Passport user mapping.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_REMOTE_RADIUS_TO_WINDOWS_USER_MAPPING => 4168

    /**
     * Specifies the UPN suffix of the Passport to Windows user mapping.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PASSPORT_USER_MAPPING_UPN_SUFFIX => 4169

    /**
     * Used to set the tag byte for any tunnel attributes in the profile. If this is not set, the default is zero.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_TUNNEL_TAG => 4170

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NP_PEAPUPFRONT_ENABLED => 4171

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CERTIFICATE_EKU => 8097

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_EAP_CONFIG => 8098

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PEAP_EMBEDDED_EAP_TYPEID => 8099

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PEAP_FAST_ROAMED_SESSION => 8100

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_EAP_TYPEID => 8101

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_EAP_TLV => 8102

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_REJECT_REASON_CODE => 8103

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PROXY_EAP_CONFIG => 8104

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_EAP_SESSION => 8105

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_IS_REPLAY => 8106

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CLEAR_TEXT_PASSWORD => 8107

    /**
     * Specifies the type of identity check to perform.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_IDENTITY_TYPE => 8108

    /**
     * Specifies which group of DHCP scopes correspond to the client requesting access.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_SERVICE_CLASS => 8109

    /**
     * Vendor-specific attribute used to carry the name of a special DHCP user class, as specified in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3004</a>, called Network Access Protection (NAP) user class.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_QUARANTINE_USER_CLASS => 8110

    /**
     * Specifies the target quarantine state of the client.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_QUARANTINE_STATE => 8111

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_OVERRIDE_RAP_AUTH => 8112

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PEAP_CHANNEL_UP => 8113

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NAME_MAPPED => 8114

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_POLICY_ENFORCED => 8115

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_MACHINE_NTGROUPS => 8116

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_USER_NTGROUPS => 8117

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_MACHINE_TOKEN_GROUPS => 8118

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_USER_TOKEN_GROUPS => 8119

    /**
     * Specifies the amount of time a host has to become conformant with network policy.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_QUARANTINE_GRACE_TIME => 8120

    /**
     * This attribute is reserved for system 
     * use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_QUARANTINE_URL => 8121

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_QUARANTINE_FIXUP_SERVERS => 8122

    /**
     * 
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_NOT_QUARANTINE_CAPABLE => 8123

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_QUARANTINE_SYSTEM_HEALTH_RESULT => 8124

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_QUARANTINE_SYSTEM_HEALTH_VALIDATORS => 8125

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_MACHINE_NAME => 8126

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NT4_MACHINE_NAME => 8127

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_QUARANTINE_SESSION_HANDLE => 8128

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_FULLY_QUALIFIED_MACHINE_NAME => 8129

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_QUARANTINE_FIXUP_SERVERS_CONFIGURATION => 8130

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CLIENT_QUARANTINE_COMPATIBLE => 8131

    /**
     * Specifies the access type of a network access server (NAS). A NAS may send this attribute to a RADIUS server to indicate the type of this NAS in an Access-Request message.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_NETWORK_ACCESS_SERVER_TYPE => 8132

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_QUARANTINE_SESSION_ID => 8133

    /**
     * Vendor-specific attribute used as a hint for dynamic selection of a preconfigured Internet Protocol security (IPsec) policy by the client requesting access.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_AFW_QUARANTINE_ZONE => 8134

    /**
     * Vendor-specific attribute used as a hint for dynamic selection of a preconfigured IPsec policy by the client requesting access.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_AFW_PROTECTION_LEVEL => 8135

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_QUARANTINE_UPDATE_NON_COMPLIANT => 8136

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_REQUEST_START_TIME => 8137

    /**
     * Vendor-specific attribute used to communicate the machine name of the client requesting network access.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_MACHINE_NAME => 8138

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CLIENT_IPv6_ADDRESS => 8139

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_INTERFACE_ID => 8140

    /**
     * 
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_IPv6_PREFIX => 8141

    /**
     * 
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SAVED_RADIUS_FRAMED_IPv6_ROUTE => 8142

    /**
     * 
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_QUARANTINE_GRACE_TIME_CONFIGURATION => 8143

    /**
     * Vendor-specific attribute used to limit the inbound and/or outbound access of the endpoint client.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_IPv6_FILTER => 8144

    /**
     * Specifies a list of servers that should be reachable by a quarantined client so that it may remediate itself.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_IPV4_REMEDIATION_SERVERS => 8145

    /**
     * Specifies a list of servers that should be reachable by a quarantined client so that it may remediate itself.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_IPV6_REMEDIATION_SERVERS => 8146

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_PROXY_RETRY_COUNT => 8147

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_MACHINE_INVENTORY => 8148

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_ABSOLUTE_TIME => 8149

    /**
     * Vendor-specific attribute used only to carry Statement of Health (SoH) information when EAP is not used. A RADIUS server may send it to an network access server (NAS) in an Access-Accept message.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_QUARANTINE_SOH => 8150

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_EAP_TYPES_CONFIGURED_IN_PROXYPOLICY => 8151

    /**
     * Vendor-specific attribute specifying the location group name for the HCAP entity.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_HCAP_LOCATION_GROUP_NAME => 8152

    /**
     * Specifies the additional Quarantine state information for a user requesting access to this NAS.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_EXTENDED_QUARANTINE_STATE => 8153

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SOH_CARRIER_EAPTLV => 8154

    /**
     * An NAS may use this attribute to pass the group name of the user requesting network access to a RADIUS server, which may then use this information to make authentication or authorization decisions.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_HCAP_USER_GROUPS => 8155

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SAVED_MACHINE_HEALTHCHECK_ONLY => 8156

    /**
     * Multiple instances of this attribute 
     * can be present at one time.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_POLICY_EVALUATED_SHV => 8157

    /**
     * TBD
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_RAS_CORRELATION_ID => 8158

    /**
     * An NAS may use this attribute to pass the name of the user requesting network access to a RADIUS server, which may then use this information to make authentication or authorization decisions.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_HCAP_USER_NAME => 8159

    /**
     * This attribute is reserved for system use.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_NT4_HCAP_ACCOUNT_NAME => 8160

    /**
     * SID for IAS_ATTRIBUTE_NT4_ACCOUNT_NAME or IAS_ATTRIBUTE_NT4_HCAP_ACCOUNT_NAME 
     *       regardless of whether the later is a user account or a machine account.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_USER_TOKEN_SID => 8161

    /**
     * SID for IAS_ATTRIBUTE_NT4_MACHINE_NAME.
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_MACHINE_TOKEN_SID => 8162

    /**
     * TBD
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_MACHINE_VALIDATED => 8163

    /**
     * Specifies the IPv4 address of the user.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_USER_IPv4_ADDRESS => 8164

    /**
     * Specifies the IPv4 address of the user.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_USER_IPv6_ADDRESS => 8165

    /**
     * Vendor-specific attribute for TS Gateway Device Redirection flags.
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_TSG_DEVICE_REDIRECTION => 8166

    /**
     * TBD
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_ACCEPT_REASON_CODE => 8167

    /**
     * TBD
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_LOGGING_RESULT => 8168

    /**
     * TBD
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SERVER_IP_ADDRESS => 8169

    /**
     * TBD
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_SERVER_IPv6_ADDRESS => 8170

    /**
     * TBD
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_RADIUS_USERNAME_ENCODING_ASCII => 8171

    /**
     * 
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_RAS_ROUTING_DOMAIN_ID => 8172

    /**
     * @type {Integer (UInt32)}
     */
    static MS_ATTRIBUTE_AZURE_POLICY_ID => 8173

    /**
     * 
     * @type {Integer (UInt32)}
     */
    static IAS_ATTRIBUTE_CERTIFICATE_THUMBPRINT => 8250

    /**
     * Specifies the encryption type of the user's connection.
     * @type {Integer (UInt32)}
     */
    static RAS_ATTRIBUTE_ENCRYPTION_TYPE => 4294967206

    /**
     * Specifies the whether encryption is Allowed, Required, or None (disallowed). For more information, see 
     * <a href="https://www.ietf.org/rfc/rfc2548.txt">RFC 2548</a>.
     * @type {Integer (UInt32)}
     */
    static RAS_ATTRIBUTE_ENCRYPTION_POLICY => 4294967207

    /**
     * Specifies whether bandwidth allocation protocol (BAP) is required.
     * @type {Integer (UInt32)}
     */
    static RAS_ATTRIBUTE_BAP_REQUIRED => 4294967208

    /**
     * Time in seconds for the capacity utilization calculation.
     * @type {Integer (UInt32)}
     */
    static RAS_ATTRIBUTE_BAP_LINE_DOWN_TIME => 4294967209

    /**
     * Percent of capacity utilized at which to bring a line down for this user.
     * @type {Integer (UInt32)}
     */
    static RAS_ATTRIBUTE_BAP_LINE_DOWN_LIMIT => 4294967210
}
