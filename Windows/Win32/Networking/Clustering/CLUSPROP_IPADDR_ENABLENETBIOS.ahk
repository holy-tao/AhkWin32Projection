#Requires AutoHotkey v2.0.0 64-bit

/**
 * When used with the CLUSPROP_DWORD structure, enables or disables the functionality of the EnableNetBIOS property of IP Address resources.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-clusprop_ipaddr_enablenetbios
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSPROP_IPADDR_ENABLENETBIOS{

    /**
     * Disable the functionality of the 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-addresses-enablenetbios">EnableNetBIOS</a> property.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_IPADDR_ENABLENETBIOS_DISABLED => 0

    /**
     * Enable the functionality of the 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-addresses-enablenetbios">EnableNetBIOS</a> property.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_IPADDR_ENABLENETBIOS_ENABLED => 1

    /**
     * Enable the functionality of the 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-addresses-enablenetbios">EnableNetBIOS</a> property if the NIC to 
 *        which the IP Address resource is bound has enabled NetBIOS.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_IPADDR_ENABLENETBIOS_TRACK_NIC => 2
}
