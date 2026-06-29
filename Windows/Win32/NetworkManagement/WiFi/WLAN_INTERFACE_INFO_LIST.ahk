#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLAN_INTERFACE_STATE.ahk" { WLAN_INTERFACE_STATE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WLAN_INTERFACE_INFO.ahk" { WLAN_INTERFACE_INFO }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Array of NIC interface information.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_interface_info_list
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_INTERFACE_INFO_LIST {
    #StructPack 4

    /**
     * Contains the number of items in the <b>InterfaceInfo</b> member.
     */
    dwNumberOfItems : UInt32

    /**
     * The index of the current item.  The index of the first item is 0. <b>dwIndex</b> must be less than <b>dwNumberOfItems</b>.
     * 
     * This member is not used by the wireless service. Applications can use this member when processing individual interfaces in the  <b>WLAN_INTERFACE_INFO_LIST</b> structure. When an application passes this structure from one function to another, it can set the value of <b>dwIndex</b> to the index of the item currently being processed. This can help an application maintain state.  
     * 
     * <b>dwIndex</b> should always be initialized before use.
     */
    dwIndex : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_interface_info">WLAN_INTERFACE_INFO</a> structures containing interface information.
     */
    InterfaceInfo : WLAN_INTERFACE_INFO[1]

}
