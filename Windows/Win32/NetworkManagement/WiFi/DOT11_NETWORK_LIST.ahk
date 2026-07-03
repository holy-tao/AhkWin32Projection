#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }
#Import ".\DOT11_NETWORK.ahk" { DOT11_NETWORK }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }

/**
 * Contains a list of 802.11 wireless networks.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-dot11_network_list
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_NETWORK_LIST {
    #StructPack 4

    /**
     * Contains the number of items in the <b>Network</b> member.
     */
    dwNumberOfItems : UInt32

    /**
     * The index of the current item.  The index of the first item is 0. <b>dwIndex</b> must be less than <b>dwNumberOfItems</b>.
     * 
     * This member is not used by the wireless service. Applications can use this member when processing individual networks in the  <b>DOT11_NETWORK_LIST</b>  structure. When an application passes this structure from one function to another, it can set the value of <b>dwIndex</b> to the index of the item currently being processed. This can help an application maintain state.  
     * 
     * <b>dwIndex</b> should always be initialized before use.
     */
    dwIndex : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-dot11_network">DOT11_NETWORK</a> structures that contain 802.11 wireless network information.
     */
    Network : DOT11_NETWORK[1]

}
