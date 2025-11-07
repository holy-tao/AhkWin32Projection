#Requires AutoHotkey v2.0.0 64-bit

/**
 * The RADIUS_AUTHENTICATION_PROVIDER type enumerates the possible authentication providers that NPS can use.
 * @remarks
 * 
 * The <b>ratProvider</b> extended attribute in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ne-authif-radius_attribute_type">RADIUS_ATTRIBUTE_TYPE</a> uses values from the 
 * <b>RADIUS_AUTHENTICATION_PROVIDER</b> enumeration type.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//authif/ne-authif-radius_authentication_provider
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class RADIUS_AUTHENTICATION_PROVIDER{

    /**
     * The authentication provider is unknown.
     * @type {Integer (Int32)}
     */
    static rapUnknown => 0

    /**
     * A users' file  provides the authentication information.
     * @type {Integer (Int32)}
     */
    static rapUsersFile => 1

    /**
     * Authentication is provided by a RADIUS proxy server.
     * @type {Integer (Int32)}
     */
    static rapProxy => 2

    /**
     * Authentication is provided by Windows Domain Authentication.
     * @type {Integer (Int32)}
     */
    static rapWindowsNT => 3

    /**
     * Authentication is provided by a Microsoft Commercial Internet System (MCIS) database.
     * @type {Integer (Int32)}
     */
    static rapMCIS => 4

    /**
     * Authentication is provided by an Open Database Connectivity (ODBC) compliant database.
     * @type {Integer (Int32)}
     */
    static rapODBC => 5

    /**
     * Access is unauthenticated.
     * @type {Integer (Int32)}
     */
    static rapNone => 6
}
