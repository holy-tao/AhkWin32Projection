#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines settings that are used by WDS transport protocols to optimize data transfer on the network.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/ne-wdstptmgmt-wdstransport_network_profile_type
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDSTRANSPORT_NETWORK_PROFILE_TYPE extends Win32Enum{

    /**
     * Default value that indicates that the network profile is not known.
     * @type {Integer (Int32)}
     */
    static WdsTptNetworkProfileUnknown => 0

    /**
     * Indicates that the server should use the custom network profile. This is a profile whose settings can be directly modified by administrators if they need to further customize their settings rather than use one of the fixed, inbox profiles. Note that settings for this profile start with values identical to those of the 100-Mbps profile.
     * @type {Integer (Int32)}
     */
    static WdsTptNetworkProfileCustom => 1

    /**
     * Indicates that the server should use the 10-Mbps network profile, which is optimized for slow 10-Mbps networks.
     * @type {Integer (Int32)}
     */
    static WdsTptNetworkProfile10Mbps => 2

    /**
     * Indicates that the server should use the 100-Mbps network profile, which is optimized for mainstream 100-Mbps networks. This is the default profile selected for use on a freshly installed WDS server.
     * @type {Integer (Int32)}
     */
    static WdsTptNetworkProfile100Mbps => 3

    /**
     * Indicates that the server should use the 1-Gbps network profile, which is optimized for fast 1-Gbps or higher networks, such as those used in high-end data centers.
     * @type {Integer (Int32)}
     */
    static WdsTptNetworkProfile1Gbps => 4
}
