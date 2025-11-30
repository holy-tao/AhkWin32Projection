#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The RADIUS_ATTRIBUTE_TYPE type enumerates the possible types for a RADIUS attribute.
 * @remarks
 * 
 * The following attributes are read-only. Extension DLLs that implement <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process_2">RadiusExtensionProcess2</a> cannot add/remove/modify these attributes within a request or response contained in a <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_extension_control_block">RADIUS_EXTENSION_CONTROL_BLOCK</a>.
 * 
 * <ul>
 * <li><b>ratCode</b></li>
 * <li><b>ratIdentifier</b></li>
 * <li><b>ratAuthenticator</b></li>
 * <li><b>ratSrcIPAddress</b></li>
 * <li><b>ratSrcPort</b></li>
 * <li><b>ratProvider</b></li>
 * <li><b>ratUniqueId</b></li>
 * <li><b>ratSrcIPv6Address</b></li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//authif/ne-authif-radius_attribute_type
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class RADIUS_ATTRIBUTE_TYPE extends Win32Enum{

    /**
     * This value is equal to zero, and used as the null-terminator in any array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> structures.
     * @type {Integer (Int32)}
     */
    static ratMinimum => 0

    /**
     * Specifies the name of the user to be authenticated. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information. Also see 
     * <a href="https://docs.microsoft.com/windows/desktop/Nps/ias-user-identification-attributes">User Identification Attributes</a>.
     * @type {Integer (Int32)}
     */
    static ratUserName => 1

    /**
     * Specifies the password of the user to be authenticated. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratUserPassword => 2

    /**
     * Specifies the password provided by the user in response to an Challenge Handshake Authentication Protocol (CHAP) challenge. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratCHAPPassword => 3

    /**
     * Specifies the NAS IP address. An Access-Request should specify either an NAS IP address or an NAS identifier. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratNASIPAddress => 4

    /**
     * Identifies the physical or virtual private network (VPN) through which the user is connecting to the NAS. Note that this value is not a port number in the sense of TCP or UDP. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratNASPort => 5

    /**
     * Specifies the type of service the user has requested or the type of service to be provided. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratServiceType => 6

    /**
     * Specifies the type of framed protocol to use for framed access, for example SLIP, PPP, or ARAP (AppleTalk Remote Access Protocol). The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratFramedProtocol => 7

    /**
     * Specifies the IP address that will be configured for the user requesting authentication. This attribute is typically returned by the authentication provider. However, the NAS may use it in an authentication request to specify a preferred IP address. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratFramedIPAddress => 8

    /**
     * Specifies the IP network mask for a user that is a router to a network. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratFramedIPNetmask => 9

    /**
     * Specifies the routing method for a user that is a router to a network. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratFramedRouting => 10

    /**
     * Identifies the filter list for the user requesting authentication. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratFilterId => 11

    /**
     * Specifies the Maximum Transmission Unit (MTU) for the user. This attribute is used in cases where the MTU is not negotiated through some other means, such as PPP. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratFramedMTU => 12

    /**
     * Specifies a compression protocol to use for the connection. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information
     * @type {Integer (Int32)}
     */
    static ratFramedCompression => 13

    /**
     * Specifies the system with which to connect the user. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratLoginIPHost => 14

    /**
     * Specifies the service to use to connect the user to the host specified by <b>ratLoginIPHost</b>. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratLoginService => 15

    /**
     * Specifies the port to which to connect the user. This attribute is present only if the <b>ratLoginService</b> attribute is present. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratLoginPort => 16

    /**
     * Specifies a message to display to the user. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratReplyMessage => 18

    /**
     * Specifies a callback number. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratCallbackNumber => 19

    /**
     * Identifies a location to callback. The value of this attribute is interpreted by the NAS. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratCallbackId => 20

    /**
     * Provides routing information to configure on the NAS for the user. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratFramedRoute => 22

    /**
     * Specifies the IPX network number to configure for the user. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratFramedIPXNetwork => 23

    /**
     * This attribute is included in Access-Challenge and Access-Accept communications between the server and the client. Please refer to 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for detailed information about this value. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer.
     * @type {Integer (Int32)}
     */
    static ratState => 24

    /**
     * Specifies a value that is provided to the NAS by the authentication provider. The NAS should use this value when communicating with the accounting provider. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratClass => 25

    /**
     * Allows vendors to provide their own extended attributes. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratVendorSpecific => 26

    /**
     * Specifies the maximum number of seconds for which to provide service to the user. After this time, the session is terminated. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratSessionTimeout => 27

    /**
     * Specifies the maximum number of consecutive seconds the session can be idle. If the idle time exceeds this value, the session is terminated. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratIdleTimeout => 28

    /**
     * Indicates what action the NAS should take when the
     *       specified service is completed.  It is only used in Access-Accept
     *       packets. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratTerminationAction => 29

    /**
     * Specifies the number that the user dialed to connect to the NAS. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratCalledStationId => 30

    /**
     * Specifies the number from which the user is calling. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratCallingStationId => 31

    /**
     * Specifies the NAS identifier. An Access-Request should specify either an NAS identifier or an NAS IP address. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratNASIdentifier => 32

    /**
     * Specifies a value that a proxy server includes when forwarding an authentication request. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratProxyState => 33

    /**
     * This attribute is not currently used for authentication on Windows. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratLoginLATService => 34

    /**
     * This attribute is not currently used for authentication on Windows. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratLoginLATNode => 35

    /**
     * This attribute is not currently used for authentication on Windows. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratLoginLATGroup => 36

    /**
     * Specifies the AppleTalk network number for a user that is another router. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratFramedAppleTalkLink => 37

    /**
     * Specifies the AppleTalk network number that the NAS should use to allocate an AppleTalk node for the user. This attribute is used only when the user is not another router. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratFramedAppleTalkNetwork => 38

    /**
     * Specifies the AppleTalk default zone for the user. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratFramedAppleTalkZone => 39

    /**
     * Specifies whether the accounting provider should start or stop accounting for the user. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratAcctStatusType => 40

    /**
     * Specifies the length of time that the client has been attempting to send the current request. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratAcctDelayTime => 41

    /**
     * Specifies the number of octets that have been received during the current accounting session. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratAcctInputOctets => 42

    /**
     * Specifies the number of octets sent during the current accounting session. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratAcctOutputOctets => 43

    /**
     * Specifies a value to enable the identification of matching start and stop records within a log file. The start and stop records are sent in the <b>ratAcctStatusType</b> attribute. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer. See 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratAcctSessionId => 44

    /**
     * Specifies, to the accounting provider, how the user was authenticated. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratAcctAuthentic => 45

    /**
     * Specifies the number of seconds that have elapsed in the current accounting session. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratAcctSessionTime => 46

    /**
     * Specifies the number of packets that have been received during the current accounting session. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratAcctInputPackets => 47

    /**
     * Specifies the number of packets that have been sent during the current accounting session. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratAcctOutputPackets => 48

    /**
     * Specifies how the current accounting session was terminated. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratAcctTerminationCause => 49

    /**
     * Specifies the CHAP challenge sent by the NAS to a CHAP user. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a pointer. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratCHAPChallenge => 60

    /**
     * Specifies the type of the port through which the user is connecting, for example, asynchronous, ISDN, virtual. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratNASPortType => 61

    /**
     * Specifies the number of ports the NAS should make available to the user for multilink sessions. The value field in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">RADIUS_ATTRIBUTE</a> for this type is a 32-bit integral value. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information
     * @type {Integer (Int32)}
     */
    static ratPortLimit => 62

    /**
     * Specifies either the tunneling protocol or protocols to be used (in
     *       the case of a tunnel initiator) or specifies the tunneling protocol in
     *       use (in the case of a tunnel terminator). See <a href="https://www.ietf.org/rfc/rfc2868.txt">RFC 2868</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratTunnelType => 64

    /**
     * Specifies the transport medium
     *       to use when creating a tunnel for protocols, such as L2TP,
     *       that can operate over multiple transports. See <a href="https://www.ietf.org/rfc/rfc2868.txt">RFC 2868</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratMediumType => 65

    /**
     * May contain a password to be used to authenticate
     *       to a remote server.  It may only be included in an Access-Accept
     *       packet.
     * @type {Integer (Int32)}
     */
    static ratTunnelPassword => 69

    /**
     * Specifies the group ID for a particular tunneled
     *       session.
     * @type {Integer (Int32)}
     */
    static ratTunnelPrivateGroupID => 81

    /**
     * Specifies the IPv6 Address of the NAS
     *       that requests authentication of the user. It should be
     *       unique to the NAS within the scope of the RADIUS server.  It is only used in an Access-Request packet. See the NAS-IPv6-Address section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratNASIPv6Address => 95

    /**
     * Specifies the IPv6 interface identifier to be
     *       configured for the user.  It may be used in an Access-Accept packet.
     *       See the Framed-Interface-Id section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratFramedInterfaceId => 96

    /**
     * Specifies an IPv6 prefix (and corresponding route)
     *       to be configured for the user.  It may be used in an Access-Accept
     *       packet and can appear multiple times.  See the Framed-IPv6-Prefix section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratFramedIPv6Prefix => 97

    /**
     * Specifies the system with which to connect the
     *       user, when the ratLoginService attribute is included.  It may be
     *       used in an Access-Accept packet.
     * See the Login-IPv6-Host section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratLoginIPv6Host => 98

    /**
     * Specifies routing information to be configured for
     *       the user on the NAS.  It is used in an Access-Accept packet and
     *       can appear multiple times.
     * See the Framed-IPv6-Route section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratFramedIPv6Route => 99

    /**
     * Specifies the name of an assigned pool that should
     *       be used to assign an IPv6 prefix for the user.  If a NAS does not
     *       support multiple prefix pools, the NAS must ignore this attribute.
     * 
     * See the Framed-IPv6-Pool section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a> for more information.
     * @type {Integer (Int32)}
     */
    static ratFramedIPv6Pool => 100

    /**
     * Specifies the request type code. This is an extended, read-only attribute, used only in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process">RadiusExtensionProcess</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process_ex">RadiusExtensionProcessEx</a> functions. Its contents can be interpreted by comparing it with <a href="https://docs.microsoft.com/windows/desktop/api/authif/ne-authif-radius_code">RADIUS_CODE</a> enumeration values.
     * @type {Integer (Int32)}
     */
    static ratCode => 262

    /**
     * Specifies the request identifier. This is an extended, read-only attribute.
     * @type {Integer (Int32)}
     */
    static ratIdentifier => 263

    /**
     * Specifies the request authenticator. This is an extended, read-only attribute.
     * @type {Integer (Int32)}
     */
    static ratAuthenticator => 264

    /**
     * Specifies the source IP address. This is an extended, read-only attribute.
     * @type {Integer (Int32)}
     */
    static ratSrcIPAddress => 265

    /**
     * Specifies the source IP port. This is an extended, read-only attribute.
     * @type {Integer (Int32)}
     */
    static ratSrcPort => 266

    /**
     * Specifies the authentication provider. The value for this attribute is taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ne-authif-radius_authentication_provider">RADIUS_AUTHENTICATION_PROVIDER</a> enumerated type. This is an extended, read-only attribute.
     * @type {Integer (Int32)}
     */
    static ratProvider => 267

    /**
     * Specifies the user name with the realm removed. See 
     * <a href="https://docs.microsoft.com/windows/desktop/Nps/ias-user-identification-attributes">User Identification Attributes</a> for more information. This is an extended attribute.
     * @type {Integer (Int32)}
     */
    static ratStrippedUserName => 268

    /**
     * Specifies the fully qualified user name. See 
     * <a href="https://docs.microsoft.com/windows/desktop/Nps/ias-user-identification-attributes">User Identification Attributes</a> for more information. This is an extended attribute.
     * @type {Integer (Int32)}
     */
    static ratFQUserName => 269

    /**
     * Specifies  a remote access  policy name. This is an extended attribute.
     * @type {Integer (Int32)}
     */
    static ratPolicyName => 270

    /**
     * Specifies a unique ID for the request. This is a read-only attribute.
     * @type {Integer (Int32)}
     */
    static ratUniqueId => 271

    /**
     * This attribute is used to pass state information between extensions.
     * @type {Integer (Int32)}
     */
    static ratExtensionState => 272

    /**
     * Specifies an EAP-TLV packet. For more information about the EAP-TLV packet format, see <a href="https://www.ee.oulu.fi/research/ouspg/frontier/sota/whitepaper-wots/specs/draft-josefsson-pppext-eap-tls-eap-07.txt">IETF EAP Working Draft</a>.
     * @type {Integer (Int32)}
     */
    static ratEAPTLV => 273

    /**
     * Specifies the reason code for a RADIUS Reject. For more information, see  <a href="https://docs.microsoft.com/windows/desktop/api/authif/ne-authif-radius_reject_reason_code">RADIUS_REJECT_REASON_CODE</a>.
     * @type {Integer (Int32)}
     */
    static ratRejectReasonCode => 274

    /**
     * Specifies the Connection Request Policy  Name that matched this RADIUS packet.
     * @type {Integer (Int32)}
     */
    static ratCRPPolicyName => 275

    /**
     * Specifies the remote RADIUS server group name for request forwarding.
     * 
     * If the Authentication indicated by <b>ratProvider</b> is a proxy, the extension DLL can change the <b>ratProviderName</b> to indicate which remote server group the request should be forwarded to.
     * @type {Integer (Int32)}
     */
    static ratProviderName => 276

    /**
     * Specifies the user password in clear text.
     * 
     * To support authorization databases using PEAP-MSChapv2, the extension DLL retrieves the user password from the database and sends it to NPS.
     * @type {Integer (Int32)}
     */
    static ratClearTextPassword => 277

    /**
     * Source IPv6 address. It is not a standard RADIUS attribute. It corresponds to the internal attribute <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-attributeid">IAS_ATTRIBUTE_CLIENT_IPv6_ADDRESS</a>. This is a read-only attribute.
     * @type {Integer (Int32)}
     */
    static ratSrcIPv6Address => 278

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ratCertificateThumbprint => 279
}
