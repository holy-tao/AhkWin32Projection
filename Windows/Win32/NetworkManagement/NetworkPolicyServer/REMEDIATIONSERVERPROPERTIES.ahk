#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the REMEDIATIONSERVERPROPERTIES enumeration type enumerate the properties of a remediation server.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-remediationserverproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class REMEDIATIONSERVERPROPERTIES extends Win32Enum{

    /**
     * IP address value for a Remediation Server. Used in Network Policy Server (NPS) user interface.
     * @type {Integer (Int32)}
     */
    static PROPERTY_REMEDIATIONSERVER_ADDRESS => 1024

    /**
     * Host-name for a Remediation Server. Used in NPS user interface.
     * @type {Integer (Int32)}
     */
    static PROPERTY_REMEDIATIONSERVER_FRIENDLY_NAME => 1025
}
