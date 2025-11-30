#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the REMEDIATIONSERVERGROUPPROPERTIES enumeration type enumerate the properties of a remediation server group.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-remediationservergroupproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class REMEDIATIONSERVERGROUPPROPERTIES extends Win32Enum{

    /**
     * The collection of servers in the remediation server group.
     * @type {Integer (Int32)}
     */
    static PROPERTY_REMEDIATIONSERVERGROUP_SERVERS_COLLECTION => 1024
}
