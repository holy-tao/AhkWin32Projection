#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLAN_QOS_CAPABILITIES.ahk" { WLAN_QOS_CAPABILITIES }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_CONNECTION_QOS_INFO {
    #StructPack 4

    peerCapabilities : WLAN_QOS_CAPABILITIES

    bMSCSConfigured : BOOL

    bDSCPToUPMappingConfigured : BOOL

    ulNumConfiguredSCSStreams : UInt32

    ulNumConfiguredDSCPPolicies : UInt32

}
