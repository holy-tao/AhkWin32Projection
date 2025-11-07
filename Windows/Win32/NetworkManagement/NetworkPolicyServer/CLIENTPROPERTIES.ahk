#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the CLIENTPROPERTIES type enumerate the properties of a RADIUS client. The SDO computer is the RADIUS server.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-clientproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class CLIENTPROPERTIES{

    /**
     * Specifies whether the RADIUS server checks for a digital signature.
     * 
     * <div class="alert"><b>Note</b>  If client and server use Extensible Authentication Protocol (EAP), then they use digital signatures regardless of this property.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static PROPERTY_CLIENT_REQUIRE_SIGNATURE => 1024

    /**
     * This value indicates that the property is not used at this time.
     * @type {Integer (Int32)}
     */
    static PROPERTY_CLIENT_UNUSED => 1025

    /**
     * The secret shared by both the RADIUS client and RADIUS server.
     * @type {Integer (Int32)}
     */
    static PROPERTY_CLIENT_SHARED_SECRET => 1026

    /**
     * The manufacturer of the Network Access Server (NAS), that is the RADIUS client.
     * @type {Integer (Int32)}
     */
    static PROPERTY_CLIENT_NAS_MANUFACTURER => 1027

    /**
     * The IP address of the RADIUS client.
     * @type {Integer (Int32)}
     */
    static PROPERTY_CLIENT_ADDRESS => 1028

    /**
     * Used by NPS user interface to indicate whether a RADIUS Client can receive NAP specific quarantine attributes.
     * @type {Integer (Int32)}
     */
    static PROPERTY_CLIENT_QUARANTINE_COMPATIBLE => 1029

    /**
     * Specifies if the RADIUS Client is enabled. If the RADIUS Client is not enabled, the configuration is present but it is not applied by NPS.
     * @type {Integer (Int32)}
     */
    static PROPERTY_CLIENT_ENABLED => 1030

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PROPERTY_CLIENT_SECRET_TEMPLATE_GUID => 1031
}
