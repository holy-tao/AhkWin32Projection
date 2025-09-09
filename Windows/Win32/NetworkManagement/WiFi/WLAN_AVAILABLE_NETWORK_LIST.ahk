#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk
#Include .\WLAN_AVAILABLE_NETWORK.ahk

/**
 * Contains an array of information about available networks.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_available_network_list
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_AVAILABLE_NETWORK_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Contains the number of items in the <b>Network</b> member.
     * @type {Integer}
     */
    dwNumberOfItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The index of the current item.  The index of the first item is 0. <b>dwIndex</b> must be less than <b>dwNumberOfItems</b>.
     * 
     * This member is not used by the wireless service. Applications can use this member when processing individual networks in the   <b>WLAN_AVAILABLE_NETWORK_LIST</b>  structure. When an application passes this structure from one function to another, it can set the value of <b>dwIndex</b> to the index of the item currently being processed. This can help an application maintain state.  
     * 
     * <b>dwIndex</b> should always be initialized before use.
     * @type {Integer}
     */
    dwIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_available_network">WLAN_AVAILABLE_NETWORK</a> structures containing interface information.
     * @type {Array<WLAN_AVAILABLE_NETWORK>}
     */
    Network{
        get {
            if(!this.HasProp("__NetworkProxyArray"))
                this.__NetworkProxyArray := Win32FixedArray(this.ptr + 8, 1, WLAN_AVAILABLE_NETWORK, "")
            return this.__NetworkProxyArray
        }
    }
}
