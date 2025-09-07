#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies which policy WDS transport services should use when allocating UDP ports.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/ne-wdstptmgmt-wdstransport_udp_port_policy
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDSTRANSPORT_UDP_PORT_POLICY{

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
