#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLAN_RATE_SET.ahk" { WLAN_RATE_SET }
#Import ".\DOT11_PHY_TYPE.ahk" { DOT11_PHY_TYPE }
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\WLAN_BSS_ENTRY.ahk" { WLAN_BSS_ENTRY }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }

/**
 * Contains a list of basic service set (BSS) entries.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetnetworkbsslist">WlanGetNetworkBssList</a> function retrieves the BSS list of the wireless network or networks on a given interface and returns this information in a <b>WLAN_BSS_LIST</b> structure. 
 * 
 * 
 * 
 * The <b>WLAN_BSS_LIST</b> structure may contain padding for alignment between the <b>dwTotalSize</b> member, the  <b>dwNumberOfItems</b> member, and the first <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_bss_entry">WLAN_BSS_ENTRY</a>  array entry in the <b>wlanBssEntries</b>  member. Padding for alignment may also be present between the <b>WLAN_BSS_ENTRY</b> array entries in the <b>wlanBssEntries</b> member. Any access to a <b>WLAN_BSS_ENTRY</b> array entry should assume padding may exist.
 * 
 * 
 * When the wireless LAN interface is also operating as  a Wireless Hosted Network , the BSS list will contain an entry for the BSS created for the Wireless Hosted Network.
 * 
 * 
 * 
 * Since the information is returned by the access point for an infrastructure BSS network or by the network peer for an independent BSS network (ad hoc network), the information returned should not be trusted. The <b>ulIeOffset</b> and <b>ulIeSize</b>  members in the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_bss_entry">WLAN_BSS_ENTRY</a> structure should be used to determine the maximum size of the information element data blob in the <b>WLAN_BSS_ENTRY</b> structure, not the data in the information element data blob.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_bss_list
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_BSS_LIST {
    #StructPack 8

    /**
     * The total size of this structure, in bytes.
     */
    dwTotalSize : UInt32

    /**
     * The number of items in the <b>wlanBssEntries</b> member.
     */
    dwNumberOfItems : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_bss_entry">WLAN_BSS_ENTRY</a> structures that contains information about a BSS.
     */
    wlanBssEntries : WLAN_BSS_ENTRY[1]

}
