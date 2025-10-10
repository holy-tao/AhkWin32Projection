#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the RADIUSSERVERPROPERTIES enumeration type enumerate the properties of the RADIUS server, that is the SDO computer.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-radiusserverproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class RADIUSSERVERPROPERTIES{

    /**
     * Comma separated list of the UDP ports over which RADIUS authentication packets are sent and received.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUSSERVER_AUTH_PORT => 1024

    /**
     * The shared secret for authentication.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUSSERVER_AUTH_SECRET => 1025

    /**
     * Comma separated list of the UDP ports over which RADIUS authentication packets are sent and received.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUSSERVER_ACCT_PORT => 1026

    /**
     * The shared secret for accounting.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUSSERVER_ACCT_SECRET => 1027

    /**
     * The IP address of the server, or a DNS name that corresponds to the server.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUSSERVER_ADDRESS => 1028

    /**
     * Specifies whether to forward, that is proxy, accounting packets.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUSSERVER_FORWARD_ACCT_ONOFF => 1029

    /**
     * Specifies the priority for server. Lower priorities have higher precedence.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUSSERVER_PRIORITY => 1030

    /**
     * Specifies the weight for the server. If two servers have the same priority, then weight is used to determine which server is used.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUSSERVER_WEIGHT => 1031

    /**
     * Specifies the timeout for the server.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUSSERVER_TIMEOUT => 1032

    /**
     * The number of packets that can be dropped in a row before the server is considered unavailable.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUSSERVER_MAX_LOST => 1033

    /**
     * Number of seconds that are waited before checking if an unavailable server is available again.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUSSERVER_BLACKOUT => 1034

    /**
     * Specifies whether the Message-Authenticator attribute of <a href="https://www.ietf.org/rfc/rfc3579.txt">RFC 3579</a>  is sent by the server or not. It is always sent for EAP authentications.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUSSERVER_SEND_SIGNATURE => 1035

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUSSERVER_AUTH_SECRET_TEMPLATE_GUID => 1036

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUSSERVER_ACCT_SECRET_TEMPLATE_GUID => 1037
}
