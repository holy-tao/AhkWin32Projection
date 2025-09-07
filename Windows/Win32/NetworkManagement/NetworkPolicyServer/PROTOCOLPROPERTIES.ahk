#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the PROTOCOLPROPERTIES enumeration type enumerate properties of an authentication protocol.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-protocolproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class PROTOCOLPROPERTIES{

    /**
     * The value is reserved for system use.
     * @type {Integer (Int32)}
     */
    static PROPERTY_PROTOCOL_REQUEST_HANDLER => 1026

    /**
     * This value is the default.
     * @type {Integer (Int32)}
     */
    static PROPERTY_PROTOCOL_START => 1027
}
