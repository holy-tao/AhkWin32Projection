#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * When used with the CLUSPROP_DWORD structure, enables or disables the functionality of the EnableNetBIOS property of IP Address resources.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-clusprop_ipaddr_enablenetbios
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSPROP_IPADDR_ENABLENETBIOS extends Win32Enum {

    /**
     * Disable the functionality of the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-addresses-enablenetbios">EnableNetBIOS</a> property.
     * Native name: CLUSPROP_IPADDR_ENABLENETBIOS_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 0

    /**
     * Enable the functionality of the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-addresses-enablenetbios">EnableNetBIOS</a> property.
     * Native name: CLUSPROP_IPADDR_ENABLENETBIOS_ENABLED
     * @type {Integer (Int32)}
     */
    static ENABLED => 1

    /**
     * Enable the functionality of the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-addresses-enablenetbios">EnableNetBIOS</a> property if the NIC to 
     *        which the IP Address resource is bound has enabled NetBIOS.
     * Native name: CLUSPROP_IPADDR_ENABLENETBIOS_TRACK_NIC
     * @type {Integer (Int32)}
     */
    static TRACK_NIC => 2
}
