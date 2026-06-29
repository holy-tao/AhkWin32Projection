#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_QOS_CAPABILITIES {
    #StructPack 4

    bMSCSSupported : BOOL

    bDSCPToUPMappingSupported : BOOL

    bSCSSupported : BOOL

    bDSCPPolicySupported : BOOL

}
