#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines how Extended Protection is validated.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_extended_protection_scenario
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_EXTENDED_PROTECTION_SCENARIO{

    /**
     * There is no SSL connection between the client and the server, or the SSL connection is terminated at the server. This is the default.
     * @type {Integer (Int32)}
     */
    static WS_EXTENDED_PROTECTION_SCENARIO_BOUND_SERVER => 1

    /**
     * An SSL connection exists but is terminated at an intermediary. The connection between the intermediary and the server may or may not
 *                     use SSL. When this property is set, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_property_id">WS_SECURITY_PROPERTY_ID</a> must be set as well.
     * @type {Integer (Int32)}
     */
    static WS_EXTENDED_PROTECTION_SCENARIO_TERMINATED_SSL => 2
}
