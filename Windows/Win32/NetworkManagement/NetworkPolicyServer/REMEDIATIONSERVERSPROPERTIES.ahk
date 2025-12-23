#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the REMEDIATIONSERVERSPROPERTIES enumeration type enumerate the properties of a set of remediation server groups.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-remediationserversproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class REMEDIATIONSERVERSPROPERTIES extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PROPERTY_REMEDIATIONSERVERS_SERVERGROUPS => 1026
}
