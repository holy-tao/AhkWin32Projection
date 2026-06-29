#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values of the REMEDIATIONSERVERGROUPPROPERTIES enumeration type enumerate the properties of a remediation server group.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-remediationservergroupproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct REMEDIATIONSERVERGROUPPROPERTIES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The collection of servers in the remediation server group.
     * @type {Integer (Int32)}
     */
    static PROPERTY_REMEDIATIONSERVERGROUP_SERVERS_COLLECTION => 1024
}
