#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values of the REMEDIATIONSERVERPROPERTIES enumeration type enumerate the properties of a remediation server.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-remediationserverproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct REMEDIATIONSERVERPROPERTIES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
