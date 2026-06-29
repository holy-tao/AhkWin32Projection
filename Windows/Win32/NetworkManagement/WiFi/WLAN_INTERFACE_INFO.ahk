#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLAN_INTERFACE_STATE.ahk" { WLAN_INTERFACE_STATE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about a wireless LAN interface.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_interface_info
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_INTERFACE_INFO {
    #StructPack 4

    /**
     * Contains the GUID of the interface.
     */
    InterfaceGuid : Guid

    /**
     * Contains the description of the interface.
     */
    strInterfaceDescription : WCHAR[256]

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_interface_state-r1">WLAN_INTERFACE_STATE</a> value that indicates the current state of the interface.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Only the <b>wlan_interface_state_connected</b>, <b>wlan_interface_state_disconnected</b>, and <b>wlan_interface_state_authenticating</b> values are supported.
     */
    isState : WLAN_INTERFACE_STATE

}
