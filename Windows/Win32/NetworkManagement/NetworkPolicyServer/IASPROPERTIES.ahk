#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the IASPROPERTIES enumeration type enumerate properties related to NPS.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-iasproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class IASPROPERTIES{

    /**
     * The collection of RADIUS server groups.
     * @type {Integer (Int32)}
     */
    static PROPERTY_IAS_RADIUSSERVERGROUPS_COLLECTION => 1024

    /**
     * The collection of Network Access Policies (NAP).
     * @type {Integer (Int32)}
     */
    static PROPERTY_IAS_POLICIES_COLLECTION => 1025

    /**
     * The collection of profiles for the network access policies.
     * @type {Integer (Int32)}
     */
    static PROPERTY_IAS_PROFILES_COLLECTION => 1026

    /**
     * The collection of protocols used by NPS.
     * @type {Integer (Int32)}
     */
    static PROPERTY_IAS_PROTOCOLS_COLLECTION => 1027

    /**
     * The collection of auditors used by NPS.
     * @type {Integer (Int32)}
     */
    static PROPERTY_IAS_AUDITORS_COLLECTION => 1028

    /**
     * The collection of request handlers used by NPS.
     * @type {Integer (Int32)}
     */
    static PROPERTY_IAS_REQUESTHANDLERS_COLLECTION => 1029

    /**
     * The collection of Network Access Policies for connection request processing.
     * @type {Integer (Int32)}
     */
    static PROPERTY_IAS_PROXYPOLICIES_COLLECTION => 1030

    /**
     * The collection of profiles for connection request processing.
     * @type {Integer (Int32)}
     */
    static PROPERTY_IAS_PROXYPROFILES_COLLECTION => 1031

    /**
     * Used by the Remediation Server settings of NPS user interface.
     * @type {Integer (Int32)}
     */
    static PROPERTY_IAS_REMEDIATIONSERVERGROUPS_COLLECTION => 1032

    /**
     * Used by the System Health Validator Template settings of NPS user interface.
     * @type {Integer (Int32)}
     */
    static PROPERTY_IAS_SHVTEMPLATES_COLLECTION => 1033
}
