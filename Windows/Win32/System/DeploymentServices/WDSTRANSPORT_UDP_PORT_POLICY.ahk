#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies which policy WDS transport services should use when allocating UDP ports.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/ne-wdstptmgmt-wdstransport_udp_port_policy
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct WDSTRANSPORT_UDP_PORT_POLICY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use Windows Sockets (Winsock) to get a dynamic UDP port.
     * @type {Integer (Int32)}
     */
    static WdsTptUdpPortPolicyDynamic => 0

    /**
     * Assign a fixed UDP port from a specified range of UDP ports.
     * @type {Integer (Int32)}
     */
    static WdsTptUdpPortPolicyFixed => 1
}
