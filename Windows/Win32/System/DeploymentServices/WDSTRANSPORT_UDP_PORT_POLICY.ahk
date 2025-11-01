#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/ne-wdstptmgmt-wdstransport_udp_port_policy
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDSTRANSPORT_UDP_PORT_POLICY{

    /**
     * @type {Integer (Int32)}
     */
    static WdsTptUdpPortPolicyDynamic => 0

    /**
     * @type {Integer (Int32)}
     */
    static WdsTptUdpPortPolicyFixed => 1
}
