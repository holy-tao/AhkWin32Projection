#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values of the REMEDIATIONSERVERSPROPERTIES enumeration type enumerate the properties of a set of remediation server groups.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-remediationserversproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct REMEDIATIONSERVERSPROPERTIES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_REMEDIATIONSERVERS_SERVERGROUPS => 1026
}
