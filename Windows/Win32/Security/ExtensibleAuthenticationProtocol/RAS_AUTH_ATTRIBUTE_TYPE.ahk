#Requires AutoHotkey v2.0.0 64-bit

/**
 * The RAS_AUTH_ATTRIBUTE_TYPE enumerated type specifies attribute values used for session authentication.
 * @see https://docs.microsoft.com/windows/win32/api//raseapif/ne-raseapif-ras_auth_attribute_type
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class RAS_AUTH_ATTRIBUTE_TYPE{

    /**
     * Specifies a value equal to zero, and used as the <b>NULL</b> terminator in any array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> structures.
     * @type {Integer (Int32)}
     */
    static raatMinimum => 0

    /**
     * Specifies the name of the user to be authenticated. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatUserName => 1

    /**
     * Specifies the password of the user to be authenticated. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatUserPassword => 2

    /**
     * Specifies the password provided by the user in response to an MD5 Challenge Handshake Authentication Protocol (CHAP) challenge. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatMD5CHAPPassword => 3

    /**
     * Specifies the Network Access Server (NAS) IP address. An Access-Request should specify either an NAS IP address or an NAS identifier. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatNASIPAddress => 4

    /**
     * Specifies the physical or virtual private network (VPN) through which the user is connecting to the NAS. Note that this value is not a port number in the sense of TCP or UDP. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatNASPort => 5

    /**
     * Specifies the type of service the user has requested or the type of service to be provided. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatServiceType => 6

    /**
     * Specifies the type of framed protocol to use for framed access, for example SLIP, PPP, or ARAP (AppleTalk Remote Access Protocol). The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatFramedProtocol => 7

    /**
     * Specifies the IP address that is configured for the user requesting authentication. This attribute is typically returned by the authentication provider. However, the NAS may use it in an authentication request to specify a preferred IP address. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatFramedIPAddress => 8

    /**
     * Specifies the IP network mask for a user that is a router to a network. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatFramedIPNetmask => 9

    /**
     * Specifies the routing method for a user that is a router to a network. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatFramedRouting => 10

    /**
     * Specifies the filter list for the user requesting authentication. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatFilterId => 11

    /**
     * Specifies the Maximum Transmission Unit (MTU) for the user. This attribute is used in cases where the MTU is not negotiated through some other means, such as PPP. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatFramedMTU => 12

    /**
     * Specifies a compression protocol to use for the connection. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatFramedCompression => 13

    /**
     * Specifies the system with which to connect the user. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatLoginIPHost => 14

    /**
     * Specifies the service to use to connect the user to the host specified by <b>raatLoginIPHost</b>. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatLoginService => 15

    /**
     * Specifies the port to which to connect the user. This attribute is present only if the <b>raatLoginService</b> attribute is present. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatLoginTCPPort => 16

    /**
     * This value is currently unassigned.
     * @type {Integer (Int32)}
     */
    static raatUnassigned17 => 17

    /**
     * Specifies a message to display to the user. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatReplyMessage => 18

    /**
     * Specifies a callback number. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatCallbackNumber => 19

    /**
     * Specifies a location to call back. The value of this attribute is interpreted by the NAS. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatCallbackId => 20

    /**
     * This value is currently unassigned. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is also undefined.
     * @type {Integer (Int32)}
     */
    static raatUnassigned21 => 21

    /**
     * Specifies routing information to configure on the NAS for the user. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatFramedRoute => 22

    /**
     * Specifies the IPX network number to configure for the user. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatFramedIPXNetwork => 23

    /**
     * Specifies state information provided to the client by the server. Refer to 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for detailed information about this value. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer.
     * @type {Integer (Int32)}
     */
    static raatState => 24

    /**
     * Specifies a value that is provided to the NAS by the authentication provider. The NAS should use this value when communicating with the accounting provider. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatClass => 25

    /**
     * Specifies a field for vendor-supplied extended attributes. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatVendorSpecific => 26

    /**
     * Specifies the maximum number of seconds for which to provide service to the user. After this time, the session is terminated. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatSessionTimeout => 27

    /**
     * Specifies the maximum number of consecutive seconds the session can be idle. If the idle time exceeds this value, the session is terminated. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatIdleTimeout => 28

    /**
     * Specifies an action the server performs when time the connection terminates. Refer to the above-referenced files for detailed information about this value. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatTerminationAction => 29

    /**
     * Specifies the number that the user dialed to connect to the NAS. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatCalledStationId => 30

    /**
     * Specifies the number from which the user is calling. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatCallingStationId => 31

    /**
     * Specifies the NAS identifier. An Access-Request should specify either an NAS identifier or an NAS IP address. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatNASIdentifier => 32

    /**
     * Specifies a value that a proxy server includes when forwarding an authentication request. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatProxyState => 33

    /**
     * Specifies an attribute that is not currently used for authentication on Windows 2000. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatLoginLATService => 34

    /**
     * Specifies an attribute that is not currently used for authentication on Windows 2000. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatLoginLATNode => 35

    /**
     * Specifies an attribute that is not currently used for authentication on Windows 2000. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatLoginLATGroup => 36

    /**
     * Specifies the AppleTalk network number for the user when the user is another router. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatFramedAppleTalkLink => 37

    /**
     * Specifies the AppleTalk network number that the NAS should use to allocate an AppleTalk node for the user. This attribute is used only when the user is not another router. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatFramedAppleTalkNetwork => 38

    /**
     * Specifies the AppleTalk default zone for the user. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatFramedAppleTalkZone => 39

    /**
     * Specifies whether the accounting provider should start or stop accounting for the user. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (Int32)}
     */
    static raatAcctStatusType => 40

    /**
     * Specifies the length of time that the client has been attempting to send the current request. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (Int32)}
     */
    static raatAcctDelayTime => 41

    /**
     * Specifies the number of octets that have been received during the current accounting session. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (Int32)}
     */
    static raatAcctInputOctets => 42

    /**
     * Specifies the number of octets that were sent during the current accounting session. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (Int32)}
     */
    static raatAcctOutputOctets => 43

    /**
     * Specifies a value to enable the identification of matching start and stop records within a log file. The start and stop records are sent in the <b>raatAcctStatusType</b> attribute. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (Int32)}
     */
    static raatAcctSessionId => 44

    /**
     * Specifies, to the accounting provider, how the user was authenticated; for example by Windows 2000 Directory Services, RADIUS, or some other authentication provider. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a>for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (Int32)}
     */
    static raatAcctAuthentic => 45

    /**
     * Specifies the number of seconds that have elapsed in the current accounting session. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (Int32)}
     */
    static raatAcctSessionTime => 46

    /**
     * Specifies the number of packets that have been received during the current accounting session. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (Int32)}
     */
    static raatAcctInputPackets => 47

    /**
     * Specifies the number of packets that have been sent during the current accounting session. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (Int32)}
     */
    static raatAcctOutputPackets => 48

    /**
     * Specifies how the current accounting session was terminated. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (Int32)}
     */
    static raatAcctTerminateCause => 49

    /**
     * Specifies a value to enable the identification of related accounting sessions within a log file. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (Int32)}
     */
    static raatAcctMultiSessionId => 50

    /**
     * Specifies the number of links if the current accounting session is using a multilink connection. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a>.
     * @type {Integer (Int32)}
     */
    static raatAcctLinkCount => 51

    /**
     * Specifies an attribute that is included in an accounting request packet. It specifies the time that the event took place. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see the 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a> Internet draft.
     * @type {Integer (Int32)}
     */
    static raatAcctEventTimeStamp => 55

    /**
     * Specifies the CHAP challenge sent by the NAS to a CHAP user. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatMD5CHAPChallenge => 60

    /**
     * Specifies the type of the port through which the user is connecting, for example, asynchronous, ISDN, virtual. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatNASPortType => 61

    /**
     * Specifies the number of ports the NAS should make available to the user for multilink sessions. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatPortLimit => 62

    /**
     * Specifies an attribute that is not currently used for authentication on Windows 2000. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
     * @type {Integer (Int32)}
     */
    static raatLoginLATPort => 63

    /**
     * Specifies the tunneling protocol used. The following table lists valid tunnel types. 
 * 
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Tunnel Type Value</th>
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
     * @type {Integer (Int32)}
     */
    static raatTunnelType => 64

    /**
     * Specifies which transport medium to use when creating a tunnel for those protocols (such as L2TP) that can operate over multiple transports. The following table lists valid medium types. 
 * 
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Medium Type Value</th>
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
 * <td>NSAP</td>
 * </tr>
 * <tr>
 * <td>4</td>
 * <td>HDLC (8-bit multidrop)</td>
 * </tr>
 * <tr>
 * <td>5</td>
 * <td>BBN 1822</td>
 * </tr>
 * <tr>
 * <td>6</td>
 * <td>802 (includes all 802 media plus Ethernet "canonical format")</td>
 * </tr>
 * <tr>
 * <td>7</td>
 * <td>E.163 (POTS)</td>
 * </tr>
 * <tr>
 * <td>8</td>
 * <td>E.164 (SMDS, Frame Relay, ATM)</td>
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
 * <td>IPX</td>
 * </tr>
 * <tr>
 * <td>12</td>
 * <td>Appletalk</td>
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
     * @type {Integer (Int32)}
     */
    static raatTunnelMediumType => 65

    /**
     * Points to the address of the initiator end of the tunnel.
     * @type {Integer (Int32)}
     */
    static raatTunnelClientEndpoint => 66

    /**
     * Points to the address of the server end of the tunnel.
     * @type {Integer (Int32)}
     */
    static raatTunnelServerEndpoint => 67

    /**
     * Specifies a password to use for AppleTalk Remote Access Protocol (ARAP) authentication. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a> .
     * @type {Integer (Int32)}
     */
    static raatARAPPassword => 70

    /**
     * Specifies information that an NAS should send back to the user in an ARAP "feature flags" packet. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (Int32)}
     */
    static raatARAPFeatures => 71

    /**
     * Specifies how to use the ARAP zone list for the user. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (Int32)}
     */
    static raatARAPZoneAccess => 72

    /**
     * Specifies an ARAP security module to use during a secondary authentication phase between the NAS and the user. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (Int32)}
     */
    static raatARAPSecurity => 73

    /**
     * Specifies the data to use with an ARAP security module. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (Int32)}
     */
    static raatARAPSecurityData => 74

    /**
     * Specifies the number of password retry attempts to permit the user access. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value.
     * @type {Integer (Int32)}
     */
    static raatPasswordRetry => 75

    /**
     * Specifies whether the NAS should echo the user response to a challenge. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (Int32)}
     */
    static raatPrompt => 76

    /**
     * Specifies information about the type of connection the user is using. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a Pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (Int32)}
     */
    static raatConnectInfo => 77

    /**
     * Specifies user-profile information in communications between RADIUS Proxy Servers and RADIUS Proxy Clients. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (Int32)}
     */
    static raatConfigurationToken => 78

    /**
     * Specifies that EAP information be sent directly between the user and the authentication provider. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (Int32)}
     */
    static raatEAPMessage => 79

    /**
     * Specifies a signature to include with CHAP, EAP, or ARAP packets. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (Int32)}
     */
    static raatSignature => 80

    /**
     * Specifies the response to a Apple Remote Access Protocol (ARAP) challenge. In ARAP, either the server or the client may respond to challenges. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a pointer. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (Int32)}
     */
    static raatARAPChallengeResponse => 84

    /**
     * Specifies the time, in seconds, between accounting updates. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (Int32)}
     */
    static raatAcctInterimInterval => 85

    /**
     * 
     * @type {Integer (Int32)}
     */
    static raatNASIPv6Address => 95

    /**
     * 
     * @type {Integer (Int32)}
     */
    static raatFramedInterfaceId => 96

    /**
     * 
     * @type {Integer (Int32)}
     */
    static raatFramedIPv6Prefix => 97

    /**
     * 
     * @type {Integer (Int32)}
     */
    static raatLoginIPv6Host => 98

    /**
     * 
     * @type {Integer (Int32)}
     */
    static raatFramedIPv6Route => 99

    /**
     * 
     * @type {Integer (Int32)}
     */
    static raatFramedIPv6Pool => 100

    /**
     * Specifies a Apple Remote Access Protocol (ARAP) guest logon. The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is a 32-bit integral value. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc2869.txt">RFC 2869</a>.
     * @type {Integer (Int32)}
     */
    static raatARAPGuestLogon => 8096

    /**
     * Reserved for internal use only.
     * @type {Integer (Int32)}
     */
    static raatCertificateOID => 8097

    /**
     * Reserved for internal use only.
     * @type {Integer (Int32)}
     */
    static raatEAPConfiguration => 8098

    /**
     * Reserved for internal use only.
     * @type {Integer (Int32)}
     */
    static raatPEAPEmbeddedEAPTypeId => 8099

    /**
     * 
     * @type {Integer (Int32)}
     */
    static raatInnerEAPTypeId => 8099

    /**
     * Reserved for internal use only.
     * @type {Integer (Int32)}
     */
    static raatPEAPFastRoamedSession => 8100

    /**
     * 
     * @type {Integer (Int32)}
     */
    static raatFastRoamedSession => 8100

    /**
     * Indicates and EAP-TLV attribute.
     * @type {Integer (Int32)}
     */
    static raatEAPTLV => 8102

    /**
     * 
     * @type {Integer (Int32)}
     */
    static raatCredentialsChanged => 8103

    /**
     * 
     * @type {Integer (Int32)}
     */
    static raatCertificateThumbprint => 8250

    /**
     * 
     * @type {Integer (Int32)}
     */
    static raatPeerId => 9000

    /**
     * 
     * @type {Integer (Int32)}
     */
    static raatServerId => 9001

    /**
     * 
     * @type {Integer (Int32)}
     */
    static raatMethodId => 9002

    /**
     * 
     * @type {Integer (Int32)}
     */
    static raatEMSK => 9003

    /**
     * 
     * @type {Integer (Int32)}
     */
    static raatSessionId => 9004

    /**
     * The value field in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> for this type is undefined.
     * @type {Integer (Int32)}
     */
    static raatReserved => -1
}
