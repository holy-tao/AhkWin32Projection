#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLAN_QOS_CAPABILITIES.ahk" { WLAN_QOS_CAPABILITIES }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WLAN_CONNECTION_QOS_INFO.ahk" { WLAN_CONNECTION_QOS_INFO }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_QOS_INFO {
    #StructPack 4

    interfaceCapabilities : WLAN_QOS_CAPABILITIES

    bConnected : BOOL

    connectionQoSInfo : WLAN_CONNECTION_QOS_INFO

}
