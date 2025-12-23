#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values in the RADIUSSERVERGROUPPROPERTIES enumeration type enumerate properties of a RADIUS server group.
 * @remarks
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-iasproperties">IASPROPERTIES</a> enumeration type contains the value PROPERTY_IAS_RADIUSSERVERGROUPS_COLLECTION, which corresponds to the collection of RADIUS server groups.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-radiusservergroupproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class RADIUSSERVERGROUPPROPERTIES extends Win32Enum{

    /**
     * The collection of servers in the RADIUS server group.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUSSERVERGROUP_SERVERS_COLLECTION => 1024
}
