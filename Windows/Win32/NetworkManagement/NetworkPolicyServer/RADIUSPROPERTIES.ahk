#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the RADIUSPROPERTIES enumeration type enumerate properties of the Microsoft RADIUS protocol SDO.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-radiusproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class RADIUSPROPERTIES extends Win32Enum{

    /**
     * The TCP port used for RADIUS accounting.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUS_ACCOUNTING_PORT => 1027

    /**
     * The TCP port used for RADIUS authentication.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUS_AUTHENTICATION_PORT => 1028

    /**
     * The collection of clients for this RADIUS server.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUS_CLIENTS_COLLECTION => 1029

    /**
     * The collection of vendors for this RADIUS server.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUS_VENDORS_COLLECTION => 1030
}
