#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import ".\DOT11_PHY_TYPE.ahk" { DOT11_PHY_TYPE }
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }
#Import ".\DOT11_AUTH_ALGORITHM.ahk" { DOT11_AUTH_ALGORITHM }
#Import ".\WLAN_AVAILABLE_NETWORK.ahk" { WLAN_AVAILABLE_NETWORK }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains an array of information about available networks.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_available_network_list
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_AVAILABLE_NETWORK_LIST {
    #StructPack 4

    /**
     * Contains the number of items in the <b>Network</b> member.
     */
    dwNumberOfItems : UInt32

    /**
     * The index of the current item.  The index of the first item is 0. <b>dwIndex</b> must be less than <b>dwNumberOfItems</b>.
     * 
     * This member is not used by the wireless service. Applications can use this member when processing individual networks in the   <b>WLAN_AVAILABLE_NETWORK_LIST</b>  structure. When an application passes this structure from one function to another, it can set the value of <b>dwIndex</b> to the index of the item currently being processed. This can help an application maintain state.  
     * 
     * <b>dwIndex</b> should always be initialized before use.
     */
    dwIndex : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_available_network">WLAN_AVAILABLE_NETWORK</a> structures containing interface information.
     */
    Network : WLAN_AVAILABLE_NETWORK[1]

}
