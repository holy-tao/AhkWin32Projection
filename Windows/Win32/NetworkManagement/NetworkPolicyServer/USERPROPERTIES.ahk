#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the USERPROPERTIES enumeration type enumerate the user properties supported by the SDO API.
 * @remarks
 * 
 * The properties that are available for a user object depend on where the user object is stored.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-userproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class USERPROPERTIES{

    /**
     * The number from which the user must call.
     * @type {Integer (Int32)}
     */
    static PROPERTY_USER_CALLING_STATION_ID => 1024

    /**
     * The number stored in the user interface when calling-station ID is disabled.
     * @type {Integer (Int32)}
     */
    static PROPERTY_USER_SAVED_CALLING_STATION_ID => 1025

    /**
     * The number at which to callback this user.
     * @type {Integer (Int32)}
     */
    static PROPERTY_USER_RADIUS_CALLBACK_NUMBER => 1026

    /**
     * Specifies static routes assigned to this user.
     * @type {Integer (Int32)}
     */
    static PROPERTY_USER_RADIUS_FRAMED_ROUTE => 1027

    /**
     * Specifies a static IP address assigned to this user.
     * @type {Integer (Int32)}
     */
    static PROPERTY_USER_RADIUS_FRAMED_IP_ADDRESS => 1028

    /**
     * The callback number stored in the user interface when callback is disabled.
     * @type {Integer (Int32)}
     */
    static PROPERTY_USER_SAVED_RADIUS_CALLBACK_NUMBER => 1029

    /**
     * The routes stored in the user interface when static routes are disabled.
     * @type {Integer (Int32)}
     */
    static PROPERTY_USER_SAVED_RADIUS_FRAMED_ROUTE => 1030

    /**
     * The static IP address stored in the user interface when static IP addresses are disabled.
     * @type {Integer (Int32)}
     */
    static PROPERTY_USER_SAVED_RADIUS_FRAMED_IP_ADDRESS => 1031

    /**
     * Specifies whether dial-in allowed, denied, or determined by policy.
     * @type {Integer (Int32)}
     */
    static PROPERTY_USER_ALLOW_DIALIN => 1032

    /**
     * Specifies whether callback is enabled for this user. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_user_1">RAS_USER_1</a> for more information about the possible values for this property.
     * @type {Integer (Int32)}
     */
    static PROPERTY_USER_SERVICE_TYPE => 1033

    /**
     * Specifies routing information to be configured for
     *       the user on the NAS.  See the Framed-IPv6-Route section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a> for more information.
     * @type {Integer (Int32)}
     */
    static PROPERTY_USER_RADIUS_FRAMED_IPV6_ROUTE => 1034

    /**
     * Specifies saved routing information for
     *       the user on the NAS.  See the Framed-IPv6-Route section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a> for more information.
     * @type {Integer (Int32)}
     */
    static PROPERTY_USER_SAVED_RADIUS_FRAMED_IPV6_ROUTE => 1035

    /**
     * Used for IPv6. Specifies the interface identifier to be
     *       configured for the user.  See the Framed-Interface-Id section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a> for more information.
     * @type {Integer (Int32)}
     */
    static PROPERTY_USER_RADIUS_FRAMED_INTERFACE_ID => 1036

    /**
     * Used for IPv6. Specifies the saved interface identifier for the user.  See the Framed-Interface-Id section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a> for more information.
     * @type {Integer (Int32)}
     */
    static PROPERTY_USER_SAVED_RADIUS_FRAMED_INTERFACE_ID => 1037

    /**
     * Specifies an IPv6 prefix (and corresponding route)
     *       to be configured for the user.  See the Framed-IPv6-Prefix section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a> for more information.
     * @type {Integer (Int32)}
     */
    static PROPERTY_USER_RADIUS_FRAMED_IPV6_PREFIX => 1038

    /**
     * Specifies an IPv6 prefix (and corresponding route)
     *       saved for the user.  See the Framed-IPv6-Prefix section in <a href="https://www.ietf.org/rfc/rfc3162.txt">RFC 3162</a> for more information.
     * @type {Integer (Int32)}
     */
    static PROPERTY_USER_SAVED_RADIUS_FRAMED_IPV6_PREFIX => 1039
}
